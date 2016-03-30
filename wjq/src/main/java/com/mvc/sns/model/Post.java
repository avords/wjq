package com.mvc.sns.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

@Entity(name="SNS_POST")
public class Post extends BaseEntity{
    private static final long serialVersionUID = -397217233864668048L;
    /*
     * 原创分享
     */
    public static final int POST_TYPE_ORIGINAL = 1;
    /*
     * 新闻趣事
     */
    public static final int POST_TYPE_NEWS = 2;
    /*
     * 求助
     */
    public static final int POST_TYPE_HELP = 3;
    /*
     * 吐槽
     */
    public static final int POST_TYPE_COMMENT = 4;


    @NotNull
    private Long themeId;
    @NotNull
    private Integer type;//小类，字典配置
    @NotNull
    private Long memberId;
    @NotNull
    @Length(max=225)
    private String name;
    @NotNull
    @Column(columnDefinition="MEDIUMTEXT")
    private String content;

    private Date updateDate;
    @NotNull
    private Date createDate;
    @NotNull
    private Date latestReplyDate;//最新回复时间，默认是创建时间

    @Transient
    private String latestReplyName;  //最新回复人姓名

    @Transient
    private Integer praiseNumber;  //点赞数

    @Transient
    private Integer commentNumber;  //总回复数
    @Transient
    private String memberLoginName;  //发帖人登录名
    @NotNull
    private Integer isTop;
    public Long getThemeId() {
        return themeId;
    }
    public void setThemeId(Long themeId) {
        this.themeId = themeId;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public Long getMemberId() {
        return memberId;
    }
    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }
    public String getMemberLoginName() {
        return memberLoginName;
    }
    public void setMemberLoginName(String memberLoginName) {
        this.memberLoginName = memberLoginName;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getUpdateDate() {
        return updateDate;
    }
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public Date getLatestReplyDate() {
        return latestReplyDate;
    }
    public void setLatestReplyDate(Date latestReplyDate) {
        this.latestReplyDate = latestReplyDate;
    }
    public String getLatestReplyName() {
        return latestReplyName;
    }
    public void setLatestReplyName(String latestReplyName) {
        this.latestReplyName = latestReplyName;
    }
    public Integer getPraiseNumber() {
        return praiseNumber;
    }
    public void setPraiseNumber(Integer praiseNumber) {
        this.praiseNumber = praiseNumber;
    }
    public Integer getIsTop() {
        return isTop;
    }
    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
    }
    public Integer getCommentNumber() {
        return commentNumber;
    }
    public void setCommentNumber(Integer commentNumber) {
        this.commentNumber = commentNumber;
    }
}
