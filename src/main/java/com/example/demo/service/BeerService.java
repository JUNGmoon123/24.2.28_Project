package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BeerRepository;
import com.example.demo.vo.Article;
import com.example.demo.vo.Beer;

@Service
public class BeerService {

	@Autowired
	private BeerRepository beerRepository;
	
	public BeerService(BeerRepository beerRepository) {
		this.beerRepository = beerRepository;
	}
	
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword, String btype) {
		return beerRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword, btype);
	}

	public List<Beer> getForPrintBeers(int boardId, String searchKeywordTypeCode, String searchKeyword, String btype, int offset, int limit) {
	    return beerRepository.getForPrintBeers(boardId, searchKeywordTypeCode, searchKeyword, btype, offset, limit);
	}

	public Beer getForPrintBeer(int id) {

		Beer beer = beerRepository.getForPrintBeer(id);
		return beer;
	}

}
