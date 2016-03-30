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
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.framework.web.WebServiceResult;
import com.mvc.sns.model.Post;
import com.mvc.sns.model.PostTheme;
import com.mvc.sns.service.PostManager;
import com.mvc.sns.service.PostThemeManager;

@Controller
@RequestMapping("postTheme")
public class PostThemeController extends PageController<PostTheme>{
	
	@Autowired
	private PostThemeManager postThemeManager;
	@Autowired
	private PostManager postManager;
	
	@Override
	public PageManager<PostTheme> getEntityManager() {
		return postThemeManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "sns/";
	}
	
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, PostTheme theme) throws Exception {
		if(theme.getObjectId()==null){
			theme.setCreateDate(new Date());
		}
		getManager().save(theme);
		return "redirect:edit/" + ((AbstractEntity) theme).getObjectId() + getMessage("common.base.success", request);
	}
	
	@Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
		page.setSortProperty("sortNo");
	    page.setSortOrder("asc");
		return super.handlePage(request, page);
	}
	
	@Override
    public String jsonDelete(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
			throws Exception {
		WebServiceResult result = new WebServiceResult();
		List<Post> posts=postManager.searchAllPost(null, objectId, null, null, null);
		if(posts.size()==0){
			try{
				getManager().delete(objectId);
				result.setResult("true");
			}catch(Exception e){
				result.setResult("false");
			}
		}else{
			result.setResult("false");
		}

		return result.toJson();
	}
}
