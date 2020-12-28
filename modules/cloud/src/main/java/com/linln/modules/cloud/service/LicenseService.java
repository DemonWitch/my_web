package com.linln.modules.cloud.service;

import com.linln.common.enums.StatusEnum;
import com.linln.modules.cloud.domain.License;
import com.linln.modules.cloud.result.CheckAuthResult;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
public interface LicenseService {

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    Page<License> getPageList(Example<License> example);

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    License getById(Long id);

    /**
     * 根据邀请码查询数据
     * @param authCode 邀请码
     */
    CheckAuthResult checkAuthCode(String authCode);
    /**
     * 保存数据
     * @param license 实体对象
     */
    void save(License license);

    /**
     * 修改数据
     * @param license 实体对象
     */
    License update(License license);

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Transactional
    Boolean updateStatus(StatusEnum statusEnum, List<Long> idList);
}