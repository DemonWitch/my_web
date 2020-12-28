package com.linln.modules.cloud.service.impl;

import com.linln.common.data.PageSort;
import com.linln.common.enums.StatusEnum;
import com.linln.modules.cloud.domain.Agents;
import com.linln.modules.cloud.repository.AgentsRepository;
import com.linln.modules.cloud.service.AgentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
@Service
public class AgentsServiceImpl implements AgentsService {

    @Autowired
    private AgentsRepository agentsRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Agents getById(Long id) {
        return agentsRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Agents> getPageList(Example<Agents> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return agentsRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param agents 实体对象
     */
    @Override
    public Agents save(Agents agents) {
        return agentsRepository.save(agents);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return agentsRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}