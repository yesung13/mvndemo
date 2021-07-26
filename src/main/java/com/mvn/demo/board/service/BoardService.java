package com.mvn.demo.board.service;

import java.io.IOException;
import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.mvn.demo.board.model.BoardVO;

public interface BoardService {

	// 게시판 목록
	public List<BoardVO> getBoardAllList();


	// 게시판 목록 excel 다은로드 process
	public SXSSFWorkbook excelFileDownloadProcess(List<BoardVO> list);


	public BoardVO getBoardDetail(int boardId) throws IOException;


	public void register(BoardVO boardVO) throws IOException;


	public boolean modify(BoardVO boardVO);






	// excel 다운로드  테스트 메소드
//	public ArrayList<Fruit> makeFruitList(String[] names, long[] prices, int[] quantities);
//
//	public SXSSFWorkbook excelFileDownloadProcess(List<Fruit> list);

}
