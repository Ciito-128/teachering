package com.teaching.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.teaching.system.mapper.SysRewardMapper;
import com.teaching.system.domain.SysReward;
import com.teaching.system.service.ISysRewardService;

/**
 * 获奖成果Service业务层处理
 * 
 * @author teaching
 * @date 2023-04-15
 */
@Service
public class SysRewardServiceImpl implements ISysRewardService 
{
    @Autowired
    private SysRewardMapper sysRewardMapper;

    /**
     * 查询获奖成果
     * 
     * @param id 获奖成果主键
     * @return 获奖成果
     */
    @Override
    public SysReward selectSysRewardById(Long id)
    {
        return sysRewardMapper.selectSysRewardById(id);
    }

    /**
     * 查询获奖成果列表
     * 
     * @param sysReward 获奖成果
     * @return 获奖成果
     */
    @Override
    public List<SysReward> selectSysRewardList(SysReward sysReward)
    {
        return sysRewardMapper.selectSysRewardList(sysReward);
    }

    /**
     * 新增获奖成果
     * 
     * @param sysReward 获奖成果
     * @return 结果
     */
    @Override
    public int insertSysReward(SysReward sysReward)
    {
        return sysRewardMapper.insertSysReward(sysReward);
    }

    /**
     * 修改获奖成果
     * 
     * @param sysReward 获奖成果
     * @return 结果
     */
    @Override
    public int updateSysReward(SysReward sysReward)
    {
        return sysRewardMapper.updateSysReward(sysReward);
    }

    /**
     * 批量删除获奖成果
     * 
     * @param ids 需要删除的获奖成果主键
     * @return 结果
     */
    @Override
    public int deleteSysRewardByIds(Long[] ids)
    {
        return sysRewardMapper.deleteSysRewardByIds(ids);
    }

    /**
     * 删除获奖成果信息
     * 
     * @param id 获奖成果主键
     * @return 结果
     */
    @Override
    public int deleteSysRewardById(Long id)
    {
        return sysRewardMapper.deleteSysRewardById(id);
    }
}
