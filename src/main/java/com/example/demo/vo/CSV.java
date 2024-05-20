package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class CSV {
	    private int id; 
	    private String barName; 
	    private String barAddr; 
	    private String barNumber; 
	    private String barWeb;
	    //위도 경도
	    private String barlatitude;
	    private String barlongitude;
	    
	    private String barimage;
}
