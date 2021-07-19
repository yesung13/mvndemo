package com.mvn.demo.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvn.demo.board.model.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.mvn.demo.board.repository.BoardDAO";

	@Override
	public List<BoardVO> selectBoardAllList() {
		return sqlSession.selectList(NAMESPACE + ".selectBoardAllList");
	}

	@Override
	public BoardVO selectBoardDetail(int boardId) {
		return sqlSession.selectOne(NAMESPACE + ".selectBoardDetail", boardId);
	}

	@Override
	public void insertBoardWrite(BoardVO boardVO) {

		sqlSession.insert(NAMESPACE + ".insertBoardWrite", boardVO);
	}

}
