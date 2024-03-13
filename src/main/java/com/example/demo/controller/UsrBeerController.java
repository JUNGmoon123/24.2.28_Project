package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.BeerService;
import com.example.demo.service.BoardService;
import com.example.demo.vo.Beer;
import com.example.demo.vo.Board;
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

		@RequestMapping("/usr/product/beer")
		public String APIgps(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
				@RequestParam(defaultValue = "1") int page,
				@RequestParam(defaultValue = "btype, model") String searchKeywordTypeCode,
				@RequestParam(defaultValue = "") String searchKeyword) {

			Rq rq = (Rq) req.getAttribute("rq");
			// showList() 메서드의 내용을 여기로 이동

			Board board = boardService.getBoardById(boardId);

			int articlesCount = beerService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);

			if (board == null) {
				return rq.historyBackOnView("없는 게시판이야");
			}

			int itemsInAPage = 10;
			int pagesCount = (int) Math.ceil(articlesCount / (double) itemsInAPage);

			List<Beer> beers = beerService.getForPrintBeers(boardId, itemsInAPage, page, searchKeywordTypeCode,
					searchKeyword);

			model.addAttribute("board", board);
			model.addAttribute("boardId", boardId);
			model.addAttribute("page", page);
			model.addAttribute("pagesCount", pagesCount);
			model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("articlesCount", articlesCount);
			model.addAttribute("beers", beers);

			return "usr/product/beer";
		}		
}
