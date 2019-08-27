package com.baizhi.dao;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface BannerDao {
    //1.查询轮播图所有信息
    List<Banner> selectAllBanner(@Param("begin") Integer begin, @Param("rows") Integer rows,
                                 @Param("sidx") String sidx, @Param("sord") String sord);

    //2.查询总条数
    Integer totalRows();

    //3.添加轮播图
    void insertBanner(Banner banner);

    //4.批量删除
    void deleteBannerMore(@Param("ids") List<String> ids);

    //5.修改轮播图
    void updateBanner(Banner banner);


}
