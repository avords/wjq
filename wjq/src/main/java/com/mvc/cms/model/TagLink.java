package com.mvc.cms.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="CMS_TAG_LINK")
public class TagLink implements Serializable{

    private static final long serialVersionUID = 6269405838783611246L;
    @Id
	private Long tagId;
	@Id
	private Long linkItemId;
	//1:文章
	@Id
	private Integer type;

	public Long getLinkItemId() {
		return linkItemId;
	}
	public void setLinkItemId(Long linkItemId) {
		this.linkItemId = linkItemId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Long getTagId() {
		return tagId;
	}
	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}
}
