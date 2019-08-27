package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("album")
@RestController
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    @RequestMapping("selectAllAlbum")
    public Map<String, Object> selectAllAlbum(Integer page, Integer rows) {
        Map<String, Object> map = albumService.selectAllAlbum(page, rows);
        return map;
    }

    @RequestMapping("edit")
    public Map<String, Object> edit(String oper, Album album) {
        HashMap<String, Object> map = new HashMap<>();
        if (oper.equals("add")) {
            try {
                String id = albumService.add(album);
                map.put("status", true);
                map.put("message", id);
            } catch (Exception e) {
                map.put("status", true);
                map.put("message", e.getMessage());
            }
        }
        if ("edit".equals(oper)) {
            album.setCover(null);
            albumService.edit(album);
            map.put("status", true);
        }
        return map;
    }

    @RequestMapping("upload")
    public void upload(MultipartFile cover, String id, HttpSession session) {
//        文件上传
        try {
            cover.transferTo(new File(session.getServletContext().getRealPath("album/img"), cover.getOriginalFilename()));
//        修改album的cover属性
            Album album = new Album();
            album.setId(id);
            album.setCover(cover.getOriginalFilename());
            albumService.edit(album);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


}
