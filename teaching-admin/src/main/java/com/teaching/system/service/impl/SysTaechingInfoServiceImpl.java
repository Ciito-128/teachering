package com.teaching.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.teaching.system.mapper.SysTaechingInfoMapper;
import com.teaching.system.domain.SysTaechingInfo;
import com.teaching.system.service.ISysTaechingInfoService;

/**
 * 教研科目Service业务层处理
 * 
 * @author teaching
 * @date 2023-04-15
 */
@Service
public class SysTaechingInfoServiceImpl implements ISysTaechingInfoService 
{
    @Autowired
    private SysTaechingInfoMapper sysTaechingInfoMapper;

    /**
     * 查询教研科目
     * 
     * @param id 教研科目主键
     * @return 教研科目
     */
    @Override
    public SysTaechingInfo selectSysTaechingInfoById(Long id)
    {
        return sysTaechingInfoMapper.selectSysTaechingInfoById(id);
    }

    /**
     * 查询教研科目列表
     * 
     * @param sysTaechingInfo 教研科目
     * @return 教研科目
     */
    @Override
    public List<SysTaechingInfo> selectSysTaechingInfoList(SysTaechingInfo sysTaechingInfo)
    {
        return sysTaechingInfoMapper.selectSysTaechingInfoList(sysTaechingInfo);
    }

    /**
     * 新增教研科目
     * 
     * @param sysTaechingInfo 教研科目
     * @return 结果
     */
    @Override
    public int insertSysTaechingInfo(SysTaechingInfo sysTaechingInfo)
    {
        return sysTaechingInfoMapper.insertSysTaechingInfo(sysTaechingInfo);
    }

    /**
     * 修改教研科目
     * 
     * @param sysTaechingInfo 教研科目
     * @return 结果
     */
    @Override
    public int updateSysTaechingInfo(SysTaechingInfo sysTaechingInfo)
    {
        return sysTaechingInfoMapper.updateSysTaechingInfo(sysTaechingInfo);
    }

    /**
     * 批量删除教研科目
     * 
     * @param ids 需要删除的教研科目主键
     * @return 结果
     */
    @Override
    public int deleteSysTaechingInfoByIds(Long[] ids)
    {
        return sysTaechingInfoMapper.deleteSysTaechingInfoByIds(ids);
    }

    /**
     * 删除教研科目信息
     * 
     * @param id 教研科目主键
     * @return 结果
     */
    @Override
    public int deleteSysTaechingInfoById(Long id)
    {
        return sysTaechingInfoMapper.deleteSysTaechingInfoById(id);
    }
}
