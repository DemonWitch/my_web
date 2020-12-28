package com.linln.modules.cloud.service.impl;

import com.linln.common.data.PageSort;
import com.linln.common.enums.StatusEnum;
import com.linln.modules.cloud.domain.Scripts;
import com.linln.modules.cloud.repository.ScriptsRepository;
import com.linln.modules.cloud.service.ScriptsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Richard_Lv
 * @date 2020/12/18
 */
@Service
public class ScriptsServiceImpl implements ScriptsService {

    @Autowired
    private ScriptsRepository scriptsRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Scripts getById(Long id) {
        return scriptsRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Scripts> getPageList(Example<Scripts> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return scriptsRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param scripts 实体对象
     */
    @Override
    public Scripts save(Scripts scripts) {
        return scriptsRepository.save(scripts);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return scriptsRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}