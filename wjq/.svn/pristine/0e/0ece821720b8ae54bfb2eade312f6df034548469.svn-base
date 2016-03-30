package com.mvc.sns.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

@Entity(name="SNS_POST_THEME")
public class PostTheme extends BaseEntity{
	private static final long serialVersionUID = 117552458915692232L;
	@NotNull
	@Length(max=30)
	private String name;

	@Length(max=225)
	private String picturePath;

	@NotNull
	private Date createDate;

	@Length(max=128)
	private String remark;

	@NotNull
	private Integer sortNo;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getSortNo() {
		return sortNo;
	}

	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}

}
