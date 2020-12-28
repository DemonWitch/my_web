package com.linln.modules.cloud.service;

import com.alibaba.fastjson.JSONObject;
import com.linln.common.enums.StatusEnum;
import com.linln.modules.cloud.domain.Apps;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
public interface AppsService {

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    Page<Apps> getPageList(Example<Apps> example);

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    Apps getById(Long id);

    /**
     * 保存数据
     * @param apps 实体对象
     */
    Apps save(Apps apps);

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Transactional
    Boolean updateStatus(StatusEnum statusEnum, List<Long> idList);

    JSONObject getAll();
}