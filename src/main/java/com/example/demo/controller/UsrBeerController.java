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

//	@GetMapping("/usr/product/beer")
//	public String showMap(Model model) throws JsonProcessingException {
//		List<Beer> beerList = beerRepository.selectList();
//        ObjectMapper mapper = new ObjectMapper();
//        String beersJson = mapper.writeValueAsString(beerList);
//        model.addAttribute("beersJson", beersJson);
//		model.addAttribute("beerList", beerList);
//		return "usr/product/beer";
//	}

	@RequestMapping("/usr/product/beer")
	public String getProductBeer(HttpServletRequest req, Model model, @RequestParam(defaultValue = "8") int boardId,
	        @RequestParam(defaultValue = "btype, model") String searchKeywordTypeCode,
	        @RequestParam(defaultValue = "") String searchKeyword) {

	    Rq rq = (Rq) req.getAttribute("rq");

	    Board board = boardService.getBoardById(boardId);

	    int articlesCount = beerService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);

	    if (board == null) {
	        return rq.historyBackOnView("없는 게시판이에요");
	    }

	    int itemsInAPage = 16;

	    List<Beer> beerList = beerService.getForPrintBeers(boardId, searchKeywordTypeCode, searchKeyword);

	    model.addAttribute("board", board);
	    model.addAttribute("boardId", boardId);
	    model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
	    model.addAttribute("searchKeyword", searchKeyword);
	    model.addAttribute("articlesCount", articlesCount);
	    model.addAttribute("beerList", beerList);

	    return "usr/product/beer";
	}
// CSV로 DB에 저장한 파일을 가져오기위해 사용했으나, model이 제대로 작동함에따라 사용x
//	private List<Beer> BeerList(String filePath) {
//		List<Beer> beerList = new ArrayList<>();
//		try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
//			String line;
//			// 첫 줄은 헤더일 수 있으므로 스킵
//			// br.readLine();
//			while ((line = br.readLine()) != null) {
//				String[] data = line.split(",");
//				System.err.println("데이터 길이: " + data.length); // 데이터 배열의 길이 출력
//				Beer beer = new Beer();
//				beer.setId(Integer.parseInt(data[0]));
//				beer.setBoardId(Integer.parseInt(data[1]));
//				beer.setBtype(data[2]);
//				beer.setModel(data[3]);
//				beer.setByear(Integer.parseInt(data[4]));
//				beer.setColor(data[5]);
//				beer.setPrice(data[6]);
//				beer.setSrc(data[7]);
//
//				beerList.add(beer);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return beerList;
//	}
	
	
	@RequestMapping("/usr/product/beerdetail")
	public String beerDetail(HttpServletRequest req, Model model, int id) {


		Beer beer = beerService.getForPrintBeer(id);

		model.addAttribute("beer", beer);
		return "usr/product/beerdetail";
	}
}
