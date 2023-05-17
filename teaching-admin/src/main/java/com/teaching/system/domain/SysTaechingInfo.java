package com.teaching.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.teaching.common.annotation.Excel;
import com.teaching.common.core.domain.BaseEntity;

/**
 * 教研科目对象 sys_taeching_info
 * 
 * @author teaching
 * @date 2023-04-15
 */
public class SysTaechingInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 标题 */
    @Excel(name = "标题")
    private String name;

    /** 简介 */
    @Excel(name = "简介")
    private String introduce;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 添加时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "添加时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date addTime;

    /** 工号 */
    @Excel(name = "工号")
    private Long userId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String userName;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 审核 */
    @Excel(name = "审核")
    private String audit;

    /** 教研类型 */
    @Excel(name = "教研类型")
    private String type;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setIntroduce(String introduce) 
    {
        this.introduce = introduce;
    }

    public String getIntroduce() 
    {
        return introduce;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setAddTime(Date addTime) 
    {
        this.addTime = addTime;
    }

    public Date getAddTime() 
    {
        return addTime;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setAudit(String audit) 
    {
        this.audit = audit;
    }

    public String getAudit() 
    {
        return audit;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("introduce", getIntroduce())
            .append("content", getContent())
            .append("addTime", getAddTime())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("status", getStatus())
            .append("audit", getAudit())
            .append("type", getType())
            .append("endTime", getEndTime())
            .toString();
    }
}
