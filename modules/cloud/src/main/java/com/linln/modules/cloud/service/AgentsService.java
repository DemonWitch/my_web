package com.linln.modules.cloud.service;

import com.linln.common.enums.StatusEnum;
import com.linln.modules.cloud.domain.Agents;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
public interface AgentsService {

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    Page<Agents> getPageList(Example<Agents> example);

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    Agents getById(Long id);

    /**
     * 保存数据
     * @param agents 实体对象
     */
    Agents save(Agents agents);

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Transactional
    Boolean updateStatus(StatusEnum statusEnum, List<Long> idList);
}