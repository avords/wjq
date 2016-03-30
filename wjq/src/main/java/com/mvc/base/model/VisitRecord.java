package com.mvc.base.model;

import java.util.Date;

import javax.persistence.Entity;

import com.mvc.framework.model.BaseEntity;

@Entity(name="B_Visit_Record")
public class VisitRecord extends BaseEntity{
	private static final long serialVersionUID = 4969994347493901924L;
	public static final int VISIT_CONTENT = 1;//访问文章
	public static final int VISIT_STUDY_ABROAD = 2;//留学


	private String ip;
	private Long memberId;
	private Long visitObjectId;
	private Date visitDate;
	private Integer visitType;

	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public Long getVisitObjectId() {
		return visitObjectId;
	}
	public void setVisitObjectId(Long visitObjectId) {
		this.visitObjectId = visitObjectId;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	public Integer getVisitType() {
		return visitType;
	}
	public void setVisitType(Integer visitType) {
		this.visitType = visitType;
	}
}
