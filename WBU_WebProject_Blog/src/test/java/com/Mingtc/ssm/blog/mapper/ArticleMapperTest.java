package com.Mingtc.ssm.blog.mapper;

import com.Mingtc.ssm.blog.BaseTest;
import com.Mingtc.ssm.blog.entity.Article;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;



public class ArticleMapperTest extends BaseTest {

    @Autowired
    private ArticleMapper articleMapper;

    @Test
    public void countArticleView() {
        int result = articleMapper.countArticleView();
        System.out.println(result);
    }

    @Test
    public void listArticle() {
        List<Article> articleList = articleMapper.listArticle();
        System.out.println(articleList);
    }
}
