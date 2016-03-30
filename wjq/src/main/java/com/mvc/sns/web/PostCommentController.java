package com.mvc.sns.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.base.model.CooperativeEnterprise;
import com.mvc.cms.model.Content;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Member;
import com.mvc.member.service.MemberManager;
import com.mvc.sns.model.Post;
import com.mvc.sns.model.PostComment;
import com.mvc.sns.service.PostCommentManager;
import com.mvc.sns.service.PostManager;

@Controller
@RequestMapping("postComment")
public class PostCommentController extends PageController<PostComment>{

	@Autowired
	private PostCommentManager postCommentManager;
	
	@Autowired
	private PostManager postManager;
	
	@Autowired
	private MemberManager memberManager;
	
	@Override
	public PageManager<PostComment> getEntityManager() {
		return postCommentManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "sns/";
	}
	
	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		List<Post> posts = postManager.getAll();
		List<Member> members = memberManager.getAll();
		request.setAttribute("members", members);
		request.setAttribute("posts", posts);
		return super.handlePage(request, page);
	}
	
	@RequestMapping(value = "/list")
	public String listComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Long postId=Long.parseLong(request.getParameter("postId"));
		PageSearch page  = preparePage(request);
   	    page.getFilters().add(new PropertyFilter(Content.class.getName(), "EQL_postId",String.valueOf(postId)));
        page.setSortOrder("asc");
        getEntityManager().find(page);
        request.setAttribute("action", "page");
        afterPage(request, page,0);
    	List<Post> posts = postManager.getAll();
		List<Member> members = memberManager.getAll();
		request.setAttribute("members", members);
		request.setAttribute("posts", posts);
        return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}

	@RequestMapping("/viewPostComment/{objectId}")
	public String viewPostComment(HttpServletRequest request,@PathVariable Long objectId) {
		if (null != objectId) {
			PostComment postComment = postCommentManager.getByObjectId(objectId);
			request.setAttribute("entity", postComment);
		}
		return getFileBasePath() + "viewPostComment";
	}
}
