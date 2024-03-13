package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BreweryRepository2;
import com.example.demo.vo.Brewery2;

@Service
public class BreweryService2 {
	
	@Autowired
	private BreweryRepository2 breweryRepository;
	
	public BreweryService2(BreweryRepository2 breweryRepository) {
		this.breweryRepository = breweryRepository;
	}
	
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return breweryRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}
	
	public List<Brewery2> getForPrintBrewerys(int boardId, int itemsInAPage, int page,
			String searchKeywordTypeCode, String searchKeyword) {
		
//		SELECT * FROM article WHERE boardId = 1 ORDER BY id DESC LIMIT 0, 10; 1page
//		SELECT * FROM article WHERE boardId = 1 ORDER BY id DESC LIMIT 10, 10; 2page

		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		
		return breweryRepository.getForPrintBrewerys(boardId, limitFrom, limitTake, searchKeywordTypeCode,
				searchKeyword);
	}

}
