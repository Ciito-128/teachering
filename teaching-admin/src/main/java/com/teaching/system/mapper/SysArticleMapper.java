package com.teaching.system.mapper;

import java.util.List;
import com.teaching.system.domain.SysArticle;

/**
 * 教研论文Mapper接口
 * 
 * @author teaching
 * @date 2023-04-15
 */
public interface SysArticleMapper 
{
    /**
     * 查询教研论文
     * 
     * @param id 教研论文主键
     * @return 教研论文
     */
    public SysArticle selectSysArticleById(Long id);

    /**
     * 查询教研论文列表
     * 
     * @param sysArticle 教研论文
     * @return 教研论文集合
     */
    public List<SysArticle> selectSysArticleList(SysArticle sysArticle);

    /**
     * 新增教研论文
     * 
     * @param sysArticle 教研论文
     * @return 结果
     */
    public int insertSysArticle(SysArticle sysArticle);

    /**
     * 修改教研论文
     * 
     * @param sysArticle 教研论文
     * @return 结果
     */
    public int updateSysArticle(SysArticle sysArticle);

    /**
     * 删除教研论文
     * 
     * @param id 教研论文主键
     * @return 结果
     */
    public int deleteSysArticleById(Long id);

    /**
     * 批量删除教研论文
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysArticleByIds(Long[] ids);
}
