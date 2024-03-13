package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BeerRepository;
import com.example.demo.vo.Beer;

@Service
public class BeerService {

	@Autowired
	private BeerRepository beerRepository;
	
	public BeerService(BeerRepository beerRepository) {
		this.beerRepository = beerRepository;
	}
	
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return beerRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}

	public List<Beer> getForPrintBeers(int boardId, int itemsInAPage, int page, String searchKeywordTypeCode,
			String searchKeyword) {
		
		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		
		return beerRepository.getForPrintBeers(boardId, limitFrom, limitTake, searchKeywordTypeCode,
				searchKeyword);
	}

}
