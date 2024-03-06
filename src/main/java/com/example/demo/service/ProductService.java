package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ProductRepository;
import com.example.demo.vo.Product;


@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
	


	public int getProductsCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return productRepository.getProductsCount(boardId, searchKeywordTypeCode, searchKeyword);

	}

	public List<Product> getForPrintProducts(int boardId, int itemsInAPage, int page, String searchKeywordTypeCode,
			String searchKeyword) {
//		SELECT * FROM article WHERE boardId = 1 ORDER BY id DESC LIMIT 0, 10; 1page
//		SELECT * FROM article WHERE boardId = 1 ORDER BY id DESC LIMIT 10, 10; 2page

		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		return productRepository.getForPrintProducts(boardId, limitFrom, limitTake, searchKeywordTypeCode,
				searchKeyword);
	}
}
