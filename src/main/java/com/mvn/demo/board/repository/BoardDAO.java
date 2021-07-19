package com.mvn.demo.board.repository;

import java.util.List;

import com.mvn.demo.board.model.BoardVO;

public interface BoardDAO {

	public List<BoardVO> selectBoardAllList();

	public BoardVO selectBoardDetail(int boardId);

	public void insertBoardWrite(BoardVO boardVO);

}
