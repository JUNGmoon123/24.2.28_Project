package com.example.demo.controller;

import com.example.demo.service.CSVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CSVController {

    @Autowired
    private CSVService csvService;
    
    //여긴 양조장정보CSV
    @GetMapping("/readAndSaveToDB")
    @ResponseBody
    public String readAndSaveToDB() {
        return csvService.readAndSaveToDB();
    }
    
    //여긴 술관련 CSV임
    @GetMapping("/readAndSaveToDB2")
    @ResponseBody
    public String readAndSaveToDB2() {
        return csvService.readAndSaveToDB2();
    }
}