package com.mvc.member.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;


@Entity(name="B_MEMBER")
public class Member extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 230505289995335654L;
	
	public static final int STATUS_NORMAL=1;
	
	public static final int STATUS_ABNORMAL=0;
		
	//1用户名
	@NotNull
	@Length(max=30)
	private String loginName;
	//2真实姓名
	@Length(max=30)
	private String name;
	//3性别
	
	private Integer sex;
	//4密码口令

	@Length(min=6,max=40)
	private String password;
	//5手机号码
	@Length(max=11)
	private String cellPhone;
	//6微信号
	@Length(max=128)
	private  String weChatNu;
	
	@Length(max=25)
	private  String fax;
	//8邮政编码
	@Length(max=25)
	private String zip;
	//9所属省市
	@Length(max=128)
	private String areaCode;
	//10联系地址
	@Length(max=128)
	private String address;
	//11邮箱
	@NotNull
	@Length(max=128)
	private String email;
	//12身份证号
	@Length(max=18)
	private String idCardNo;
	//13护照号
	@Length(max=128)
	private String passpordNo;
	//14出生日期
	
	private Date  birthday;
	//15用户状态
	
	private Integer status;
	//16会员等级
	
	private Integer memberRank;
    //17所在公司
	@Length(max=50)
	private String company;
	//18信用评级(应该启用字典)
	
	private Integer creditRating;
	//19服务类型(应该设字典)
	
	private Integer serviceType;
	//20备注
	
	private Date createDate;
	
	@Length(max=300)
	private String remark;
	
	private String pictureAddress;
	
	public String getPictureAddress() {
		return pictureAddress;
	}
	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	public String getWeChatNu() {
		return weChatNu;
	}
	public void setWeChatNu(String weChatNu) {
		this.weChatNu = weChatNu;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdCardNo() {
		return idCardNo;
	}
	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}
	public String getPasspordNo() {
		return passpordNo;
	}
	public void setPasspordNo(String passpordNo) {
		this.passpordNo = passpordNo;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getMemberRank() {
		return memberRank;
	}
	public void setMemberRank(Integer memberRank) {
		this.memberRank = memberRank;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Integer getCreditRating() {
		return creditRating;
	}
	public void setCreditRating(Integer creditRating) {
		this.creditRating = creditRating;
	}
	public Integer getServiceType() {
		return serviceType;
	}
	public void setServiceType(Integer serviceType) {
		this.serviceType = serviceType;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
