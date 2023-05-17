package com.teaching.system.mapper;

import java.util.List;
import com.teaching.system.domain.SysReward;

/**
 * 获奖成果Mapper接口
 * 
 * @author teaching
 * @date 2023-04-15
 */
public interface SysRewardMapper 
{
    /**
     * 查询获奖成果
     * 
     * @param id 获奖成果主键
     * @return 获奖成果
     */
    public SysReward selectSysRewardById(Long id);

    /**
     * 查询获奖成果列表
     * 
     * @param sysReward 获奖成果
     * @return 获奖成果集合
     */
    public List<SysReward> selectSysRewardList(SysReward sysReward);

    /**
     * 新增获奖成果
     * 
     * @param sysReward 获奖成果
     * @return 结果
     */
    public int insertSysReward(SysReward sysReward);

    /**
     * 修改获奖成果
     * 
     * @param sysReward 获奖成果
     * @return 结果
     */
    public int updateSysReward(SysReward sysReward);

    /**
     * 删除获奖成果
     * 
     * @param id 获奖成果主键
     * @return 结果
     */
    public int deleteSysRewardById(Long id);

    /**
     * 批量删除获奖成果
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRewardByIds(Long[] ids);
}
