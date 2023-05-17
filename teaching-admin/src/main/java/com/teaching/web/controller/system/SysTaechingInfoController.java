package com.teaching.web.controller.system;

import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpServletResponse;

import com.teaching.common.core.domain.entity.SysRole;
import com.teaching.common.utils.SecurityUtils;
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
import com.teaching.system.domain.SysTaechingInfo;
import com.teaching.system.service.ISysTaechingInfoService;
import com.teaching.common.utils.poi.ExcelUtil;
import com.teaching.common.core.page.TableDataInfo;

/**
 * 教研科目Controller
 *
 * @author teaching
 * @date 2023-04-15
 */
@RestController
@RequestMapping("/system/teaching")
public class SysTaechingInfoController extends BaseController {
    @Autowired
    private ISysTaechingInfoService sysTaechingInfoService;

    /**
     * 查询教研科目列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysTaechingInfo sysTaechingInfo) {
        List<SysRole> roles = SecurityUtils.getLoginUser().getUser().getRoles();
        Optional<SysRole> any = roles.stream().filter(e -> e.getRoleId().equals(2L)).findAny();
        if (any.isPresent()) {
            sysTaechingInfo.setUserId(SecurityUtils.getUserId());
        }
        startPage();
        List<SysTaechingInfo> list = sysTaechingInfoService.selectSysTaechingInfoList(sysTaechingInfo);
        return getDataTable(list);
    }

    /**
     * 导出教研科目列表
     */
    @Log(title = "教研科目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysTaechingInfo sysTaechingInfo) {
        List<SysRole> roles = SecurityUtils.getLoginUser().getUser().getRoles();
        Optional<SysRole> any = roles.stream().filter(e -> e.getRoleId().equals(2L)).findAny();
        if (any.isPresent()) {
            sysTaechingInfo.setUserId(SecurityUtils.getUserId());
        }
        List<SysTaechingInfo> list = sysTaechingInfoService.selectSysTaechingInfoList(sysTaechingInfo);
        ExcelUtil<SysTaechingInfo> util = new ExcelUtil<SysTaechingInfo>(SysTaechingInfo.class);
        util.exportExcel(response, list, "教研科目数据");
    }

    /**
     * 获取教研科目详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(sysTaechingInfoService.selectSysTaechingInfoById(id));
    }

    /**
     * 新增教研科目
     */
    @Log(title = "教研科目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysTaechingInfo sysTaechingInfo) {
        return toAjax(sysTaechingInfoService.insertSysTaechingInfo(sysTaechingInfo));
    }

    /**
     * 修改教研科目
     */
    @Log(title = "教研科目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysTaechingInfo sysTaechingInfo) {
        return toAjax(sysTaechingInfoService.updateSysTaechingInfo(sysTaechingInfo));
    }

    /**
     * 删除教研科目
     */
    @Log(title = "教研科目", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysTaechingInfoService.deleteSysTaechingInfoByIds(ids));
    }
}
