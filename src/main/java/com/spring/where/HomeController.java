package com.spring.where;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Page;
import com.spring.model.Restaurant;
import com.spring.model.RestaurantDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	RestaurantDAO dao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 10;
		
	//DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		return "main";
	}
	
	@RequestMapping("login.go")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("join.go")
	public String join() {
		return "join";
	}
	
	
	@RequestMapping("board_list.go")
	public String board(Model model,HttpServletRequest request) {
		
		int page;
		
		if(request.getParameter("page") != null) {
			
		page = Integer.parseInt(request.getParameter("page"));
		
		}else {
			page = 1;
		}
		
		totalRecord = this.dao.getListCount();
		
		Page pdto = new Page(page, rowsize, totalRecord);
		
		List<Restaurant> list = this.dao.getRestaurantList(pdto);
		
		
		model.addAttribute("RList", list)
			.addAttribute("Pageing", pdto);
			
		return "board_list";
	}
	
	@RequestMapping("write.go")
	public String write() {
		return "write";
	}
	
	@RequestMapping("insert_ok.go")
	public void insertok(Restaurant dto,HttpServletResponse response) throws IOException {
		
		int check = this.dao.insert(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('리뷰 등록이 완료되었습니다')");
			out.println("location.href='board_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰 등록을 실패하였습니다')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("board_search.go")
	public String seach(@RequestParam("field") String field,@RequestParam("keyword") String keyword,Model model,HttpServletRequest request) {
		
		int page;
		
		if(request.getParameter("page") != null) {
			page =Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("Field", field);
		map.put("Keyword", keyword);
		
		//해당 키워드 개수
		totalRecord = this.dao.searchBoardCount(map);
		
		Page pdto = new Page(page, rowsize, totalRecord, field, keyword);
		
		List<Restaurant> searchList = this.dao.searchBoardList(pdto);
		
		model.addAttribute("searchPageList", searchList)
		.addAttribute("Paging", pdto);
		
		return "board_search_list";
		
	}
	
	@RequestMapping("content.go")
	public String content(@RequestParam("num") int num,Model model) {
		
		Restaurant dto = this.dao.content(num);
		this.dao.viewCount(num);
		
		model.addAttribute("content", dto);
		
		return "board_content";
		
	}
	
	
	@RequestMapping("modify.go")
	public String modify(@RequestParam("num") int num,Model model) {
		
		Restaurant dto = this.dao.content(num);
		
		model.addAttribute("modify", dto);
		
		return "board_modify";
		
	}
	
	@RequestMapping("modify_ok.go")
	public void modifyOk(Restaurant dto,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int check = this.dao.updateBoard(dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('수정이 완료되었습니다^^')");
			out.println("location.href='content.go?num="+dto.getRno()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정을 실패하였습니다')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("delete.go")
	public void delete(@RequestParam("num")int num,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int check = this.dao.deleteBoard(num);
		
		this.dao.updateSequence(num);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('삭제가 완료되었습니다')");
			out.println("location.href='board_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제를 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
