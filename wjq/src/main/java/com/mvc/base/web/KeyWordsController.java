package com.mvc.base.web;



import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.base.model.KeyWords;
import com.mvc.base.service.KeyWordsManager;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.search.service.SensitivewordFilterManager;
import com.mvc.security.SecurityConstants;
import com.mvc.security.model.User;
import com.mvc.security.service.UserManager;

@Controller
@RequestMapping("keyword")
public class KeyWordsController extends PageController<KeyWords>{
	@Autowired
	private KeyWordsManager keyWordsManager;
	@Autowired
	private UserManager  userManager;
	@Autowired
	private SensitivewordFilterManager sensitivewordFilterManager;
	@Override
	public PageManager<KeyWords> getEntityManager() {
		return keyWordsManager;
	}

	@Override
	public String getFileBasePath() {
		return "base/";
	}
	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, KeyWords t) throws Exception {
    	HttpSession session = request.getSession();
    	Long userId= Long.parseLong((session.getAttribute(SecurityConstants.USER_ID)).toString()) ;
    	t.setCreateDate(new Date());
    	t.setCreateBy(userId);
    	getManager().save(t);
    	sensitivewordFilterManager.initKeyWord();
        return "redirect:edit/" + ((AbstractEntity) t).getObjectId() + getMessage("common.base.success", request)
                + "&" + appendAjaxParameter(request) + "&action=" + request.getParameter("action");
	}

	@Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
		getEntityManager().find(page);
		request.setAttribute("action", "page");
    	List<User> users=userManager.getAll();
    	request.setAttribute("users", users);
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}

    @Override
    protected String handleDelete(HttpServletRequest request, HttpServletResponse response, Long objectId)
            throws Exception {
        getManager().delete(objectId);
        sensitivewordFilterManager.initKeyWord();
        return "redirect:../page" + getMessage("common.base.deleted", request) + "&" + appendAjaxParameter(request);
    }

}
