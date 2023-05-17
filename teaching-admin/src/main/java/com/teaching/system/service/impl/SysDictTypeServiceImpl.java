package com.teaching.system.service.impl;

import com.teaching.common.constant.UserConstants;
import com.teaching.common.core.domain.entity.SysDictData;
import com.teaching.common.core.domain.entity.SysDictType;
import com.teaching.common.exception.ServiceException;
import com.teaching.common.utils.DictUtils;
import com.teaching.common.utils.StringUtils;
import com.teaching.system.mapper.SysDictDataMapper;
import com.teaching.system.mapper.SysDictTypeMapper;
import com.teaching.system.service.ISysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

/**
 * 字典 业务层处理
 *
 * @author sys
 */
@Service
public class SysDictTypeServiceImpl implements ISysDictTypeService {
    @Autowired
    private SysDictTypeMapper dictTypeMapper;

    @Autowired
    private SysDictDataMapper dictDataMapper;

    /**
     * 项目启动时，初始化字典到缓存
     */
    @PostConstruct
    public void init() {
        loadingDictCache();
    }

    /**
     * 根据条件分页查询字典类型
     *
     * @param dictType 字典类型信息
     * @return 字典类型集合信息
     */
    @Override
    public List<SysDictType> selectDictTypeList(SysDictType dictType) {
        return dictTypeMapper.selectDictTypeList(dictType);
    }

    /**
     * 根据所有字典类型
     *
     * @return 字典类型集合信息
     */
    @Override
    public List<SysDictType> selectDictTypeAll() {
        return dictTypeMapper.selectDictTypeAll();
    }

    /**
     * 根据字典类型查询字典数据
     *
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    @Override
    public List<SysDictData> selectDictDataByType(String dictType) {
        List<SysDictData> dictDatas = DictUtils.getDictCache(dictType);
        if (StringUtils.isNotEmpty(dictDatas)) {
            return dictDatas;
        }
        dictDatas = dictDataMapper.selectDictDataByType(dictType);
        if (StringUtils.isNotEmpty(dictDatas)) {
            DictUtils.setDictCache(dictType, dictDatas);
            return dictDatas;
        }
        return null;
    }

    /**
     * 根据字典类型ID查询信息
     *
     * @param dictId 字典类型ID
     * @return 字典类型
     */
    @Override
    public SysDictType selectDictTypeById(Long dictId) {
        return dictTypeMapper.selectDictTypeById(dictId);
    }

    /**
     * 根据字典类型查询信息
     *
     * @param dictType 字典类型
     * @return 字典类型
     */
    @Override
    public SysDictType selectDictTypeByType(String dictType) {
        return dictTypeMapper.selectDictTypeByType(dictType);
    }

    /**
     * 批量删除字典类型信息
     *
     * @param dictIds 需要删除的字典ID
     * @return 结果
     */
    @Override
    public void deleteDictTypeByIds(Long[] dictIds) {
        for (Long dictId : dictIds) {
            SysDictType dictType = selectDictTypeById(dictId);
            if (dictDataMapper.countDictDataByType(dictType.getDictType()) > 0) {
                throw new ServiceException(String.format("%1$s已分配,不能删除", dictType.getDictName()));
            }
            dictTypeMapper.deleteDictTypeById(dictId);
            DictUtils.removeDictCache(dictType.getDictType());
        }
    }

