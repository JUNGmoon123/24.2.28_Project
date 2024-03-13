package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Beer {
   private int id ;
   private String type;
   private String model;
   private int year;
   private String color;
   private String price;
   private String src;
}
