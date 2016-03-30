package com.mvc.product.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

//商品图片表
@Entity(name = "PRODUCT_PROD_PICTURE")
public class ProductPicture  extends BaseEntity {

    private static final long serialVersionUID = -4095947928330071174L;

    //商品id
	@NotNull
	private Long productId;

	//商品图片地址
	@NotNull
	private String address;


	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
