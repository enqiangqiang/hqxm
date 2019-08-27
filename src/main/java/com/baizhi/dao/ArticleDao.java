package com.baizhi.dao;


import com.baizhi.entity.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ArticleDao {

    public List<Article> selectAllArticle(Integer begin, Integer rows);

    public Integer count();

    public void add(Article article);

    public void edit(Article article);

    public void del(@Param("ids") List<String> ids);

}
