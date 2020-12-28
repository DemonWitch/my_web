package com.linln.modules.cloud.result;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: YaChao Lv
 * @Date: 2020/12/22 17:27
 * @Description:
 */
@Data
public class CheckAuthResult implements Serializable {
    private boolean status;
    private String message;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date activationDate;
    // 过期时间
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date expireDate;

    private final static String NOT_FOUND="未找到指定授权码";

    public CheckAuthResult(boolean status,String message,Date activationDate,Date expireDate){
        this.status=status;
        this.message=message;
        this.activationDate=activationDate;
        this.expireDate=expireDate;
    }

    public static CheckAuthResult OK(Date activationDate,Date expireDate){
        return new CheckAuthResult(true,"",activationDate,expireDate);
    }

    public static CheckAuthResult Empty(){
        return new CheckAuthResult(false,NOT_FOUND,null,null);
    }
}
