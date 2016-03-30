package com.mvc.cms.model;

import javax.persistence.Entity;

import com.mvc.framework.model.BaseEntity;

/**
 * 栏目内容关联表
 */
@Entity(name="CMS_CONTENT_CHANNEL")
public class ContentChannel extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3290743470104943200L;
	/**
	 *  栏目ID
	 */
	private Long channelId;
	/**
	 *  内容ID
	 */
	private Long contentId;

	public Long getChannelId(){
		return channelId;
	}

	public Long getContentId(){
		return contentId;
	}
	public void setChannelId(Long channelId){
		this.channelId = channelId;
	}

	public void setContentId(Long contentId){
		this.contentId = contentId;
	}
}