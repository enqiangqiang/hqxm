package com.baizhi.dao;

import com.baizhi.entity.Chapter;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.common.Mapper;

@Component
public interface ChapterDao extends Mapper<Chapter> {
}
