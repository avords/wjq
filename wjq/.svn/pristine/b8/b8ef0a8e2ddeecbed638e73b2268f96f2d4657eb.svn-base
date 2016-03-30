package com.mvc.sns.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
@Entity(name="SNS_POST_PRAISE")
public class PostPraise implements Serializable{
    private static final long serialVersionUID = -2919228869554266446L;
    @Id
    private Long postId;
    @Id
    private String memberIp;
    @NotNull
    private Date createDate;
    public Long getPostId() {
        return postId;
    }
    public void setPostId(Long postId) {
        this.postId = postId;
    }
    public String getMemberIp() {
		return memberIp;
	}
	public void setMemberIp(String memberIp) {
		this.memberIp = memberIp;
	}
	public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
