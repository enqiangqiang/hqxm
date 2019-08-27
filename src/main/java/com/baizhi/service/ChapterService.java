package com.baizhi.service;

import com.baizhi.entity.Chapter;

import java.util.Map;

public interface ChapterService {

    Map<String, Object> selectChaptersByAlbumId(String albumId, Integer page, Integer rows);

    String add(Chapter chapter);

    void edit(Chapter chapter);


}
