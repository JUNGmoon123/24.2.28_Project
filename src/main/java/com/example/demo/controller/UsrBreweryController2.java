package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BoardService;
import com.example.demo.service.BreweryService2;
import com.example.demo.vo.Beer;
import com.example.demo.vo.Board;
import com.example.demo.vo.Brewery2;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrBreweryController2 {
	@Autowired
	private Rq rq;

	@Autowired
	private BreweryService2 breweryService;

	@Autowired
	private BoardService boardService;

	@RequestMapping("/usr/brewery/brewerylist")
	public String APIgps(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "barName, barAddr") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");
		// showList() 메서드의 내용을 여기로 이동

		Board board = boardService.getBoardById(boardId);

		int articlesCount = breweryService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);

		if (board == null) {
			return rq.historyBackOnView("없는 게시판이야");
		}

		int itemsInAPage = 10;
		int pagesCount = (int) Math.ceil(articlesCount / (double) itemsInAPage);

		List<Brewery2> brewerys2 = breweryService.getForPrintBrewerys(boardId, itemsInAPage, page, searchKeywordTypeCode,
				searchKeyword);
		
		
		model.addAttribute("board", board);
		model.addAttribute("boardId", boardId);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("brewerys2", brewerys2);

		return "usr/brewery/brewerylist";
	}
	
	  
		@RequestMapping("/usr/brewery/brewerydetail")
		public String brewerydetail(HttpServletRequest req, Model model, int id) {


			Brewery2 brewery = breweryService.getForPrintBrewery(id);

			model.addAttribute("brewery2", brewery);
			return "usr/brewery/brewerydetail";
		}
}
