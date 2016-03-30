package com.mvc.cms.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.service.ChannelManager;
import com.mvc.cms.service.ContentManager;
import com.mvc.component.file.BaseFileManager;
import com.mvc.config.ApplicationConfig;
import com.mvc.framework.FrameworkConstants;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.ListUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.UploadFile;
import com.mvc.framework.web.FrameworkFactory;
import com.mvc.framework.web.PageController;
import com.mvc.security.SecurityConstants;
import com.mvc.security.model.Role;
import com.mvc.security.model.User;
import com.mvc.security.service.RoleManager;
import com.mvc.security.service.UserManager;

/**
 * 内容
 */
@Controller
@RequestMapping("/content")
public class ContentController extends PageController<Content>{
	@Autowired
	private ContentManager contentManager;
	@Autowired
	private ChannelManager channelManager;

	@Autowired
	private RoleManager roleManager;
	@Autowired
	private UserManager userManager;

	@Override
	public PageManager<Content> getEntityManager() {
		return contentManager;
	}
	@Override
	public String getFileBasePath() {
		return "cms/";
	}

	protected String handlePage(HttpServletRequest request, PageSearch page) {
		Long userId = (Long)request.getSession().getAttribute(SecurityConstants.USER_ID);
		getEntityManager().find(page);
		List<Channel> channels = channelManager.getAll();
		List<User> examine = contentManager.getUserByExamine();
		List<User> common = contentManager.getUserByCommon();
		List<User> users = userManager.getAll();
		request.setAttribute("examine", examine);
		request.setAttribute("common", common);
		request.setAttribute("users", users);
		request.setAttribute("channels", channels);
		List<Role> roles = roleManager.getRolesByUserId(userId);
		for(Role role : roles){
			if("普通会员".equals(role.getName())){
				request.setAttribute("userType", Content.COMMON_PEOPLE);
			}else if("审核人员".equals(role.getName())){
				request.setAttribute("userType", Content.CHECK_PEOPLE);
			}else if("发布人员".equals(role.getName())){
				request.setAttribute("userType", Content.PUBLISH_PEOPLE);
			}else if("终审人员".equals(role.getName())){
				request.setAttribute("userType", Content.CHECK_END_PEOPLE);
			}
		}
		request.setAttribute("userId", userId);
		return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
	}
	
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long id) throws Exception {
		List<Channel> haveMenus = new ArrayList<Channel>(0);
		if (null != id) {
			Content entity = contentManager.getContentWithTxt(id);
			request.setAttribute("entity", entity);
			haveMenus = channelManager.getContentChannels(entity.getObjectId());
		}
		Long userId = (Long)request.getSession().getAttribute(SecurityConstants.USER_ID);
		List<Channel> allChannels = null;
		allChannels = channelManager.getAll();
		@SuppressWarnings("unchecked")
		List<Channel> notHaveMenus = ListUtils.filter(allChannels, haveMenus);
		
		//根据用户角色分配权限
		List<Role> roles = roleManager.getRolesByUserId(userId);
		for(Role role : roles){
			if("普通会员".equals(role.getName())){
				request.setAttribute("userType", Content.COMMON_PEOPLE);
			}else if("审核人员".equals(role.getName())){
				request.setAttribute("userType", Content.CHECK_PEOPLE);
			}else if("发布人员".equals(role.getName())){
				request.setAttribute("userType", Content.PUBLISH_PEOPLE);
			}else if("终审人员".equals(role.getName())){
				request.setAttribute("userType", Content.CHECK_END_PEOPLE);
			}
		}
		request.setAttribute("haveMenus", haveMenus);
		request.setAttribute("notHaveMenus", notHaveMenus);
		return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
	}
	
	protected String handleView(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		request.setAttribute(FrameworkConstants.VIEW, "1");
		List<Channel> haveMenus = new ArrayList<Channel>(0);
		if (null != objectId) {
			Content entity = contentManager.getContentWithTxt(objectId);
			request.setAttribute("entity", entity);
			haveMenus = channelManager.getContentChannels(objectId);

		}
		Long userId = (Long)request.getSession().getAttribute(SecurityConstants.USER_ID);
		List<Channel> allChannels = new ArrayList<Channel>(0);
		allChannels = channelManager.getAll();;
		
		@SuppressWarnings("unchecked")
		List<Channel> notHaveMenus = ListUtils.filter(allChannels, haveMenus);
		//根据用户角色分配权限
		List<Role> roles = roleManager.getRolesByUserId(userId);
		for(Role role : roles){
			if("普通会员".equals(role.getName())){
				request.setAttribute("userType", Content.COMMON_PEOPLE);
			}else if("审核人员".equals(role.getName())){
				request.setAttribute("userType", Content.CHECK_PEOPLE);
			}else if("发布人员".equals(role.getName())){
				request.setAttribute("userType", Content.PUBLISH_PEOPLE);
			}else if("终审人员".equals(role.getName())){
				request.setAttribute("userType", Content.CHECK_END_PEOPLE);
			}
		}
		request.setAttribute("haveMenus", haveMenus);
		request.setAttribute("notHaveMenus", notHaveMenus);
		return getFileBasePath() + "view" + getActualArgumentType().getSimpleName();
	}
	
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Content t) throws Exception {
		String[] menuIds = request.getParameterValues("menuId");
		String[] newMenuIds = null;
		if(menuIds!=null){
			newMenuIds = new String[menuIds.length+1];
			for(int i = 0 ; i <menuIds.length ; i++){
				newMenuIds[i] = menuIds[i];
			}
		}else{
			menuIds = new String[0];
			newMenuIds = new String[1];
		}
		
		if(t.getUserId() == null){
			Long userId = (Long)request.getSession().getAttribute(SecurityConstants.USER_ID);
			User user = userManager.getUserByUserId(userId);
			t.setUserId(userId);
			t.setDepartmentId(user.getDepartmentId());
		}
		if(t.getObjectId()!=null){
			t.setStatus(Content.CONTENT_STATUS_WAIT_CHECK);
		}else{
			t.setStatus(Content.CONTENT_STATUS_DRAFT);
		}
		contentManager.save(t,newMenuIds);
		return "redirect:edit/" + ((AbstractEntity) t).getObjectId() + getMessage("common.base.success", request) ;
	}

	protected String handleDelete(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		contentManager.delete(objectId);;
		return "redirect:../page" + getMessage("common.base.deleted", request) + "&" + appendAjaxParameter(request);
	}
	
	@RequestMapping("/check/{contentId}")
	public String check(HttpServletRequest request,ModelMap modelMap,@PathVariable Long contentId,int status) throws Exception {
		Content content = contentManager.getByObjectId(contentId);
		content.setStatus(status+1);
		if(status==Content.CONTENT_STATUS_END_PASSED){
			content.setPublishDate(new Date());
		}
		contentManager.save(content);
		String url="";
		if(status==Content.CONTENT_STATUS_END_PASSED){
			url="redirect:/content/publish/page";
		}else if(status==Content.CONTENT_STATUS_PASSED){
			url="redirect:/content/recheck/page";
		}else if(status==Content.CONTENT_STATUS_WAIT_CHECK){
			url="redirect:/content/check/page";
		}
		return url;
	}
	
	 @RequestMapping(value = "/check/page")
	 public String checkPage(HttpServletRequest request,
				Integer backPage) throws Exception {
		 	PageSearch page  = preparePage(request);
	   	    String status=""+Content.CONTENT_STATUS_WAIT_CHECK;
	   	    page.getFilters().add(new PropertyFilter(Content.class.getName(), "EQI_status",status));
	        page.setSortOrder("desc");
	        getEntityManager().find(page);
	        request.setAttribute("action", "/content/check/page");
	        request.setAttribute("status", status);
	        afterPage(request, page,backPage);
	    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
	 }
	
	 @RequestMapping(value = "/recheck/page")
	 public String recheckPage(HttpServletRequest request,
				Integer backPage) throws Exception {
			PageSearch page  = preparePage(request);
	   	    String status=""+Content.CONTENT_STATUS_PASSED;
	   	    page.getFilters().add(new PropertyFilter(Content.class.getName(), "EQI_status",status));
	        page.setSortOrder("desc");
	        getEntityManager().find(page);
	        request.setAttribute("action", "/content/recheck/page");
	        request.setAttribute("status", status);
	        afterPage(request, page,backPage);
	    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
	 }
	 
	 @RequestMapping(value = "/publish/page")
	 public String publishPage(HttpServletRequest request,
				Integer backPage) throws Exception {
		 	PageSearch page  = preparePage(request);
	   	    String status=""+Content.CONTENT_STATUS_END_PASSED;
	   	    page.getFilters().add(new PropertyFilter(Content.class.getName(), "EQI_status",status));
	        page.setSortOrder("desc");
	        getEntityManager().find(page);
	        request.setAttribute("action", "/content/publish/page");
	        request.setAttribute("status", status);
	        afterPage(request, page,backPage);
	    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
	 }
	 
	 @RequestMapping("/check/list")
	 public String checkList(HttpServletRequest request,Integer backPage) throws Exception{
	   	    PageSearch page  = preparePage(request);
	   	    String status=request.getParameter("status");
	   	    page.getFilters().add(new PropertyFilter(Content.class.getName(), "EQI_status",status));
	        page.setSortOrder("desc");
	        getEntityManager().find(page);
	        request.setAttribute("status", status);
	        afterPage(request, page,backPage);
	    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
	   }
	 
	 	@RequestMapping(value = "/uploadImage")
		@ResponseBody
		public Map<String, String> uploadImage(HttpServletRequest request) throws Exception {
			UploadFile uploadFile=FileUpDownUtils.getUploadFile(request,"uploadFile");
			BaseFileManager baseFileManager = FrameworkFactory.getBaseFileManager();
			String fileExtention = uploadFile.getFileName().substring(uploadFile.getFileName().lastIndexOf("."));
			String fileName = baseFileManager.getNewFileId() + fileExtention;
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			String path = ApplicationConfig.getImageUploadFolder() + File.separator + dateFormat.format(new Date()) + File.separator + fileName;
			FileUtils.copyFile(uploadFile.getFile(), new File(path));
			
			String imageSrc = "/picture/" + dateFormat.format(new Date()) + "/" + fileName;
			Map<String, String> modelMap=new HashMap<String,String>();
			modelMap.put("imageSrc", imageSrc);
			return modelMap;
		} 
	 	
	 	@RequestMapping("/submit/{contentId}")
		public String submit(HttpServletRequest request,ModelMap modelMap,@PathVariable Long contentId) throws Exception {
			Content content = contentManager.getByObjectId(contentId);
			content.setStatus(Content.CONTENT_STATUS_WAIT_CHECK);
			contentManager.save(content);
			return "redirect:../edit/" + ((AbstractEntity) content).getObjectId() + getMessage("common.base.success", request) ;
		}
	 	
	 	@RequestMapping("/back/{status}")
		public String back(HttpServletRequest request,ModelMap modelMap,@PathVariable int status) throws Exception {
			String url="";
			if(status==Content.CONTENT_STATUS_END_PASSED){
				url="redirect:/content/publish/page";
			}else if(status==Content.CONTENT_STATUS_PASSED){
				url="redirect:/content/recheck/page";
			}else if(status==Content.CONTENT_STATUS_WAIT_CHECK){
				url="redirect:/content/check/page";
			}
			return url;
		}
}
