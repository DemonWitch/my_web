package com.linln.admin.cloud.controller.rest;

import com.linln.component.jwt.annotation.JwtPermissions;
import com.linln.modules.cloud.result.CheckAuthResult;
import com.linln.modules.cloud.service.LicenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author Richard Lv
 * @Date 2020/12/20 17:36
 * @Version 1.0
 * @Description
 */
@RestController
@RequestMapping("/api/cloud/license")
public class LicenseRestController {
    @Autowired
    private LicenseService licenseService;

    @JwtPermissions
    @GetMapping("/check")
    public CheckAuthResult index(@RequestParam(value = "authCode")String authCode) {
        return licenseService.checkAuthCode(authCode);
    }
}
