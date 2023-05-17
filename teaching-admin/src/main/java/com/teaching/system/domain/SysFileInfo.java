package com.teaching.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.teaching.common.annotation.Excel;
import com.teaching.common.core.domain.BaseEntity;

/**
 * 资料对象 sys_file_info
 * 
 * @author teaching
 * @date 2023-04-15
 */
public class SysFileInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 文件地址 */
    @Excel(name = "文件地址")
    private String fileUrl;

    /** 项目 */
    @Excel(name = "项目")
    private Long trachingId;

    /** 描述 */
    @Excel(name = "描述")
    private String content;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setFileUrl(String fileUrl) 
    {
        this.fileUrl = fileUrl;
    }

    public String getFileUrl() 
    {
        return fileUrl;
    }
    public void setTrachingId(Long trachingId) 
    {
        this.trachingId = trachingId;
    }

    public Long getTrachingId() 
    {
        return trachingId;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("fileUrl", getFileUrl())
            .append("trachingId", getTrachingId())
            .append("content", getContent())
            .toString();
    }
}
