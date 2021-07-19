package com.mvn.demo.board.service;

import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvn.demo.board.model.BoardVO;
import com.mvn.demo.board.repository.BoardDAO;

@Service

public class BoardServiceImpl implements BoardService {

	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> getBoardAllList() {
		log.info("BoardServiceImpl in");

		return boardDAO.selectBoardAllList();
	}

	/**
	 * 생성한 엑셀 워크북을 컨트롤러에서 받게해줄 메소드
	 *
	 * @param list
	 * @return
	 */
	public SXSSFWorkbook excelFileDownloadProcess(List<BoardVO> list) {
		return this.makeBoardExcelWorkbook(list);
	}

	/**
	 * 리스트를 간단한 엑셀 워크북 객체로 생성
	 *
	 * @param list
	 * @return 생성된 워크북
	 */
	public SXSSFWorkbook makeBoardExcelWorkbook(List<BoardVO> list) {
		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// 시트 생성
		SXSSFSheet sheet = workbook.createSheet("게시판");

		//시트 열 너비 설정
		sheet.setColumnWidth(0, 1500);
		sheet.setColumnWidth(0, 3000);
		sheet.setColumnWidth(0, 3000);
		sheet.setColumnWidth(0, 1500);

		// 헤더 행 생
		Row headerRow = sheet.createRow(0);
		// 해당 행의 첫번째 열 셀 생성
		Cell headerCell = headerRow.createCell(0);
		headerCell.setCellValue("번호");
		// 해당 행의 두번째 열 셀 생성
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("제목");
		// 해당 행의 세번째 열 셀 생성
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("내용");
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("작성자");

		// 과일표 내용 행 및 셀 생성
		Row bodyRow = null;
		Cell bodyCell = null;
		for (int i = 0; i < list.size(); i++) {
			BoardVO boardVO = list.get(i);

			// 행 생성
			bodyRow = sheet.createRow(i + 1);
			// 데이터 번호 표시
			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue(i + 1);
			// 데이터 이름 표시
			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(boardVO.getTitle());
			// 데이터 가격 표시
			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(boardVO.getContent());
			// 데이터 수량 표시
			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(boardVO.getWriter());
		}

		return workbook;
	}

	@Override
	public BoardVO getBoardDetail(int boardId) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardDetail(boardId);
	}

	@Override
	public void register(BoardVO boardVO) {

		boardVO.setBoardType("Q");
		boardVO.setDelYn("N");

		log.info("====================");
		log.info("register service:" + boardVO);
		log.info("====================");

		boardDAO.insertBoardWrite(boardVO);
	}

	@Override
	public boolean modify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return false;
	}

	//	/**
	//	 * 엑셀파일로 만들 리스트 생성
	//	 *
	//	 * @param names
	//	 * @param prices
	//	 * @param quantities
	//	 * @return 엑셀파일 리스트
	//	 */
	//	@Override
	//	public ArrayList<Fruit> makeFruitList(String[] names, long[] prices, int[] quantities) {
	//		ArrayList<Fruit> list = new ArrayList<Fruit>();
	//		for (int i = 0; i < names.length; i++) {
	//			Fruit fruit = new Fruit(names[i], prices[i], quantities[i]);
	//			list.add(fruit);
	//		}
	//		return list;
	//	}
	//
	//	/**
	//	 * 과일 리스트를 간단한 엑셀 워크북 객체로 생성
	//	 *
	//	 * @param list
	//	 * @return 생성된 워크북
	//	 */
	//	public SXSSFWorkbook makeSimpleFruitExcelWorkbook(List<Fruit> list) {
	//		SXSSFWorkbook workbook = new SXSSFWorkbook();
	//
	//		// 시트 생성
	//		SXSSFSheet sheet = workbook.createSheet("과일표");
	//
	//		//시트 열 너비 설정
	//		sheet.setColumnWidth(0, 1500);
	//		sheet.setColumnWidth(0, 3000);
	//		sheet.setColumnWidth(0, 3000);
	//		sheet.setColumnWidth(0, 1500);
	//
	//		// 헤더 행 생
	//		Row headerRow = sheet.createRow(0);
	//		// 해당 행의 첫번째 열 셀 생성
	//		Cell headerCell = headerRow.createCell(0);
	//		headerCell.setCellValue("번호");
	//		// 해당 행의 두번째 열 셀 생성
	//		headerCell = headerRow.createCell(1);
	//		headerCell.setCellValue("과일이름");
	//		// 해당 행의 세번째 열 셀 생성
	//		headerCell = headerRow.createCell(2);
	//		headerCell.setCellValue("가격");
	//		// 해당 행의 네번째 열 셀 생성
	//		headerCell = headerRow.createCell(3);
	//		headerCell.setCellValue("수량");
	//
	//		// 과일표 내용 행 및 셀 생성
	//		Row bodyRow = null;
	//		Cell bodyCell = null;
	//		for (int i = 0; i < list.size(); i++) {
	//			Fruit fruit = list.get(i);
	//
	//			// 행 생성
	//			bodyRow = sheet.createRow(i + 1);
	//			// 데이터 번호 표시
	//			bodyCell = bodyRow.createCell(0);
	//			bodyCell.setCellValue(i + 1);
	//			// 데이터 이름 표시
	//			bodyCell = bodyRow.createCell(1);
	//			bodyCell.setCellValue(fruit.getName());
	//			// 데이터 가격 표시
	//			bodyCell = bodyRow.createCell(2);
	//			bodyCell.setCellValue(fruit.getPrice());
	//			// 데이터 수량 표시
	//			bodyCell = bodyRow.createCell(3);
	//			bodyCell.setCellValue(fruit.getQuantity());
	//		}
	//
	//		return workbook;
	//	}
	//
	//	/**
	//	 * 생성한 엑셀 워크북을 컨트롤러에서 받게해줄 메소드
	//	 *
	//	 * @param list
	//	 * @return
	//	 */
	//	public SXSSFWorkbook excelFileDownloadProcess(List<Fruit> list) {
	//		return this.makeSimpleFruitExcelWorkbook(list);
	//	}

}
