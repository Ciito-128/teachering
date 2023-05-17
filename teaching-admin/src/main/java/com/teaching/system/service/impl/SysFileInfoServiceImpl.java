package com.teaching.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.teaching.system.mapper.SysFileInfoMapper;
import com.teaching.system.domain.SysFileInfo;
import com.teaching.system.service.ISysFileInfoService;

/**
 * 资料Service业务层处理
 * 
 * @author teaching
 * @date 2023-04-15
 */
@Service
public class SysFileInfoServiceImpl implements ISysFileInfoService 
{
    @Autowired
    private SysFileInfoMapper sysFileInfoMapper;

    /**
     * 查询资料
     * 
     * @param id 资料主键
     * @return 资料
     */
    @Override
    public SysFileInfo selectSysFileInfoById(Long id)
    {
        return sysFileInfoMapper.selectSysFileInfoById(id);
    }

    /**
     * 查询资料列表
     * 
     * @param sysFileInfo 资料
     * @return 资料
     */
    @Override
    public List<SysFileInfo> selectSysFileInfoList(SysFileInfo sysFileInfo)
    {
        return sysFileInfoMapper.selectSysFileInfoList(sysFileInfo);
    }

    /**
     * 新增资料
     * 
     * @param sysFileInfo 资料
     * @return 结果
     */
    @Override
    public int insertSysFileInfo(SysFileInfo sysFileInfo)
    {
        return sysFileInfoMapper.insertSysFileInfo(sysFileInfo);
    }

    /**
     * 修改资料
     * 
     * @param sysFileInfo 资料
     * @return 结果
     */
    @Override
    public int updateSysFileInfo(SysFileInfo sysFileInfo)
    {
        return sysFileInfoMapper.updateSysFileInfo(sysFileInfo);
    }

    /**
     * 批量删除资料
     * 
     * @param ids 需要删除的资料主键
     * @return 结果
     */
    @Override
    public int deleteSysFileInfoByIds(Long[] ids)
    {
        return sysFileInfoMapper.deleteSysFileInfoByIds(ids);
    }

    /**
     * 删除资料信息
     * 
     * @param id 资料主键
     * @return 结果
     */
    @Override
    public int deleteSysFileInfoById(Long id)
    {
        return sysFileInfoMapper.deleteSysFileInfoById(id);
    }
}
