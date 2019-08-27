package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import com.baizhi.until.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    //1.查询所有轮播图
    @RequestMapping("/qureyAllBanner")
    @ResponseBody
    public Map<String, Object> qureyAllBanner(Integer page, Integer rows, String sidx, String sord) {
        //查询数据
        List<Banner> banners = bannerService.findAllBanner(page, rows, sidx, sord);
        //查询总条数
        Integer records = bannerService.allRows();
        //计算总页数
        Integer total = null;
        if (records % rows == 0) {
            total = records / rows;
        } else {
            total = records / rows + 1;
        }
        //按照远程加载数据的要求
        Map<String, Object> map = new HashMap<>();
        map.put("page", page);//当前页码
        map.put("total", total);//总页数
        map.put("records", records);//总条数
        map.put("rows", banners);//数据

        return map;
    }

    //2.增删改
    @RequestMapping("/editBanner")
    @ResponseBody
    public Map<String, String> editBanner(String oper, Banner banner, String id, String img_path) {
        //创建一个表状态的map
        HashMap<String, String> map = new HashMap<>();

        if ("add".equals(oper)) {//添加
            String uuid = UUIDUtil.uuid();
            //img_path分割
            String[] s = img_path.split("\\\\");
            String ss = s[s.length - 1];

            banner.setId(uuid);
            banner.setImg_path(ss);
            banner.setCreate_date(new Date());
            bannerService.addBanner(banner);
            map.put("status", "ok");
        } else if ("edit".equals(oper)) {//编辑
            bannerService.changeBanner(banner);
            map.put("status", "ok");
        } else if ("del".equals(oper)) {//删除
            //将id分割，并放在集合里
            String[] strs = id.split(",");
            List<String> ids = new ArrayList<>();
            for (String str : strs) {
                ids.add(str);

            }
            bannerService.cutBannerMore(ids);
            map.put("status", "ok");
        } else {
            map.put("status", "error");
        }
        return map;
    }

    //3.添加后的额外功能（上传）
    @RequestMapping("upload")
    public void upload(MultipartFile img_path, HttpSession session) {
        //获取图片上传的路径
        String realPath = session.getServletContext().getRealPath("/img");
        //
        File file = new File(realPath);
        if (!file.exists()) {
            file.mkdirs();
        }
        String filename = img_path.getOriginalFilename();
        try {
            img_path.transferTo(new File(realPath, filename));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
