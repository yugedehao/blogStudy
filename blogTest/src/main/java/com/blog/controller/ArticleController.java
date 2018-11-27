package com.blog.controller;

import com.blog.model.Article;
import com.blog.service.impl.IArticleServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;

@Controller
public class ArticleController {

    @Autowired
    IArticleServiceImpl articleService;

    @RequestMapping({"/article","/jsp/admin/article"})
    public ModelAndView detail(HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("id"));
        Article article=articleService.selectById(id);
        Article articleBefore=articleService.selectArticleBefore(id);
        Article articleNext=articleService.selectArticleNext(id);
        Integer clickNum=article.getClick();

        article.setClick(clickNum+1);
        articleService.updateArticleClick(article);

        ModelAndView modelAndView=new ModelAndView("detail");
        modelAndView.addObject("article",article);
        modelAndView.addObject("articleBefore",articleBefore);
        modelAndView.addObject("articleNext",articleNext);
        return modelAndView;
    }

    @RequestMapping("/jsp/admin/article/add")
    public ModelAndView articleAdd(){
        ModelAndView modelAndView=new ModelAndView("/admin/article_add");
        return modelAndView;
    }
    @RequestMapping("/jsp/admin/article/add/do")
    public String articleAddDo(HttpServletRequest request,
                               RedirectAttributes redirectAttributes){//RedirectAttributes是Spring mvc 3.1版本之后出来的一个功能，专门用于重定向之后还能带参数跳转的
        Article article=new Article();

        article.setTitle(request.getParameter("title"));
        article.setKeywords(request.getParameter("keywords"));
        article.setdesci(request.getParameter("desci"));
        article.setContent(request.getParameter("content"));
        article.setTime(new Date());
        if (articleService.insert(article)){
            redirectAttributes.addFlashAttribute("success", "发表文章成功！");
            return "redirect:/jsp/admin/";
        }else {
            redirectAttributes.addFlashAttribute("error", "发表文章失败！");
            return "redirect:/jsp/admin/article/add";
        }
    }

    @RequestMapping(value = "/jsp/admin/article/edit")
    public ModelAndView articleEdit(HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("id"));
        Article article=articleService.selectById(id);
        ModelAndView modelAndView=new ModelAndView("/admin/article_edit");
        modelAndView.addObject("article",article);
        return modelAndView;
    }
    @RequestMapping(value = "/jsp/admin/article/edit/do")
    public ModelAndView articleEditDo(HttpServletRequest request){
        Article article=new Article();
        article.setId(Integer.parseInt(request.getParameter("id")));
        article.setTitle(request.getParameter("title"));
        article.setKeywords(request.getParameter("keywords"));
        article.setdesci(request.getParameter("desci"));
        article.setContent(request.getParameter("content"));
        ModelAndView modelAndView=new ModelAndView("/admin/article_edit");
        if (articleService.updateArticle(article)){
            modelAndView.addObject("succ", "修改文章成功！");
        }else {
            modelAndView.addObject("error", "修改文章失败！");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/jsp/admin/delete",method=RequestMethod.POST)
    public @ResponseBody Object deleteCheck(HttpServletRequest request) {
        int id=Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        int result=articleService.deleteById(id);
        System.out.println(result);
        HashMap<String, String> res = new HashMap<String, String>();
        if (result==1){
            res.put("stateCode", "1");
        }else {
            res.put("stateCode", "0");
        }
        return res;
    }

}
