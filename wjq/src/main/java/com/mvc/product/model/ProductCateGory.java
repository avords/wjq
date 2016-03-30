package com.mvc.product.model;


import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

//商品分类运营表
@Entity(name = "PRODUCT_PROD_CATEGORY")
public class ProductCateGory  extends BaseEntity {
	private static final long serialVersionUID = 1L;
	//父类ID
	private Long parentId;

	//分类名称
	@NotNull
	private String name;

	/*//状态(可用/不可用)
	@NotNull
	private Integer status;

	//层级
	private Integer level;

	//排序
	private Integer sort;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

		public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	*/

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
