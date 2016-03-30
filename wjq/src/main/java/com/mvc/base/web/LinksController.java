package com.mvc.base.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.base.model.Links;
import com.mvc.base.service.LinksManager;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;

@Controller
@RequestMapping("links")
public class LinksController extends PageController<Links> {

	@Autowired
	private LinksManager linksManager;

	@Override
	public PageManager<Links> getEntityManager() {
		return linksManager;
	}

	@Override
	public String getFileBasePath() {
		return "base/";
	}

	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap,
			Links t) throws Exception {
		linksManager.save(t);
		return "redirect:/links/edit/" + t.getObjectId() + "?message=success";
	}

	@RequestMapping("/viewLogo/{objectId}")
	public String viewAdvert(HttpServletRequest request,
			@PathVariable Long objectId) {
		if (null != objectId) {
			Links links = linksManager.getByObjectId(objectId);
			request.setAttribute("entity", links);
		}
		return getFileBasePath() + "viewLogoFile";
	}
	
	@Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
		page.setSortProperty("orders");
	    page.setSortOrder("asc");
		return super.handlePage(request, page);
	}
}
