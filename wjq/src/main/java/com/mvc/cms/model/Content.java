package com.mvc.cms.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.AbstractEntity;

/**
 * 内容
 */
@Entity(name="CMS_CONTENT")
public class Content extends AbstractEntity {
    public static final int CHECK_END_PEOPLE = 3;

    public static final int CHECK_PEOPLE = 1;
    public static final int COMMON_PEOPLE = 0;
    /*
     * 草稿
     */
    public static final int CONTENT_STATUS_DRAFT = 1;
    /*
     * 复核通过
     */
    public static final int CONTENT_STATUS_END_PASSED = 4;

    /*
     * 审核通过
     */
    public static final int CONTENT_STATUS_PASSED = 3;
    /*
     * 发布
     */
    public static final int CONTENT_STATUS_PUBLISH = 5;
    /*
     * 待审核
     */
    public static final int CONTENT_STATUS_WAIT_CHECK = 2;
    public static final int CONTENT_TYPE_ARTICAL = 1;
    public static final int CONTENT_TYPE_NEWS = 2;

    public static final int CONTENT_TYPE_NOTICE = 3;
    public static final int PUBLISH_PEOPLE = 2;
    private static final long serialVersionUID = 2138483467175196677L;

    /**
     *  作者
     */
    @Length(max=32)
    private String author;

    @Transient
    private ContentTxt contentTxt;
    private Date createDate;
    private Long departmentId;

    /**
     *  关键字
     */
    private String keyWords;
    @Id
    private Long objectId;

    /**
     *  来源
     */
    @Length(max=32)
    private String origin;
    @Transient
    private String parentPath;
    /**
     * 发布时间
     */
    private Date publishDate;

    /**
     *  文章状态
     */
    private Integer status;

    /**
     *  文章摘要
     */
    @Length(max=512)
    private String summary;

    /**
     *  标题
     */
    @Length(max=64)
    @NotNull
    private String title;
    /**
     *  标题图片
     */
    @Length(max=64)
    private String titleImage;

    private Integer type;  //文章类型

    /**
     *  用户ID
     */
    private Long userId;

    @Transient
    private Integer visitorCount=0;  //文章访问量

    public String getAuthor(){
        return author;
    }

    @Transient
    public ContentTxt getContentTxt() {
        return contentTxt;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public Long getDepartmentId() {
        return departmentId;
    }
    public String getKeyWords() {
        return keyWords;
    }

    @Override
    public Long getObjectId() {
        return objectId;
    }

    public String getOrigin(){
        return origin;
    }

    public String getParentPath() {
        return parentPath;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public Integer getStatus(){
        return status;
    }

    public String getSummary() {
        return summary;
    }

    public String getTitle(){
        return title;
    }

    public String getTitleImage(){
        return titleImage;
    }

    public Integer getType() {
        return type;
    }

    public Long getUserId(){
        return userId;
    }

    public Integer getVisitorCount() {
        return visitorCount;
    }
    public void setAuthor(String author){
        this.author = author;
    }

    public void setContentTxt(ContentTxt contentTxt) {
        this.contentTxt = contentTxt;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }

    @Override
    public void setObjectId(Long objectId) {
        this.objectId=objectId;
    }

    public void setOrigin(String origin){
        this.origin = origin;
    }

    public void setParentPath(String parentPath) {
        this.parentPath = parentPath;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public void setStatus(Integer status){
        this.status = status;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public void setTitle(String title){
        this.title = title;
    }


    public void setTitleImage(String titleImage){
        this.titleImage = titleImage;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public void setUserId(Long userId){
        this.userId = userId;
    }

    public void setVisitorCount(Integer visitorCount) {
        this.visitorCount = visitorCount;
    }

}