package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Product;


@Mapper
public interface ProductRepository {
	
	
	@Select("""
			SELECT *
			FROM product
			WHERE boardId = #{boardId}
			""")
	public Product getProductsCount(int boardId);
	
	@Select("""
			SELECT *
			FROM product
			WHERE id = #{id}
			""")
	public Product getProduct(int id);
	
}
