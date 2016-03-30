package com.mvc.cms.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;
import com.mvc.framework.model.BaseTree;

/**
 * 栏目表
 */
@Entity(name = "CMS_CHANNEL")
public class Channel extends BaseEntity implements BaseTree {
    public static final int CHANNEL_DISPLAYLOCATION_GENERAL = 2;//栏目位置:普通位置

    public static final int CHANNEL_DISPLAYLOCATION_NAVIGATION = 1;//栏目位置:导航位置
    private static final long serialVersionUID = 7768032847851793076L;

    @Length(max=512)
    private String channelExplian;//栏目说明
    @NotNull
    private Integer displayLocation;//显示位置
    private String fullName;//完整名称
    @NotNull
    private Integer isBlank;//是否新窗口打开
    @NotNull
    private Integer isDisplay;//是否显示
    @NotNull
    @Length(max=16)
    private String name;//栏目名称
    private Long parentId;//父栏目ID
    private String path;//内部路径
    private String pictureAddress;//图片地址名称
    @NotNull
    private Integer pictureHeight;//图片高度
    private String pictureName;//图片名称
    @NotNull
    private Integer pictureWidth;//图片宽度
    @Column(length=16,nullable=false,unique=true)
    @NotNull
    private String positionCode;//位置编码
    @NotNull
    private Integer priority;//排列顺序

    @Transient
    private final List<Channel> subChannels = new ArrayList<Channel>();
    private Date updateTime;//新增或者更新时间

    public String getChannelExplian() {
        return channelExplian;
    }

    public Integer getDisplayLocation() {
        return displayLocation;
    }


    public String getFullName() {
        return fullName;
    }

    public Integer getIsBlank() {
        return isBlank;
    }

    public Integer getIsDisplay() {
        return isDisplay;
    }

    public String getName() {
        return name;
    }
    @Override
    public Long getParentId() {
        return parentId;
    }

    public String getPath() {
        return path;
    }

    public String getPictureAddress() {
        return pictureAddress;
    }

    public Integer getPictureHeight() {
        return pictureHeight;
    }

    public String getPictureName() {
        return pictureName;
    }

    public Integer getPictureWidth() {
        return pictureWidth;
    }

    public String getPositionCode() {
        return positionCode;
    }

    public Integer getPriority() {
        return priority;
    }

    public List<Channel> getSubChannels() {
        return subChannels;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setChannelExplian(String channelExplian) {
        this.channelExplian = channelExplian;
    }

    public void setDisplayLocation(Integer displayLocation) {
        this.displayLocation = displayLocation;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setIsBlank(Integer isBlank) {
        this.isBlank = isBlank;
    }

    public void setIsDisplay(Integer isDisplay) {
        this.isDisplay = isDisplay;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setPictureAddress(String pictureAddress) {
        this.pictureAddress = pictureAddress;
    }

    public void setPictureHeight(Integer pictureHeight) {
        this.pictureHeight = pictureHeight;
    }

    public void setPictureName(String pictureName) {
        this.pictureName = pictureName;
    }
    public void setPictureWidth(Integer pictureWidth) {
        this.pictureWidth = pictureWidth;
    }

    public void setPositionCode(String positionCode) {
        this.positionCode = positionCode;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

}