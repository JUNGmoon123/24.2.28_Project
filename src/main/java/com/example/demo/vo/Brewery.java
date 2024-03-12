package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Brewery {
    private int id; 
    private String barName; 
    private String barAddr; 
    private String barNumber; 
    private String barWeb; 
    private String barCome; 
    private int barPoint; 
}
