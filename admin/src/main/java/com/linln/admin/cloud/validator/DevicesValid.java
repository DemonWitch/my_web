package com.linln.admin.cloud.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author Richard_Lv
 * @date 2020/12/16
 */
@Data
public class DevicesValid implements Serializable {
    @NotEmpty(message = "设备名称不能为空")
    private String deviceName;
    @NotEmpty(message = "设备ID不能为空")
    private String deviceID;
}