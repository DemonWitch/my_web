package com.linln.modules.cloud.service.impl;

import com.linln.common.data.PageSort;
import com.linln.common.enums.StatusEnum;
import com.linln.modules.cloud.domain.License;
import com.linln.modules.cloud.repository.LicenseRepository;
import com.linln.modules.cloud.result.CheckAuthResult;
import com.linln.modules.cloud.service.LicenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
@Service
public class LicenseServiceImpl implements LicenseService {

    @Autowired
    private LicenseRepository licenseRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public License getById(Long id) {
        return licenseRepository.findById(id).orElse(null);
    }

    /**
     * 根据邀请码查询数据
     * 如果有则返回true
     * 否则返回false
     * @param authCode 邀请码
     */
    public CheckAuthResult checkAuthCode(String authCode){
        License license=licenseRepository.findByInvitationCode(authCode);
        if (license!=null) return CheckAuthResult.OK(license.getActivationDate(),license.getExpireDate());
        return CheckAuthResult.Empty();
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<License> getPageList(Example<License> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return licenseRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param license 实体对象
     */
    @Override
    public void save(License license) {
        String[] licenses=license.getInvitationCode().split(",");
        if (licenses.length>0){
            Arrays.stream(licenses).parallel().forEach(str ->{
                License newLicense=new License();
                newLicense.setAgent(license.getAgent());
                newLicense.setInvitationCode(str);
                newLicense.setActivationDate(license.getActivationDate());
                newLicense.setExpireDate(license.getExpireDate());
                newLicense.setRemark(license.getRemark());
                newLicense.setStatus(license.getStatus());
                licenseRepository.save(newLicense);
            });
        }else{
            licenseRepository.save(license);
        }
    }

    /**
     * 修改数据
     * @param license 实体对象
     */
    @Override
    public License update(License license) {
        return licenseRepository.save(license);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return licenseRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}