package com.mvc.base.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import com.mvc.framework.model.BaseEntity;

@Entity(name = "B_LINKS")
public class Links extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8555089815262801957L;
	@Length(max=32)
	@NotNull
	private String websiteName;
	@Length(max=64)
	@NotNull
	private String websiteUrl;
	private Integer orders; // 显示链接的顺序
	@Length(max=128)
	private String description;
	@Length(max=128)
	private String pictureAddress; // 图片地址名称
	@NotNull
	private Integer pictureWidth;
	@NotNull
	private Integer pictureHeight;

	public String getPictureAddress() {
		return pictureAddress;
	}

	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}

	public Integer getPictureWidth() {
		return pictureWidth;
	}

	public void setPictureWidth(Integer pictureWidth) {
		this.pictureWidth = pictureWidth;
	}

	public Integer getPictureHeight() {
		return pictureHeight;
	}

	public void setPictureHeight(Integer pictureHeight) {
		this.pictureHeight = pictureHeight;
	}

	public String getWebsiteName() {
		return websiteName;
	}

	public void setWebsiteName(String websiteName) {
		this.websiteName = websiteName;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public Integer getOrders() {
		return orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
