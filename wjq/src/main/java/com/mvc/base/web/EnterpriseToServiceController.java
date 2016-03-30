package com.mvc.base.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.base.model.EnterpriseToService;
import com.mvc.base.service.EnterpriseToServiceManager;
import com.mvc.base.service.ServiceDirectionManager;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.security.model.RoleOperation;

@Controller
@RequestMapping("enterpriseToService")
public class EnterpriseToServiceController extends PageController<EnterpriseToService>{
	
	@Autowired
	private EnterpriseToServiceManager enterpriseToServiceManager;
	
	@Autowired
	private ServiceDirectionManager  serviceDirectionManager;
	
	@Override
	public PageManager<EnterpriseToService> getEntityManager() {
		return enterpriseToServiceManager;
	}
	
	@Override
	public String getFileBasePath() {
		return "base/";
	}
}
