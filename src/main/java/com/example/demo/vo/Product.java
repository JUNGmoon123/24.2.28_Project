package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
    private String productName;
    private int abv;
    private String price;
	private String body;
	private int hitCount;
	private int goodReactionPoint;
	private int badReactionPoint;
}
