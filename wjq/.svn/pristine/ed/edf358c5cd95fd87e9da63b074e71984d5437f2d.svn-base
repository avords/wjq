package com.mvc.order.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

@Entity(name="O_Order_Details")
public class OrderDetails extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 412566544771269957L;

	@NotNull
	private Long orderID;
	
	@NotNull
	private Long productId;
	
	@NotNull
	private Integer quantity;

	public Long getOrderID() {
		return orderID;
	}

	public void setOrderID(Long orderID) {
		this.orderID = orderID;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
}
