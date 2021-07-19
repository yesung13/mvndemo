package com.mvn.demo.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mvn.demo.board.model.BoardVO;
import com.mvn.demo.board.service.BoardService;

@RestController
@RequestMapping("/api/board")
public class BoardAPIController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list")
	public List<BoardVO> getBoardList() {

		List<BoardVO> boardList = boardService.getBoardAllList();

		return boardList;
	}

}
