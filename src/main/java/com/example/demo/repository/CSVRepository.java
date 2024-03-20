package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CSV;
import com.example.demo.vo.CSV2;

@Mapper
public interface CSVRepository {

    @Insert({
            "<script>",
            "INSERT INTO brewery (barName, barAddr, barNumber, barWeb, barlatitude, barlongitude) VALUES ",
            "<foreach collection='csvList' item='item' index='index' separator=','>",
            "(#{item.barName}, #{item.barAddr}, #{item.barNumber}, #{item.barWeb}, #{item.barlatitude}, #{item.barlongitude} )",
            "</foreach>",
            "</script>"
    })
    void insertCSVList(List<CSV> csvList);

    
    @Insert({
        "<script>",
        "INSERT INTO beers (btype, model, byear, color, price, src) VALUES ",
        "<foreach collection='csvList' item='item' index='index' separator=','>",
        "(#{item.btype}, #{item.model}, #{item.byear}, #{item.color}, #{item.price}, #{item.src})",
        "</foreach>",
        "</script>"
    })
	void insertCSVList2(List<CSV2> csvList);
}