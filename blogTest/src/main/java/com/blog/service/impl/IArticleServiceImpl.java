package com.blog.service.impl;

import com.blog.dao.IArticleDao;
import com.blog.model.Article;
import com.blog.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IArticleServiceImpl implements IArticleService {

    @Autowired
    public IArticleDao IArticleDao;

    public List<Article> queryAll() {
        return IArticleDao.queryAll();
    }

    public Article selectById(Integer id) {
        return IArticleDao.selectById(id);
    }

    public Article selectArticleBefore(Integer id) {
        return IArticleDao.selectArticleBefore(id);
    }

    public Article selectArticleNext(Integer id) {
        return IArticleDao.selectArticleNext(id);
    }

    public boolean updateArticleClick(Article article) {
        return IArticleDao.updateByIdSelected(article)>0;
    }

    public boolean insert(Article article) {
        return IArticleDao.insert(article)>0;
    }

    public int deleteById(Integer id) {
        return IArticleDao.deleteById(id);
    }

    public boolean updateArticle(Article article) {
        return IArticleDao.updateByIdSelected(article)>0;
    }
}
