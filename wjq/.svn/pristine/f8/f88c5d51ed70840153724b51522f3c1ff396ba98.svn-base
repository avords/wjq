package com.mvc.base.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;


@Entity(name = "B_COOPERATIVE_ENTERPRISE")
public class CooperativeEnterprise extends BaseEntity {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 9112428128358315080L;
	
	/*
	 * 出国留学
	 */
	public static final int SERVICE_TYPE_ABROADSTUDY = 1;
	/*
	 * 旅游度假
	 */
	public static final int SERVICE_TYPE_TOURISM = 2;
	/*
	 * 家政服务
	 */
	public static final int SERVICE_TYPE_HOUSEKEEPING = 3;
	/*
	 * 房产热区
	 */
	public static final int SERVICE_TYPE_HOUSE = 4;
	
	//1公司名
	@NotNull
	@Length(max=50)
	private  String company;
	//2公司网址
	@NotNull
	@Length(max=225)
	private  String companyURL;
	//3联系地址
	@NotNull
	@Length(max=128)
	private  String address;
	//4业内排名
	
	private  Integer rank;
	//5电子邮箱
	@NotNull
	@Length(max=128)
	private  String email;
	//6手机号码
	@NotNull
	@Length(max=11)
	private  String cellPhone;
	//7固定电话
	@Length(max=25)
	private  String telePhone;
	//8传真
	@Length(max=25)
	private  String fax;
	//9法人代表姓名
	@Length(max=100)
	private  String name;
	//10身份证号
	@NotNull
	@Length(max=18)
	private  String idCardNo;
	//13合作次数
	
	private  Integer cotimes;
	//14初次合作时间
	
	private Date firstTime;
	//15客户信息修订时间
	
	private Date modifyTime;
	//16本次合作时间
	
	private Date issueTime;
	//17信用评级(应该启用字典)
	private Integer creditRating;
	
	@Length(max=300)
	private String instruction;
	
	private Integer serviceType;
	
	private String pictureAddress;

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompanyURL() {
		return companyURL;
	}

	public void setCompanyURL(String companyURL) {
		this.companyURL = companyURL;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}

	public String getTelePhone() {
		return telePhone;
	}

	public void setTelePhone(String telePhone) {
		this.telePhone = telePhone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdCardNo() {
		return idCardNo;
	}

	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}

	public Integer getCotimes() {
		return cotimes;
	}

	public void setCotimes(Integer cotimes) {
		this.cotimes = cotimes;
	}

	public Date getFirstTime() {
		return firstTime;
	}

	public void setFirstTime(Date firstTime) {
		this.firstTime = firstTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Date getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(Date issueTime) {
		this.issueTime = issueTime;
	}

	public Integer getCreditRating() {
		return creditRating;
	}

	public void setCreditRating(Integer creditRating) {
		this.creditRating = creditRating;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public Integer getServiceType() {
		return serviceType;
	}

	public void setServiceType(Integer serviceType) {
		this.serviceType = serviceType;
	}

	public String getPictureAddress() {
		return pictureAddress;
	}

	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}
	
	
}
