package com.blog.service;

import com.blog.model.Article;

import java.util.List;

public interface IArticleService {

    List<Article> queryAll();

    Article selectById (Integer id);

    Article selectArticleBefore (Integer id);

    Article selectArticleNext (Integer id);

    boolean updateArticleClick(Article article);

    boolean insert(Article article);

    int deleteById(Integer id);

    boolean updateArticle(Article article);

}
