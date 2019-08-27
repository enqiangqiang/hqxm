package com.baizhi.service;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BannerService {
    //1.查询轮播图所有信息
    List<Banner> findAllBanner(Integer page, Integer rows, String sidx, String sord);

    //2.查询总条数
    Integer allRows();

    //3.添加轮播图
    void addBanner(Banner banner);

    //4.批量删除
    void cutBannerMore(@Param("ids") List<String> ids);

    //5.修改轮播图
    void changeBanner(Banner banner);

}
