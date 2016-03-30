package com.mvc.order.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

@Entity(name="O_Order")
public class Order extends BaseEntity {

	private static final long serialVersionUID = 875845965095518275L;
	/*
	 * 待付款
	 */
	public static final int ORDER_STATUS_WAIT_PAY =1;
	/*
	 * 已付定金
	 */
	public static final int ORDER_STATUS_DOWN_PAYMENT =2;
	/*
	 * 已付全款
	 */
	public static final int ORDER_STATUS_FULL_PAYMENT =3;
	/*
	 * 已完成
	 */
	public static final int ORDER_STATUS_COMPLETE =4;

	@NotNull
	@Length(max = 32)
	private String orderNumber;
	@NotNull
	private Long customerId;
	@NotNull
	private Date orderDate;
	@NotNull
	@Length(max = 32)
	private String consigneeName;  //收货人
	@NotNull
	@Length(max = 32)
	private String consigneePhone;
	@NotNull
	@Length(max = 128)
	private String consigneeAddress;
	@NotNull
	private Double deposit;  //订金
	@NotNull
	private Double amount;    //总金额
	@NotNull
	private Integer orderStatus;   //订单状态

	private Long checkPersonId;

	private Date confirmDate;
	@Length(max = 128)
	private String detail;  // 摘要 ：对应收入和支出的说明

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getConsigneeName() {
		return consigneeName;
	}

	public void setConsigneeName(String consigneeName) {
		this.consigneeName = consigneeName;
	}

	public String getConsigneePhone() {
		return consigneePhone;
	}

	public void setConsigneePhone(String consigneePhone) {
		this.consigneePhone = consigneePhone;
	}

	public String getConsigneeAddress() {
		return consigneeAddress;
	}

	public void setConsigneeAddress(String consigneeAddress) {
		this.consigneeAddress = consigneeAddress;
	}

	public Double getDeposit() {
		return deposit;
	}

	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Long getCheckPersonId() {
		return checkPersonId;
	}

	public void setCheckPersonId(Long checkPersonId) {
		this.checkPersonId = checkPersonId;
	}

	public Date getConfirmDate() {
		return confirmDate;
	}

	public void setConfirmDate(Date confirmDate) {
		this.confirmDate = confirmDate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
