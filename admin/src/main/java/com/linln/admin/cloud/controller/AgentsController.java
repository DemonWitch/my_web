package com.linln.admin.cloud.controller;

import com.linln.admin.cloud.validator.AgentsValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.modules.cloud.domain.Agents;
import com.linln.modules.cloud.service.AgentsService;
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
@RequestMapping("/cloud/agents")
public class AgentsController {

    @Autowired
    private AgentsService agentsService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("cloud:agents:index")
    public String index(Model model, Agents agents) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("agentName", match -> match.contains())
                .withMatcher("name", match -> match.contains());

        // 获取数据列表
        Example<Agents> example = Example.of(agents, matcher);
        Page<Agents> list = agentsService.getPageList(example);

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/cloud/agents/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("cloud:agents:add")
    public String toAdd() {
        return "/cloud/agents/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("cloud:agents:edit")
    public String toEdit(@PathVariable("id") Agents agents, Model model) {
        model.addAttribute("agents", agents);
        return "/cloud/agents/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"cloud:agents:add", "cloud:agents:edit"})
    @ResponseBody
    public ResultVo save(@Validated AgentsValid valid, Agents agents) {
        // 复制保留无需修改的数据
        if (agents.getId() != null) {
            Agents beAgents = agentsService.getById(agents.getId());
            EntityBeanUtil.copyProperties(beAgents, agents);
        }

        // 保存数据
        agentsService.save(agents);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("cloud:agents:detail")
    public String toDetail(@PathVariable("id") Agents agents, Model model) {
        model.addAttribute("agents",agents);
        return "/cloud/agents/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("cloud:agents:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (agentsService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}