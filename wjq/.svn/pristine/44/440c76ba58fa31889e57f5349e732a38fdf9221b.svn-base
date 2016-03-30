package com.mvc.member.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

@Entity(name="M_Online_Message")
public class OnlineMessage extends BaseEntity{

    /**
     * 
     */
    private static final long serialVersionUID = -3058555351040594845L;

    public static final int  USER_TYPE_MEMBER=1;
    public static final int  USER_TYPE_VISTOR=2;

    @NotNull
    private String content;//留言内容
    private Long memberId;//留言账户的账号
    @NotNull
    private Date onlineMessageDate;//留言的时间

    @NotNull
    private String title;

    private Integer type;//留言者身份类型
    public String getContent() {
        return content;
    }
    public Long getMemberId() {
        return memberId;
    }
    public Date getOnlineMessageDate() {
        return onlineMessageDate;
    }
    public String getTitle() {
        return title;
    }

    public Integer getType() {
        return type;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }
    public void setOnlineMessageDate(Date onlineMessageDate) {
        this.onlineMessageDate = onlineMessageDate;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setType(Integer type) {
        this.type = type;
    }

}
