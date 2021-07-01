package com.mvn.demo.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvn.demo.board.model.BoardVO;
import com.mvn.demo.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardListPage(Model model) {

		List<BoardVO> boardList = boardService.getBoardAllList();

		model.addAttribute("boardList", boardList);

		return "/board/list";

	}

}
