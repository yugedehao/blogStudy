package com.blog.dao;

import com.blog.model.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IArticleDao {

    List<Article> queryAll();

    Article selectById(Integer id);

    Article selectArticleBefore(Integer id);

    Article selectArticleNext(Integer id);

    int updateByIdSelected(Article record);

    int insert(Article record);

    int deleteById(Integer id);

}