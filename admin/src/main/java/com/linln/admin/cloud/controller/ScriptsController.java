package com.linln.admin.cloud.controller;

import com.linln.admin.cloud.validator.ScriptsValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.modules.cloud.domain.Scripts;
import com.linln.modules.cloud.service.ScriptsService;
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
 * @date 2020/12/18
 */
@Controller
@RequestMapping("/cloud/scripts")
public class ScriptsController {

    @Autowired
    private ScriptsService scriptsService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("cloud:scripts:index")
    public String index(Model model, Scripts scripts) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("scriptName", match -> match.contains());

        // 获取数据列表
        Example<Scripts> example = Example.of(scripts, matcher);
        Page<Scripts> list = scriptsService.getPageList(example);

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/cloud/scripts/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("cloud:scripts:add")
    public String toAdd() {
        return "/cloud/scripts/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("cloud:scripts:edit")
    public String toEdit(@PathVariable("id") Scripts scripts, Model model) {
        model.addAttribute("scripts", scripts);
        return "/cloud/scripts/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"cloud:scripts:add", "cloud:scripts:edit"})
    @ResponseBody
    public ResultVo save(@Validated ScriptsValid valid, Scripts scripts) {
        // 复制保留无需修改的数据
        if (scripts.getId() != null) {
            Scripts beScripts = scriptsService.getById(scripts.getId());
            EntityBeanUtil.copyProperties(beScripts, scripts);
        }

        // 保存数据
        scriptsService.save(scripts);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("cloud:scripts:detail")
    public String toDetail(@PathVariable("id") Scripts scripts, Model model) {
        model.addAttribute("scripts",scripts);
        return "/cloud/scripts/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("cloud:scripts:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (scriptsService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}