package com.mvc.base.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

@Entity(name = "B_ENTERPRISE_TO_SERVICE")
public class EnterpriseToService extends BaseEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -266620718252025079L;
	
	@NotNull
	private Long enterpriseId;
	@NotNull
	private Long serviceDirectionId;

	public Long getEnterpriseId() {
		return enterpriseId;
	}

	public void setEnterpriseId(Long enterpriseId) {
		this.enterpriseId = enterpriseId;
	}

	public Long getServiceDirectionId() {
		return serviceDirectionId;
	}

	public void setServiceDirectionId(Long serviceDirectionId) {
		this.serviceDirectionId = serviceDirectionId;
	}

}
