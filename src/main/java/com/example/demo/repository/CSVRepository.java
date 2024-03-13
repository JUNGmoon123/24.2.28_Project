package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CSV;

@Mapper
public interface CSVRepository {

    @Insert({
            "<script>",
            "INSERT INTO CSV (barName, barAddr, barNumber, barWeb) VALUES ",
            "<foreach collection='csvList' item='item' index='index' separator=','>",
            "(#{item.barName}, #{item.barAddr}, #{item.barNumber}, #{item.barWeb})",
            "</foreach>",
            "</script>"
    })
    void insertCSVList(List<CSV> csvList);
}