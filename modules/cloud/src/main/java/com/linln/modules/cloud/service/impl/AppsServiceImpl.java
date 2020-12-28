package com.linln.modules.cloud.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.linln.common.data.PageSort;
import com.linln.common.enums.StatusEnum;
import com.linln.modules.cloud.domain.Apps;
import com.linln.modules.cloud.repository.AppsRepository;
import com.linln.modules.cloud.service.AppsService;
import com.linln.modules.cloud.util.IteratorUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Richard_Lv
 * @date 2020/12/17
 */
@Service
public class AppsServiceImpl implements AppsService {
    @Autowired
    private AppsRepository appsRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Apps getById(Long id) {
        return appsRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Apps> getPageList(Example<Apps> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return appsRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param apps 实体对象
     */
    @Override
    public Apps save(Apps apps) {
        return appsRepository.save(apps);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return appsRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }

    /**
     * 查询所有App数据，并根据App类型分类整理成不同集合
     * @return
     *      指定格式json
     */
    @Override
    public JSONObject getAll(){
        List<Apps> apps=appsRepository.findAll();
        if (apps.isEmpty()) return null;
        JSONObject json=new JSONObject();
        json.put("appName","default");
        Map<Byte, List<Apps>> groupByMap = apps.stream().collect(Collectors.groupingBy(Apps::getAppType));
        groupByMap.keySet().forEach( type ->{
            List<Apps> oneTypeApps=groupByMap.get(type);
            JSONArray oneArray=new JSONArray();
            IteratorUtil.forEach(0,oneTypeApps,(index,oneApp)->{
                JSONObject one=new JSONObject();
                one.put("sortNum",index);
                one.put("name",oneApp.getAppName());
                one.put("pkg",oneApp.getAppPkgName());
                one.put("maxRunSeconds",oneApp.getMaxRunSeconds());
                one.put("apkUrl",oneApp.getAppDownloadUrl());
                one.put("scriptUrl","");
                one.put("remark",oneApp.getRemark());
                one.put("appVersion",oneApp.getAppVersion());
                one.put("appType",type);
                oneArray.add(one);
            });
            json.put("appList"+type,oneArray);
        });
        return json;
    }
}