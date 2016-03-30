package com.mvc.base.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.base.model.ServiceDirection;
import com.mvc.framework.service.BaseService;

@Service
public class ServiceDirectionManager extends BaseService<ServiceDirection, Serializable>{

	public List<ServiceDirection> getServiceByEnterpriseId(Long enterpriseId){
		String sql = "select A from " + getActualArgumentType().getName() + " A where 1=1 ";
		
		sql= sql+ " and A.objectId in ( select serviceDirectionId from B_ENTERPRISE_TO_SERVICE B where B.enterpriseId ="+ enterpriseId+")" ;
		return searchBySql(sql);
	}
}
