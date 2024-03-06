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
	private int boardId;
    private String productName;
    private String abv;
    private String price;
	private String body;
}
