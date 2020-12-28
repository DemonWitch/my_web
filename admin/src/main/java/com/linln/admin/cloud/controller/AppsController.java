package com.linln.admin.cloud.controller;

import com.linln.admin.cloud.validator.AppsValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.modules.cloud.domain.Apps;
import com.linln.modules.cloud.service.AppsService;
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
@RequestMapping("/cloud/apps")
public class AppsController {

    @Autowired
    private AppsService appsService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("cloud:apps:index")
    public String index(Model model, Apps apps) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("appName", match -> match.contains());

        // 获取数据列表
        Example<Apps> example = Example.of(apps, matcher);
        Page<Apps> list = appsService.getPageList(example);

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/cloud/apps/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("cloud:apps:add")
    public String toAdd() {
        return "/cloud/apps/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("cloud:apps:edit")
    public String toEdit(@PathVariable("id") Apps apps, Model model) {
        model.addAttribute("apps", apps);
        return "/cloud/apps/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"cloud:apps:add", "cloud:apps:edit"})
    @ResponseBody
    public ResultVo save(@Validated AppsValid valid, Apps apps) {
        // 复制保留无需修改的数据
        if (apps.getId() != null) {
            Apps beApps = appsService.getById(apps.getId());
            EntityBeanUtil.copyProperties(beApps, apps);
        }

        // 保存数据
        appsService.save(apps);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("cloud:apps:detail")
    public String toDetail(@PathVariable("id") Apps apps, Model model) {
        model.addAttribute("apps",apps);
        return "/cloud/apps/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("cloud:apps:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (appsService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}