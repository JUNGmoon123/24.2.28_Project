package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Beer {
   private int id ;
   private int boardId;
   private String btype;
   private String model;
   private int byear;
   private String color;
   private String price;
   private String src;
   private String binfo;
}
