package com.mvc.base.web;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.framework.util.ListUtils;

import com.mvc.base.model.CooperativeEnterprise;
import com.mvc.base.model.EnterpriseToService;
import com.mvc.base.model.ServiceDirection;
import com.mvc.base.service.CooperativeEnterpriseManager;
import com.mvc.base.service.EnterpriseToServiceManager;
import com.mvc.base.service.ServiceDirectionManager;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;


@Controller
@RequestMapping("/cooperativeEnterprise")
public class CooperativeEnterpriseController extends PageController<CooperativeEnterprise>{
	

	@Autowired
	private CooperativeEnterpriseManager  cooperativeEnterpriseManager;
	
	@Autowired
	private ServiceDirectionManager serviceDirectionManager;
	
	@Autowired
	private EnterpriseToServiceManager enterpriseToServiceManager;
	
	@Override
	public PageManager<CooperativeEnterprise> getEntityManager() {
		return cooperativeEnterpriseManager;
	}

	@Override
	public String getFileBasePath() {
	
		return "base/";
	}

	@RequestMapping("/viewCooperativeEnterprise/{objectId}")
	public String viewCooperativeEnterprise(HttpServletRequest request,@PathVariable Long objectId) {
		if (null != objectId) {
			CooperativeEnterprise cooperativeEnterprise = cooperativeEnterpriseManager.getByObjectId(objectId);
			request.setAttribute("entity", cooperativeEnterprise);
		}
		return getFileBasePath() + "viewCooperativeEnterprise";
	}
	
	@RequestMapping("/enterpriseService/{objectId}")
	public String editEnterpriseService(ModelMap modelMap,@PathVariable Long objectId) {
		CooperativeEnterprise cooperativeEnterprise = cooperativeEnterpriseManager.getByObjectId(objectId);
		List<ServiceDirection> allServiceDirections = serviceDirectionManager.getAll();
		List<EnterpriseToService> enterpriseToServices = enterpriseToServiceManager.getByEnterpriseId(objectId);
		List<ServiceDirection> haveServiceDirections =  new ArrayList<>();
		for(EnterpriseToService enterpriseToService : enterpriseToServices){
			ServiceDirection serviceDirection = serviceDirectionManager.getByObjectId(enterpriseToService.getServiceDirectionId());
			haveServiceDirections.add(serviceDirection);
		}
		List<ServiceDirection> notHaveServiceDirections = ListUtils.filter(allServiceDirections, haveServiceDirections);
		modelMap.addAttribute("allServiceDirections", allServiceDirections);
		modelMap.addAttribute("haveServiceDirections", haveServiceDirections);
		modelMap.addAttribute("notHaveServiceDirections", notHaveServiceDirections);
		modelMap.addAttribute("cooperativeEnterprise", cooperativeEnterprise);
		
		return getFileBasePath() + "editEnterpriseService";
	}

	@RequestMapping("/saveEnterpriseService")
	public String saveEnterpriseService(HttpServletRequest request, Long enterpriseId) {
		String[] serviceDirectionIds = request.getParameterValues("serviceDirectionId");
		enterpriseToServiceManager.saveServiceOperationByEnterpriseId(serviceDirectionIds, enterpriseId);
		return "redirect:/cooperativeEnterprise/enterpriseService/" + enterpriseId + getMessage("common.base.saveSuccess",request) + "&" + appendAjaxParameter(request);
	}
}
