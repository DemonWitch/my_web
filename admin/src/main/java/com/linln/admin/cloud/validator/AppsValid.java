package com.linln.admin.cloud.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
@Data
public class AppsValid implements Serializable {
    @NotEmpty(message = "APP名称不能为空")
    private String appName;
    @NotEmpty(message = "APP版本不能为空")
    private String appVersion;
    @NotEmpty(message = "APP包名不能为空")
    private String appPkgName;
    @NotEmpty(message = "APP下载链接不能为空")
    private String appDownloadUrl;
    @NotEmpty(message = "APP最长执行时间不能为空")
    private String maxRunSeconds;
}