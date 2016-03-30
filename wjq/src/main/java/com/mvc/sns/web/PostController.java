package com.mvc.sns.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Member;
import com.mvc.member.service.MemberManager;
import com.mvc.sns.model.Post;
import com.mvc.sns.model.PostTheme;
import com.mvc.sns.service.PostCommentManager;
import com.mvc.sns.service.PostManager;
import com.mvc.sns.service.PostThemeManager;

@Controller
@RequestMapping("post")
public class PostController extends PageController<Post>{

	@Autowired
	private PostManager postManager;

	@Autowired
	private PostThemeManager postThemeManager;

	@Autowired
	private PostCommentManager postCommentManager;
	@Autowired
	private MemberManager memberManager;

	@Override
	public PageManager<Post> getEntityManager() {
		return postManager;
	}

	@Override
	public String getFileBasePath() {
		return "sns/";
	}
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Post post) throws Exception {
		if(post.getObjectId()==null){
			post.setCreateDate(new Date());
			post.setLatestReplyDate(new Date());
		}
		else {
			post.setLatestReplyDate(new Date());
		}
		return super.handleSave(request, modelMap, post);
	}

	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		List<PostTheme> postThemes = postThemeManager.getAll();
		List<Member> members = memberManager.getAll();

		request.setAttribute("members", members);
		request.setAttribute("postThemes", postThemes);
		return super.handlePage(request, page);
	}
	@Override
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		List<PostTheme> postThemes = postThemeManager.getAll();
		List<Member> members = memberManager.getAll();
		request.setAttribute("members", members);
		request.setAttribute("postThemes", postThemes);
		return super.handleEdit(request, response, objectId);
	}
	@Override
	public  String handleDelete(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		String where = "postId="+objectId;
		postCommentManager.deleteByWhere(where);
		return super.handleDelete(request, response, objectId);
	}

	@RequestMapping(value = "/isTop/{objectId}")
	protected String handleIsTop(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
			throws Exception {
		Post post = postManager.getByObjectId(objectId);
		if (post.getIsTop()==2) {
			postManager.isTop(objectId);
			postManager.update(objectId);
		}
		if (post.getIsTop()==1) {
			postManager.notTop(objectId);
			postManager.update(objectId);
		}
		return "redirect:../page" + getMessage("common.base.success", request) + "&" + appendAjaxParameter(request);
	}
	
	@RequestMapping("/viewPost/{objectId}")
	public String viewPost(HttpServletRequest request,@PathVariable Long objectId) {
		if (null != objectId) {
			Long memberId = postManager.getByObjectId(objectId).getMemberId();
			Long themeId = postManager.getByObjectId(objectId).getThemeId();
			
			Member member = memberManager.getByObjectId(memberId);
			PostTheme postTheme = postThemeManager.getByObjectId(themeId);
			Post post = postManager.getByObjectId(objectId);
			
			request.setAttribute("member", member);
			request.setAttribute("postTheme", postTheme);
			request.setAttribute("entity", post);
		}
		return getFileBasePath() + "viewPost";
	}
}
