package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.vo.Article;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
	
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return ProductRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}
	
	public List<Article> getForPrintArticles(int boardId, int itemsInAPage, int page, String searchKeywordTypeCode,
			String searchKeyword) {

//		SELECT * FROM article WHERE boardId = 1 ORDER BY id DESC LIMIT 0, 10; 1page
//		SELECT * FROM article WHERE boardId = 1 ORDER BY id DESC LIMIT 10, 10; 2page

		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		return ProductRepository.getForPrintArticles(boardId, limitFrom, limitTake, searchKeywordTypeCode,
				searchKeyword);
	}
}
