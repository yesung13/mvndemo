package com.mvn.demo.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mvn.demo.board.model.BoardVO;

@Repository
@Mapper
public interface BoardMapper {

	public List<BoardVO> selectBoardAllList();

}
