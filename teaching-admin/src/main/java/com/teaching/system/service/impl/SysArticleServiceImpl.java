package com.teaching.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.teaching.system.mapper.SysArticleMapper;
import com.teaching.system.domain.SysArticle;
import com.teaching.system.service.ISysArticleService;

/**
 * 教研论文Service业务层处理
 * 
 * @author teaching
 * @date 2023-04-15
 */
@Service
public class SysArticleServiceImpl implements ISysArticleService 
{
    @Autowired
    private SysArticleMapper sysArticleMapper;

    /**
     * 查询教研论文
     * 
     * @param id 教研论文主键
     * @return 教研论文
     */
    @Override
    public SysArticle selectSysArticleById(Long id)
    {
        return sysArticleMapper.selectSysArticleById(id);
    }

    /**
     * 查询教研论文列表
     * 
     * @param sysArticle 教研论文
     * @return 教研论文
     */
    @Override
    public List<SysArticle> selectSysArticleList(SysArticle sysArticle)
    {
        return sysArticleMapper.selectSysArticleList(sysArticle);
    }

    /**
     * 新增教研论文
     * 
     * @param sysArticle 教研论文
     * @return 结果
     */
    @Override
    public int insertSysArticle(SysArticle sysArticle)
    {
        return sysArticleMapper.insertSysArticle(sysArticle);
    }

    /**
     * 修改教研论文
     * 
     * @param sysArticle 教研论文
     * @return 结果
     */
    @Override
    public int updateSysArticle(SysArticle sysArticle)
    {
        return sysArticleMapper.updateSysArticle(sysArticle);
    }

    /**
     * 批量删除教研论文
     * 
     * @param ids 需要删除的教研论文主键
     * @return 结果
     */
    @Override
    public int deleteSysArticleByIds(Long[] ids)
    {
        return sysArticleMapper.deleteSysArticleByIds(ids);
    }

    /**
     * 删除教研论文信息
     * 
     * @param id 教研论文主键
     * @return 结果
     */
    @Override
    public int deleteSysArticleById(Long id)
    {
        return sysArticleMapper.deleteSysArticleById(id);
    }
}
