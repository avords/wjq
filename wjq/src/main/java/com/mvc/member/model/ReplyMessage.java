package com.mvc.member.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

@Entity(name="M_REPLY_MESSAGE_BOARD")
public class ReplyMessage extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8603970970446440901L;
	@NotNull
	private String content;//回复留言的内容
	@NotNull
	private Date replydate;//回复留言的时间
	@NotNull
	private String title;//回复的主题
	@NotNull
	private Long replymemberId;//回复留言账户的账号
	private String headPortrait;//回复留言用户的头像
	@NotNull
	private Long memberId;//相应的留言账号
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getReplydate() {
		return replydate;
	}
	public void setReplydate(Date replydate) {
		this.replydate = replydate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getReplymemberId() {
		return replymemberId;
	}
	public void setReplymemberId(Long replymemberId) {
		this.replymemberId = replymemberId;
	}
	public String getHeadPortrait() {
		return headPortrait;
	}
	public void setHeadPortrait(String headPortrait) {
		this.headPortrait = headPortrait;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	
	
}
