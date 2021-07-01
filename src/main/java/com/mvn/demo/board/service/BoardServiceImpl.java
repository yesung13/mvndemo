package com.mvn.demo.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvn.demo.board.model.BoardVO;
import com.mvn.demo.board.repository.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<BoardVO> getBoardAllList() {
		return boardMapper.selectBoardAllList();
	}



}
