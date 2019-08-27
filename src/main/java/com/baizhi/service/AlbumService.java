package com.baizhi.service;

import com.baizhi.entity.Album;

import java.util.Map;

public interface AlbumService {

    Map<String, Object> selectAllAlbum(Integer page, Integer rows);


    String add(Album album);

    void edit(Album album);

}
