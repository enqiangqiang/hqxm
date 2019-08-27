package com.baizhi.dao;

import com.baizhi.entity.Album;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.common.Mapper;

@Component
public interface AlbumDao extends Mapper<Album> {
}
