package com.linln.admin.cloud.validator;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
@Data
public class LicenseValid implements Serializable {
    @NotEmpty(message = "代理商不能为空")
    private String agent;
    @NotEmpty(message = "邀请码不能为空")
    private String invitationCode;
    @NotEmpty(message = "激活时间不能为空")
    private String activationDate;
    @NotEmpty(message = "过期时间不能为空")
    private String expireDate;
}