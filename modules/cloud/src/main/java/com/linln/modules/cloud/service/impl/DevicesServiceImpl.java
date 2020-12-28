package com.linln.modules.cloud.service.impl;

import com.linln.common.data.PageSort;
import com.linln.common.enums.StatusEnum;
import com.linln.component.shiro.ShiroUtil;
import com.linln.modules.cloud.domain.Devices;
import com.linln.modules.cloud.repository.DevicesRepository;
import com.linln.modules.cloud.service.DevicesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Richard_Lv
 * @date 2020/12/16
 */
@Service
public class DevicesServiceImpl implements DevicesService {

    @Autowired
    private DevicesRepository devicesRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Devices getById(Long id) {
        return devicesRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Devices> getPageList(Example<Devices> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return devicesRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param devices 实体对象
     */
    @Override
    public Devices save(Devices devices) {
        devices.setIpAddress(ShiroUtil.getIp());
        return devicesRepository.save(devices);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return devicesRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}