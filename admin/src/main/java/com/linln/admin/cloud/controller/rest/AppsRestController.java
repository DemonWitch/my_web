package com.linln.admin.cloud.controller.rest;

import com.alibaba.fastjson.JSONObject;
import com.linln.component.jwt.annotation.JwtPermissions;
import com.linln.modules.cloud.service.AppsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author Richard Lv
 * @Date 2020/12/20 17:49
 * @Version 1.0
 * @Description
 */
@RestController
@RequestMapping("/api/cloud/app")
public class AppsRestController {
    @Autowired
    private AppsService appsService;

    /**
     * 查询所有APP信息
     */
    @JwtPermissions
    @GetMapping("/searchAll")
    public JSONObject index() {
        return appsService.getAll();
    }
}
