package com.teaching.system.mapper;

import java.util.List;
import com.teaching.system.domain.SysFileInfo;

/**
 * 资料Mapper接口
 * 
 * @author teaching
 * @date 2023-04-15
 */
public interface SysFileInfoMapper 
{
    /**
     * 查询资料
     * 
     * @param id 资料主键
     * @return 资料
     */
    public SysFileInfo selectSysFileInfoById(Long id);

    /**
     * 查询资料列表
     * 
     * @param sysFileInfo 资料
     * @return 资料集合
     */
    public List<SysFileInfo> selectSysFileInfoList(SysFileInfo sysFileInfo);

    /**
     * 新增资料
     * 
     * @param sysFileInfo 资料
     * @return 结果
     */
    public int insertSysFileInfo(SysFileInfo sysFileInfo);

    /**
     * 修改资料
     * 
     * @param sysFileInfo 资料
     * @return 结果
     */
    public int updateSysFileInfo(SysFileInfo sysFileInfo);

    /**
     * 删除资料
     * 
     * @param id 资料主键
     * @return 结果
     */
    public int deleteSysFileInfoById(Long id);

    /**
     * 批量删除资料
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysFileInfoByIds(Long[] ids);
}
