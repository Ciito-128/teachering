package com.teaching.web.controller.system;

import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpServletResponse;

import com.teaching.common.core.domain.entity.SysRole;
import com.teaching.common.core.domain.entity.SysUser;
import com.teaching.common.utils.SecurityUtils;
import com.teaching.system.service.ISysUserService;
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
import com.teaching.system.domain.SysArticle;
import com.teaching.system.service.ISysArticleService;
import com.teaching.common.utils.poi.ExcelUtil;
import com.teaching.common.core.page.TableDataInfo;

/**
 * 教研论文Controller
 *
 * @author teaching
 * @date 2023-04-15
 */
@RestController
@RequestMapping("/system/article")
public class SysArticleController extends BaseController {
    @Autowired
    private ISysArticleService sysArticleService;
    @Autowired
    private ISysUserService userService;

    /**
     * 查询教研论文列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysArticle sysArticle) {
        List<SysRole> roles = SecurityUtils.getLoginUser().getUser().getRoles();
        Optional<SysRole> any = roles.stream().filter(e -> e.getRoleId().equals(2L)).findAny();
        if (any.isPresent()) {
            sysArticle.setUserId(SecurityUtils.getUserId());
        }
        startPage();
        List<SysArticle> list = sysArticleService.selectSysArticleList(sysArticle);
        return getDataTable(list);
    }

    /**
     * 导出教研论文列表
     */
    @Log(title = "教研论文", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysArticle sysArticle) {
        List<SysRole> roles = SecurityUtils.getLoginUser().getUser().getRoles();
        Optional<SysRole> any = roles.stream().filter(e -> e.getRoleId().equals(2L)).findAny();
        if (any.isPresent()) {
            sysArticle.setUserId(SecurityUtils.getUserId());
        }
        List<SysArticle> list = sysArticleService.selectSysArticleList(sysArticle);
        ExcelUtil<SysArticle> util = new ExcelUtil<SysArticle>(SysArticle.class);
        util.exportExcel(response, list, "教研论文数据");
    }

    /**
     * 获取教研论文详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(sysArticleService.selectSysArticleById(id));
    }

    /**
     * 新增教研论文
     */
    @Log(title = "教研论文", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysArticle sysArticle) {
        if (sysArticle.getUserId() != null) {
            SysUser sysUser = userService.selectUserById(sysArticle.getUserId());
            sysArticle.setUserName(sysUser.getNickName());
        }
        sysArticle.setAudit("00");
        return toAjax(sysArticleService.insertSysArticle(sysArticle));
    }

    /**
     * 修改教研论文
     */
    @Log(title = "教研论文", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysArticle sysArticle) {
        if (sysArticle.getUserId() != null) {
            SysUser sysUser = userService.selectUserById(sysArticle.getUserId());
            sysArticle.setUserName(sysUser.getNickName());
        }
        return toAjax(sysArticleService.updateSysArticle(sysArticle));
    }

    /**
     * 删除教研论文
     */
    @Log(title = "教研论文", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysArticleService.deleteSysArticleByIds(ids));
    }
}
