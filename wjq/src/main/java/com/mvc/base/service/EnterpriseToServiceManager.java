package com.mvc.base.service;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.mvc.base.model.EnterpriseToService;
import com.mvc.framework.service.BaseService;
import com.mvc.security.service.RoleOperationManager;
@Service
public class EnterpriseToServiceManager extends BaseService<EnterpriseToService, Serializable>{

	private static final Logger LOGGER = Logger.getLogger(RoleOperationManager.class);
	
	public List<EnterpriseToService> getByEnterpriseId(Long enterpriseId){
		String sql = "select A from " + getActualArgumentType().getName() + " A"+" where A.enterpriseId= " +enterpriseId;
		return searchBySql(sql);
	}

	public int deleteRoleOperationByRoleId(Long serviceDirectionId) {
		return deleteByWhere("serviceDirectionId = " + serviceDirectionId);
	}
	
	public int deleteServiceOperationByEnterpriseId(Long enterpriseId) {
		return deleteByWhere("enterpriseId = " + enterpriseId);
	}
	
	public void saveServiceOperationByEnterpriseId(String[] serviceDirectionIds,Long enterpriseId) {
		deleteServiceOperationByEnterpriseId(enterpriseId);
		if (null!=serviceDirectionIds&&serviceDirectionIds.length > 0) {
			EnterpriseToService enterpriseToService;
			for (String serviceDirectionId : serviceDirectionIds) {
				try {
					enterpriseToService = new EnterpriseToService();
					enterpriseToService.setServiceDirectionId(Long.valueOf(serviceDirectionId));
					enterpriseToService.setEnterpriseId(enterpriseId);
					save(enterpriseToService);
                } catch (NumberFormatException e) {
                	LOGGER.error("saveServiceOperationByEnterpriseId",e);
                }
			}
		}
	}
}
