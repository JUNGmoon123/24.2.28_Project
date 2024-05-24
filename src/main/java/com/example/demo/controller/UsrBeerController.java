package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.repository.BeerRepository;
import com.example.demo.service.BeerService;
import com.example.demo.service.BoardService;
import com.example.demo.vo.Article;
import com.example.demo.vo.Beer;
import com.example.demo.vo.Board;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrBeerController {

	@Autowired
	private Rq rq;

	@Autowired
	private BeerService beerService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private BeerRepository beerRepository;

	public UsrBeerController(BeerRepository beerRepository) {
		this.beerRepository = beerRepository;
	}
	
	//페이지네이션 새로받은쪽
	@RequestMapping("/usr/product/beer")
	public String getProductBeer(HttpServletRequest req, Model model, @RequestParam(defaultValue = "8") int boardId,
	        @RequestParam(defaultValue = "btype, model") String searchKeywordTypeCode,
	        @RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page,
	        @RequestParam(defaultValue = "14") int limit, @RequestParam(defaultValue = "") String btype) {

	    Rq rq = (Rq) req.getAttribute("rq");

	    Board board = boardService.getBoardById(boardId);

	    if (board == null) {
	        return rq.historyBackOnView("없는 게시판이에요");
	    }

	    int articlesCount = beerService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword, btype);
	    int offset = (page - 1) * limit;
	    int totalPages = (int) Math.ceil((double) articlesCount / limit);

	    List<Beer> beerList = beerService.getForPrintBeers(boardId, searchKeywordTypeCode, searchKeyword, btype, offset, limit);

	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("board", board);
	    model.addAttribute("boardId", boardId);
	    model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
	    model.addAttribute("searchKeyword", searchKeyword);
	    model.addAttribute("articlesCount", articlesCount);
	    model.addAttribute("beerList", beerList);
	    model.addAttribute("btype", btype);

	    return "usr/product/beer";
	}
	
	@RequestMapping("/usr/product/beerdetail")
	public String beerDetail(HttpServletRequest req, Model model, int id) {


		Beer beer = beerService.getForPrintBeer(id);

		model.addAttribute("beer", beer);
		return "usr/product/beerdetail";
	}
}
