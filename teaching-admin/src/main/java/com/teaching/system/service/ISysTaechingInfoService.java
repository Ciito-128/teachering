package com.teaching.system.service;

import java.util.List;
import com.teaching.system.domain.SysTaechingInfo;

/**
 * 教研科目Service接口
 * 
 * @author teaching
 * @date 2023-04-15
 */
public interface ISysTaechingInfoService 
{
    /**
     * 查询教研科目
     * 
     * @param id 教研科目主键
     * @return 教研科目
     */
    public SysTaechingInfo selectSysTaechingInfoById(Long id);

    /**
     * 查询教研科目列表
     * 
     * @param sysTaechingInfo 教研科目
     * @return 教研科目集合
     */
    public List<SysTaechingInfo> selectSysTaechingInfoList(SysTaechingInfo sysTaechingInfo);

    /**
     * 新增教研科目
     * 
     * @param sysTaechingInfo 教研科目
     * @return 结果
     */
    public int insertSysTaechingInfo(SysTaechingInfo sysTaechingInfo);

    /**
     * 修改教研科目
     * 
     * @param sysTaechingInfo 教研科目
     * @return 结果
     */
    public int updateSysTaechingInfo(SysTaechingInfo sysTaechingInfo);

    /**
     * 批量删除教研科目
     * 
     * @param ids 需要删除的教研科目主键集合
     * @return 结果
     */
    public int deleteSysTaechingInfoByIds(Long[] ids);

    /**
     * 删除教研科目信息
     * 
     * @param id 教研科目主键
     * @return 结果
     */
    public int deleteSysTaechingInfoById(Long id);
}
