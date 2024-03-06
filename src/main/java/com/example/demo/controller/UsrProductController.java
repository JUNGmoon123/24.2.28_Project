package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;
import com.example.demo.service.ProductService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Product;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrProductController {
	
	@Autowired
	private Rq rq;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReactionPointService reactionPointService;
	
	private UsrProductController(){
		
	}
	
	@RequestMapping("/usr/article/productlist")
	public String showProductList(HttpServletRequest req, Model model, int id){

		Rq rq = (Rq) req.getAttribute("rq");

//		Product product = productService.getProductsCount(boardId);
		Product product = productService.getProduct(id);
		
		if (product == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 상품은 존재하지 않습니다", id));
		}
		
		model.addAttribute("product", product);
		
		return "usr/article/productlist";
	}
}
