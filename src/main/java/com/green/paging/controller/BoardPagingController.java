package com.green.paging.controller;

import com.green.board.dto.BoardDto;

import com.green.menus.dto.MenuDTO;
import com.green.menus.mapper.MenuMapper;
import com.green.paging.dto.SearchDto;
import com.green.paging.mapper.BoardPagingMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/BoardPaging")
public class BoardPagingController {
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private BoardPagingMapper boardPagingMapper;
	
	//BoardPaging/List?menu_id=MENU01&nowpage=1
	@RequestMapping("/List")
	public ModelAndView list(BoardDto boardDto, int nowpage) { 
	
	// 메뉴목록 : menus.jsp 용
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
	//게시물 목록 조회(페이징해서)
	// 해당 메뉴의 자료갯수 : 
		int totalCount = boardPagingMapper.count(boardDto); // menu_id
		System.out.println("totalCount:" + totalCount);
		
		
	// 페이징을 위한 초기설정
		SearchDto	searchDto = new SearchDto();
		searchDto.setPageNo(nowpage);			// 현재 페이지 정보
		searchDto.setNumOfRows(10);				// 한 페이지에 출력할 페이지 수 
		
		
		String menu_id = boardDto.getMenu_id();
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("boardpaging/list");
		mv.addObject("menuList", menuList);
		mv.addObject("nowpage", nowpage);
		
		mv.addObject("menu_id",menu_id);
		return mv;
		
		
	}//Mav list

//BoardPaging/WriteForm?menu_id=MENU01&nowpage=1
	
	
	
}
