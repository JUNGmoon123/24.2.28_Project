package com.example.demo.service;

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
	
	public Product getProductsCount(int boardId) {
		return productRepository.getProductsCount(boardId);
	}
	
	public Product getProduct(int id) {
		return productRepository.getProduct(id);
	}
}
