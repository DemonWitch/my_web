package com.linln.admin.cloud.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;

/**
 * @author Richard_Lv
 * @date 2020/12/18
 */
@Data
public class ScriptsValid implements Serializable {
    @NotEmpty(message = "脚本名称不能为空")
    private String scriptName;
    @NotEmpty(message = "脚本链接不能为空")
    private String scriptUrl;
}