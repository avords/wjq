package com.mvc.base.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.base.model.ServiceDirection;
import com.mvc.base.service.ServiceDirectionManager;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;

@Controller
@RequestMapping("serviceDirection")
public class ServiceDirectionController extends PageController<ServiceDirection>{

	@Autowired
	private ServiceDirectionManager serviceDirectionManager;
	
	@Override
	public PageManager<ServiceDirection> getEntityManager() {
		return serviceDirectionManager;
	}

	@Override
	public String getFileBasePath() {
		return "base/";
	}

	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, ServiceDirection serviceDirection) throws Exception {
		if(serviceDirection.getObjectId()==null){
			serviceDirection.setCreateDate(new Date());
		}
		return super.handleSave(request, modelMap, serviceDirection);
	}
	
	@Override
	protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		if (null != objectId) {
			ServiceDirection entity = serviceDirectionManager.getByObjectId(objectId);
			entity.setCreateDate(new Date());
			serviceDirectionManager.save(entity);
			request.setAttribute("entity", entity);
		}
		return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
	}
}
