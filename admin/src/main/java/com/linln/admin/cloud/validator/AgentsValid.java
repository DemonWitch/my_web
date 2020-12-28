package com.linln.admin.cloud.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
@Data
public class AgentsValid implements Serializable {
    @NotEmpty(message = "代理商名称不能为空")
    private String agentName;
}