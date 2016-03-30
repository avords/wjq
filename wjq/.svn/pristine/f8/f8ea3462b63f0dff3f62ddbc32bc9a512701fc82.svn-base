package com.mvc.sns.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;
import com.mvc.member.model.Member;

@Entity(name="SNS_POST_COMMENT")
public class PostComment extends BaseEntity{
	private static final long serialVersionUID = -8766748734544375706L;

	@NotNull
	private Long postId;
	@NotNull
	private Long commentatorId;
	@NotNull
	@Length(max=50)
	private String commentatorName;
	@NotNull
	@Column(columnDefinition="TEXT")
	private String content;
	@NotNull
	private Date createDate;
	
	@Transient
	private Member member;
	@Transient //回复多少楼
	private Integer levelCount;
	
	public Integer getLevelCount() {
		return levelCount;
	}
	public void setLevelCount(Integer levelCount) {
		this.levelCount = levelCount;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	public Long getCommentatorId() {
		return commentatorId;
	}
	public void setCommentatorId(Long commentatorId) {
		this.commentatorId = commentatorId;
	}
	public String getCommentatorName() {
		return commentatorName;
	}
	public void setCommentatorName(String commentatorName) {
		this.commentatorName = commentatorName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
