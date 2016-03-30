package com.mvc.cms.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

/**
 * 内容图片表
 */
@Entity(name="CMS_CONTENT_PICTURE")
public class ContentPicture implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = -7641733141650765065L;
	public static final String UPLOAD_ROOT = "upload";
	public static final String NEW_UPLOAD_ROOT="picture";
	public static final int CONTENT_FILE_NORMAL = 1;
	public static final int CONTENT_FILE_NEED_DELETE = 2;
	public static final int CONTENT_FILE_DELETED = 3;
	/**
	 *  内容ID
	 */
	@Id
	private Long contentId;
	@Id
	private Long fileId;
	@Length(max=64)
	private String picturePath;
	/**
	 *  排列顺序,值为0的表示单独配置的，正文里面的从1开始计数
	 */
	@NotNull
	private Integer orderId;

	/**
	 *  描述
	 */
	@Length(max=32)
	private String description;
	@Transient
	private String contentPath;
	@Transient
	private String contentTxt;
	@Transient
	private String contentTitle;



	public String getContentTxt() {
		return contentTxt;
	}
	public void setContentTxt(String contentTxt) {
		this.contentTxt = contentTxt;
	}
	public String getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	public Long getContentId() {
		return contentId;
	}
	public void setContentId(Long contentId) {
		this.contentId = contentId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getFileId() {
		return fileId;
	}
	public String getContentPath() {
		return contentPath;
	}
	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}
	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}
	public String getPicturePath() {
		return picturePath;
	}
	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}
}