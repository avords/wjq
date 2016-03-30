package com.mvc.cms.service;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.cms.model.SystemConfig;
import com.mvc.framework.service.BaseService;
@Service
public class SystemConfigManager extends BaseService<SystemConfig, Long> {

	public SystemConfig queryVisitorBean() {
		List<SystemConfig> counts=getAll();
		if(counts!=null&&counts.size()>0){
			return counts.get(0);
		}
		return null;
	}

	public void updateVisitorCount(SystemConfig countBean) {
		String sql = "UPDATE b_system_config SET COUNT=COUNT+1";
		Session session = getSession();
		session.createSQLQuery(sql).executeUpdate();
	}

}
