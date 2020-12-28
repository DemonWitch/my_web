package com.linln.admin.cloud.controller;

import com.linln.admin.cloud.validator.LicenseValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.modules.cloud.domain.License;
import com.linln.modules.cloud.service.LicenseService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
@Controller
@RequestMapping("/cloud/license")
public class LicenseController {

    @Autowired
    private LicenseService licenseService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("cloud:license:index")
    public String index(Model model, License license) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("agent", match -> match.contains());

        // 获取数据列表
        Example<License> example = Example.of(license, matcher);
        Page<License> list = licenseService.getPageList(example);

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/cloud/license/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("cloud:license:add")
    public String toAdd() {
        return "/cloud/license/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("cloud:license:edit")
    public String toEdit(@PathVariable("id") License license, Model model) {
        model.addAttribute("license", license);
        return "/cloud/license/edit";
    }

    /**
     * 保存添加的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"cloud:license:add", "cloud:license:edit"})
    @ResponseBody
    public ResultVo save(@Validated LicenseValid valid, License license) {
        // 保存数据
        licenseService.save(license);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 保存修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/update")
    @RequiresPermissions({"cloud:license:add", "cloud:license:edit"})
    @ResponseBody
    public ResultVo update(@Validated LicenseValid valid, License license) {
        // 复制保留无需修改的数据
        if (license.getId() != null) {
            License beLicense = licenseService.getById(license.getId());
            EntityBeanUtil.copyProperties(beLicense, license);
        }

        // 修改数据
        licenseService.update(license);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("cloud:license:detail")
    public String toDetail(@PathVariable("id") License license, Model model) {
        model.addAttribute("license",license);
        return "/cloud/license/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("cloud:license:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (licenseService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}