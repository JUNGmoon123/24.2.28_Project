package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Brewery2 {
    private int id; 
	private int memberId;
	private int boardId;
    private String barName; 
    private String barAddr; 
    private String barNumber; 
    private String barWeb; 
    private String barCome;
    
    //위도 경도
    private String barlatitude;
    private String barlongitude;
    private String barimage;
}
