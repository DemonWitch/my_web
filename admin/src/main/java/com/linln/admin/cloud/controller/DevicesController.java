package com.linln.admin.cloud.controller;

import com.linln.admin.cloud.validator.DevicesValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.modules.cloud.domain.Devices;
import com.linln.modules.cloud.service.DevicesService;
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
 * @date 2020/12/16
 */
@Controller
@RequestMapping("/cloud/devices")
public class DevicesController {

    @Autowired
    private DevicesService devicesService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("cloud:devices:index")
    public String index(Model model, Devices devices) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("deviceName", match -> match.contains());

        // 获取数据列表
        Example<Devices> example = Example.of(devices, matcher);
        Page<Devices> list = devicesService.getPageList(example);

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/cloud/devices/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("cloud:devices:add")
    public String toAdd() {
        return "/cloud/devices/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("cloud:devices:edit")
    public String toEdit(@PathVariable("id") Devices devices, Model model) {
        model.addAttribute("devices", devices);
        return "/cloud/devices/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"cloud:devices:add", "cloud:devices:edit"})
    @ResponseBody
    public ResultVo save(@Validated DevicesValid valid, Devices devices) {
        // 复制保留无需修改的数据
        if (devices.getId() != null) {
            Devices beDevices = devicesService.getById(devices.getId());
            EntityBeanUtil.copyProperties(beDevices, devices);
        }

        // 保存数据
        devicesService.save(devices);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("cloud:devices:detail")
    public String toDetail(@PathVariable("id") Devices devices, Model model) {
        model.addAttribute("devices",devices);
        return "/cloud/devices/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("cloud:devices:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (devicesService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}