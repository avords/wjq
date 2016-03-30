package com.mvc.cms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;
/**
 * 内容正文
 */
@Entity(name="CMS_CONTENT_TXT")
public class ContentTxt extends BaseEntity {
	/**
	 *
	 */
	private static final long serialVersionUID = -8001018528563184301L;
	public static final ContentTxt NULL = new ContentTxt();
	static{
		NULL.setTxt("");
	}

	@NotNull
    @Column(columnDefinition="MEDIUMTEXT")
	private String txt;

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}


	@NotNull
	private Long contentId;

	public Long getContentId() {
		return contentId;
	}

	public void setContentId(Long contentId) {
		this.contentId = contentId;
	}
}
