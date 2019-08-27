package com.baizhi.service;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDao bannerDao;

    //1.查询轮播图所有信息
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Banner> findAllBanner(Integer page, Integer rows, String sidx, String sord) {
        //计算开始下标
        Integer begin = (page - 1) * rows;
        List<Banner> bs = bannerDao.selectAllBanner(begin, rows, sidx, sord);
        return bs;
    }

    //2.查询总条数
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Integer allRows() {
        Integer totalRows = bannerDao.totalRows();
        return totalRows;
    }

    //3.添加轮播图
    @Override
    public void addBanner(Banner banner) {
        bannerDao.insertBanner(banner);
    }

    //4.批量删除
    @Override
    public void cutBannerMore(List<String> ids) {
        bannerDao.deleteBannerMore(ids);

    }

    //5.修改轮播图
    @Override
    public void changeBanner(Banner banner) {
        bannerDao.updateBanner(banner);
    }
}
