package com.mvc.base.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

@Entity(name="B_SERVICE_DIRECTION")
public class ServiceDirection extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4887617553932795122L;
	
	@NotNull
	@Length(max=10)
	private String serviceName;
	
	private String icon;//图标
	
	private Date createDate;
	
	private Integer isDelete;
	
	@Length(max=128)
	private String remark;
	
	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}


	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
