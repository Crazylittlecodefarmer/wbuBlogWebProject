package com.liuyanzhao.ssm.blog.service.impl;

import com.liuyanzhao.ssm.blog.entity.Options;
import com.liuyanzhao.ssm.blog.mapper.OptionsMapper;
import com.liuyanzhao.ssm.blog.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;


@Service
public class OptionsServiceImpl implements OptionsService {


    @Autowired
    private OptionsMapper optionsMapper;

    @Override
    @Cacheable(value = "default", key = "'options'")
    public Options getOptions() {
        return optionsMapper.getOptions();
    }

    @Override
    @CacheEvict(value = "default", key = "'options'")
    public void insertOptions(Options options) {
        optionsMapper.insert(options);
    }

    @Override
    @CacheEvict(value = "default", key = "'options'")
    public void updateOptions(Options options) {
        optionsMapper.update(options);
    }
}
