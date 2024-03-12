package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BreweryRepository;
import com.example.demo.vo.Brewery;

@Service
public class BreweryService {
	
	@Autowired
	private BreweryRepository breweryRepository;
	
	public BreweryService(BreweryRepository breweryRepository) {
		this.breweryRepository = breweryRepository;
	}
	
	public int getArticlesCount(int id, String searchKeywordTypeCode, String searchKeyword) {
		return breweryRepository.getArticlesCount(id, searchKeywordTypeCode, searchKeyword);
	}
	
	public List<Brewery> getForPrintBrewerys(int id, int itemsInAPage, int page,
			String searchKeywordTypeCode, String searchKeyword) {
		return breweryRepository.getForPrintBrewerys(id, itemsInAPage, page, searchKeywordTypeCode, searchKeyword);
	}

}
