package com.teaching.web.controller.system;

import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpServletResponse;

import com.teaching.common.core.domain.entity.SysRole;
import com.teaching.common.utils.SecurityUtils;
import com.teaching.system.domain.SysTaechingInfo;
import com.teaching.system.service.ISysTaechingInfoService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.teaching.common.annotation.Log;
import com.teaching.common.core.controller.BaseController;
import com.teaching.common.core.domain.AjaxResult;
import com.teaching.common.enums.BusinessType;
import com.teaching.system.domain.SysReward;
import com.teaching.system.service.ISysRewardService;
import com.teaching.common.utils.poi.ExcelUtil;
import com.teaching.common.core.page.TableDataInfo;

/**
 * 获奖成果Controller
 *
 * @author teaching
 * @date 2023-04-15
 */
@RestController
@RequestMapping("/system/reward")
public class SysRewardController extends BaseController {
    @Autowired
    private ISysRewardService sysRewardService;
    @Autowired
    private ISysTaechingInfoService taechingInfoService;

    /**
     * 查询获奖成果列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysReward sysReward) {
        List<SysRole> roles = SecurityUtils.getLoginUser().getUser().getRoles();
        Optional<SysRole> any = roles.stream().filter(e -> e.getRoleId().equals(2L)).findAny();
        if (any.isPresent()) {
            sysReward.setUserId(SecurityUtils.getUserId());
        }
        startPage();
        List<SysReward> list = sysRewardService.selectSysRewardList(sysReward);
        return getDataTable(list);
    }

    /**
     * 导出获奖成果列表
     */
    @Log(title = "获奖成果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysReward sysReward) {
        List<SysRole> roles = SecurityUtils.getLoginUser().getUser().getRoles();
        Optional<SysRole> any = roles.stream().filter(e -> e.getRoleId().equals(2L)).findAny();
        if (any.isPresent()) {
            sysReward.setUserId(SecurityUtils.getUserId());
        }
        List<SysReward> list = sysRewardService.selectSysRewardList(sysReward);
        ExcelUtil<SysReward> util = new ExcelUtil<SysReward>(SysReward.class);
        util.exportExcel(response, list, "获奖成果数据");
    }

    /**
     * 获取获奖成果详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(sysRewardService.selectSysRewardById(id));
    }

    /**
     * 新增获奖成果
     */
    @Log(title = "获奖成果", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysReward sysReward) {
        if (!sysReward.getType().equals("00")) {
            SysTaechingInfo sysTaechingInfo = taechingInfoService.selectSysTaechingInfoById(sysReward.getFileId());
            sysReward.setFileName(sysTaechingInfo.getName());
            sysReward.setUserId(sysTaechingInfo.getUserId());
            sysReward.setUserName(sysTaechingInfo.getUserName());
        } else {
            sysReward.setUserId(SecurityUtils.getUserId());
            sysReward.setUserName(SecurityUtils.getLoginUser().getUser().getNickName());
        }
        sysReward.setStatus("00");
        return toAjax(sysRewardService.insertSysReward(sysReward));
    }

    /**
     * 修改获奖成果
     */
    @Log(title = "获奖成果", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysReward sysReward) {
        if (!sysReward.getType().equals("00")) {
            SysTaechingInfo sysTaechingInfo = taechingInfoService.selectSysTaechingInfoById(sysReward.getFileId());
            sysReward.setFileName(sysTaechingInfo.getName());
        }
        return toAjax(sysRewardService.updateSysReward(sysReward));
    }

    /**
     * 删除获奖成果
     */
    @Log(title = "获奖成果", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysRewardService.deleteSysRewardByIds(ids));
    }
}
