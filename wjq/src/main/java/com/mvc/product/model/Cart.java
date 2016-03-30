package com.mvc.product.model;

import javax.persistence.Entity;

import com.mvc.framework.model.BaseEntity;

//购物车
@Entity(name = "PRODUCT_CART")
public class Cart extends BaseEntity {
	private static final long serialVersionUID = 1L;

	private Long productId;//商品编号

	private Long userId;//用户编号

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

}
