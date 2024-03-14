package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.repository.BeerRepository;
import com.example.demo.service.BeerService;
import com.example.demo.service.BoardService;
import com.example.demo.vo.Beer;
import com.example.demo.vo.Rq;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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

	@GetMapping("/usr/product/beer")
	public String showMap(Model model) throws JsonProcessingException {
		List<Beer> beerList = beerRepository.selectList();
        ObjectMapper mapper = new ObjectMapper();
        String beersJson = mapper.writeValueAsString(beerList);
        model.addAttribute("beersJson", beersJson);
		model.addAttribute("beerList", beerList);
		return "usr/product/beer";
	}
	
	private List<Beer> BeerList(String filePath) {
		List<Beer> beerList = new ArrayList<>();
		try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
			String line;
			// 첫 줄은 헤더일 수 있으므로 스킵
			// br.readLine();
			while ((line = br.readLine()) != null) {
				String[] data = line.split(",");
				System.err.println("데이터 길이: " + data.length); // 데이터 배열의 길이 출력
				Beer beer = new Beer();
				beer.setId(Integer.parseInt(data[0]));
				beer.setBoardId(Integer.parseInt(data[1]));
				beer.setBtype(data[2]);
				beer.setModel(data[3]);
				beer.setByear(Integer.parseInt(data[4]));
				beer.setColor(data[5]);
				beer.setPrice(data[6]);
				beer.setSrc(data[7]);

				beerList.add(beer);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return beerList;
	}
//	@RequestMapping("/usr/product/beer")
//	public String APIgps(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
//			@RequestParam(defaultValue = "1") int page,
//			@RequestParam(defaultValue = "btype, model") String searchKeywordTypeCode,
//			@RequestParam(defaultValue = "") String searchKeyword) {
//
//		Rq rq = (Rq) req.getAttribute("rq");
//		// showList() 메서드의 내용을 여기로 이동
//
//		Board board = boardService.getBoardById(boardId);
//
//		int articlesCount = beerService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
//
//		if (board == null) {
//			return rq.historyBackOnView("없는 게시판이야");
//		}
//
//		int itemsInAPage = 10;
//		int pagesCount = (int) Math.ceil(articlesCount / (double) itemsInAPage);
//
//		List<Beer> beers = beerService.getForPrintBeers(boardId, itemsInAPage, page, searchKeywordTypeCode,
//				searchKeyword);
//
//		model.addAttribute("board", board);
//		model.addAttribute("boardId", boardId);
//		model.addAttribute("page", page);
//		model.addAttribute("pagesCount", pagesCount);
//		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
//		model.addAttribute("searchKeyword", searchKeyword);
//		model.addAttribute("articlesCount", articlesCount);
//		model.addAttribute("beers", beers);
//
//		return "usr/product/beer";
//	}

}
