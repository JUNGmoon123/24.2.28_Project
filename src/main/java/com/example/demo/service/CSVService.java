package com.example.demo.service;

import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CSVRepository;
import com.example.demo.vo.CSV;
import com.example.demo.vo.CSV2;
import com.opencsv.CSVReader;

@Service
public class CSVService {

    @Autowired
    private CSVRepository csvRepository;

    public String readAndSaveToDB() {
        try {
            List<CSV> csvList = new ArrayList<>();

            // 예시 파일들을 배열에 추가
            String[] fileNames = {"breweryInfo.csv"};
            

            for (String fileName : fileNames) {
                InputStreamReader is = new InputStreamReader(getClass().getClassLoader().getResourceAsStream("CSV/" + fileName), "EUC-KR");
                CSVReader reader = new CSVReader(is);

                // 첫 번째 줄(헤더) 건너뛰기
                reader.skip(1);

                List<String[]> list = reader.readAll();

                for (String[] csvRow : list) {
                    CSV csv = new CSV();
                    // 엔터티의 필드에 CSV 데이터를 할당
                    csv.setBarName(csvRow[0]);
                    csv.setBarAddr(csvRow[1]);
                    csv.setBarNumber(csvRow[2]);
                    csv.setBarWeb(csvRow[3]);
                    csv.setBarlatitude(csvRow[4]);
                    csv.setBarlongitude(csvRow[5]);
//                    csv.setBarCome(csvRow[5]);
//                    csv.setBarPoint(Integer.parseInt(csvRow[6]));
                    csvList.add(csv);
                }
            }

            // CSV 데이터를 데이터베이스에 저장
            csvRepository.insertCSVList(csvList);

            return "CSV 데이터가 성공적으로 데이터베이스에 저장되었습니다.";

        } catch (Exception e) {
            e.printStackTrace();
            return "CSV 데이터를 데이터베이스에 저장하는 중 오류가 발생했습니다.";
        }
    }
    
    public String readAndSaveToDB2() {
        try {
            List<CSV2> csvList = new ArrayList<>();

            // 예시 파일들을 배열에 추가
            String[] fileNames = {"beerInfo.csv"};
            

            for (String fileName : fileNames) {
                InputStreamReader is = new InputStreamReader(getClass().getClassLoader().getResourceAsStream("CSV/" + fileName), "EUC-KR");
                CSVReader reader = new CSVReader(is);

                // 첫 번째 줄(헤더) 건너뛰기
                reader.skip(1);

                List<String[]> list = reader.readAll();

                for (String[] csvRow : list) {
                    CSV2 csv = new CSV2();
                    // 엔터티의 필드에 CSV 데이터를 할당
                    csv.setBtype(csvRow[0]);
                    csv.setModel(csvRow[1]);
                    csv.setByear(csvRow[2]);
                    csv.setColor(csvRow[3]);
                    csv.setPrice(csvRow[4]);
                    csv.setSrc(csvRow[5]);
//                    csv.setBarCome(csvRow[5]);
//                    csv.setBarPoint(Integer.parseInt(csvRow[6]));
                    csvList.add(csv);
                }
            }

            // CSV 데이터를 데이터베이스에 저장
            csvRepository.insertCSVList2(csvList);

            return "CSV2 데이터가 성공적으로 데이터베이스에 저장되었습니다.";

        } catch (Exception e) {
            e.printStackTrace();
            return "CSV2 데이터를 데이터베이스에 저장하는 중 오류가 발생했습니다.";
        }
    }
}