    /**
     * 加载字典缓存数据
     */
    @Override
    public void loadingDictCache() {

        List<SysDictType> dictTypeList = new ArrayList<>();

        SysDictType dictType1 = new SysDictType("sys_user_sex");
        List<SysDictData> dictDatas1 = new ArrayList<>();
        dictDatas1.add(new SysDictData(1L, 1L, "男", "0"));
        dictDatas1.add(new SysDictData(2L, 2L, "女", "1"));
        dictDatas1.add(new SysDictData(3L, 3L, "未知", "2"));
        DictUtils.setDictCache("sys_user_sex", dictDatas1);

        SysDictType dictType2 = new SysDictType("sys_show_hide");
        List<SysDictData> dictDatas2 = new ArrayList<>();
        dictDatas2.add(new SysDictData(4L, 1L, "显示", "0"));
        dictDatas2.add(new SysDictData(5L, 2L, "隐藏", "1"));
        DictUtils.setDictCache("sys_show_hide", dictDatas2);

        SysDictType dictType3 = new SysDictType("sys_normal_disable");
        List<SysDictData> dictDatas3 = new ArrayList<>();
        dictDatas3.add(new SysDictData(6L, 1L, "正常", "0"));
        dictDatas3.add(new SysDictData(7L, 2L, "停用", "1"));
        DictUtils.setDictCache("sys_normal_disable", dictDatas3);

        SysDictType dictType4 = new SysDictType("sys_job_status");
        List<SysDictData> dictDatas4 = new ArrayList<>();
        dictDatas4.add(new SysDictData(8L, 1L, "正常", "0"));
        dictDatas4.add(new SysDictData(9L, 2L, "暂停", "1"));
        DictUtils.setDictCache("sys_job_status", dictDatas4);

        SysDictType dictType5 = new SysDictType("sys_job_group");
        List<SysDictData> dictDatas5 = new ArrayList<>();
        dictDatas5.add(new SysDictData(10L, 1L, "默认", "DEFAULT"));
        dictDatas5.add(new SysDictData(11L, 2L, "系统", "SYSTEM"));
        DictUtils.setDictCache("sys_job_group", dictDatas5);

        SysDictType dictType6 = new SysDictType("sys_yes_no");
        List<SysDictData> dictDatas6 = new ArrayList<>();
        dictDatas6.add(new SysDictData(12L, 1L, "是", "Y"));
        dictDatas6.add(new SysDictData(13L, 2L, "否", "N"));
        DictUtils.setDictCache("sys_yes_no", dictDatas6);

        SysDictType dictType7 = new SysDictType("sys_notice_type");
        List<SysDictData> dictDatas7 = new ArrayList<>();
        dictDatas7.add(new SysDictData(14L, 1L, "通知", "1"));
        dictDatas7.add(new SysDictData(15L, 2L, "公告", "2"));
        DictUtils.setDictCache("sys_notice_type", dictDatas7);

        SysDictType dictType8 = new SysDictType("sys_notice_status");
        List<SysDictData> dictDatas8 = new ArrayList<>();
        dictDatas8.add(new SysDictData(16L, 1L, "正常", "0"));
        dictDatas8.add(new SysDictData(17L, 2L, "关闭", "1"));
        DictUtils.setDictCache("sys_notice_status", dictDatas8);

        SysDictType dictType9 = new SysDictType("sys_oper_type");
        List<SysDictData> dictDatas9 = new ArrayList<>();
        dictDatas9.add(new SysDictData(18L, 99L, "其他", "0"));
        dictDatas9.add(new SysDictData(19L, 1L, "新增", "1"));
        dictDatas9.add(new SysDictData(20L, 2L, "修改", "2"));
        dictDatas9.add(new SysDictData(21L, 3L, "删除", "3"));
        dictDatas9.add(new SysDictData(22L, 4L, "授权", "4"));
        dictDatas9.add(new SysDictData(23L, 5L, "导出", "5"));
        dictDatas9.add(new SysDictData(24L, 6L, "导入", "6"));
        dictDatas9.add(new SysDictData(25L, 7L, "强退", "7"));
        dictDatas9.add(new SysDictData(26L, 8L, "生成代码", "8"));
        dictDatas9.add(new SysDictData(27L, 9L, "生成代码", "9"));
        DictUtils.setDictCache("sys_oper_type", dictDatas9);

        SysDictType dictType10 = new SysDictType("sys_common_status");
        List<SysDictData> dictDatas10 = new ArrayList<>();
        dictDatas10.add(new SysDictData(28L, 1L, "成功", "0"));
        dictDatas10.add(new SysDictData(29L, 2L, "失败", "1"));
        DictUtils.setDictCache("sys_notice_status", dictDatas10);

    }

    /**
     * 清空字典缓存数据
     */
    @Override
    public void clearDictCache() {
        DictUtils.clearDictCache();
    }

    /**
     * 重置字典缓存数据
     */
    @Override
    public void resetDictCache() {
        clearDictCache();
        loadingDictCache();
    }

    /**
     * 新增保存字典类型信息
     *
     * @param dict 字典类型信息
     * @return 结果
     */
    @Override
    public int insertDictType(SysDictType dict) {
        int row = dictTypeMapper.insertDictType(dict);
        if (row > 0) {
            DictUtils.setDictCache(dict.getDictType(), null);
        }
        return row;
    }

    /**
     * 修改保存字典类型信息
     *
     * @param dict 字典类型信息
     * @return 结果
     */
    @Override
    @Transactional
    public int updateDictType(SysDictType dict) {
        SysDictType oldDict = dictTypeMapper.selectDictTypeById(dict.getDictId());
        dictDataMapper.updateDictDataType(oldDict.getDictType(), dict.getDictType());
        int row = dictTypeMapper.updateDictType(dict);
        if (row > 0) {
            List<SysDictData> dictDatas = dictDataMapper.selectDictDataByType(dict.getDictType());
            DictUtils.setDictCache(dict.getDictType(), dictDatas);
        }
        return row;
    }

    /**
     * 校验字典类型称是否唯一
     *
     * @param dict 字典类型
     * @return 结果
     */
    @Override
    public String checkDictTypeUnique(SysDictType dict) {
        Long dictId = StringUtils.isNull(dict.getDictId()) ? -1L : dict.getDictId();
        SysDictType dictType = dictTypeMapper.checkDictTypeUnique(dict.getDictType());
        if (StringUtils.isNotNull(dictType) && dictType.getDictId().longValue() != dictId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}
