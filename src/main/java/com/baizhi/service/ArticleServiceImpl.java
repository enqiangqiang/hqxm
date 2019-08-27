package com.baizhi.service;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Map<String, Object> selectAllArticle(Integer page, Integer rows) {
        Map<String, Object> map = new HashMap<>();

        Integer begin = (page - 1) * rows;
        List<Article> list = articleDao.selectAllArticle(begin, rows);

        int count = articleDao.count();
        map.put("page", page);
        map.put("rows", list);
        map.put("total", count % rows == 0 ? count / rows : count / rows + 1);
        map.put("records", count);
        return map;
    }

    @Override
    public void add(Article article) {
        article.setId(UUID.randomUUID().toString());
        article.setCreateDate(new Date());
//        添加至数据库
        System.out.println("article:" + article);
        articleDao.add(article);

    }

    @Override
    public void edit(Article article) {
        articleDao.edit(article);
    }

    @Override
    public void del(List<String> ids) {
        articleDao.del(ids);
    }

}
