package com.mvn.demo.user.repository;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvn.demo.user.model.LoginDTO;
import com.mvn.demo.user.model.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	private static final Logger log = LoggerFactory.getLogger(UserDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.mvn.demo.user.repository.UserDAO";

	@Override
	public UserVO selectUserAccount(LoginDTO loginDTO) {

		log.info("UserDAOImpl======{}", loginDTO);

		return sqlSession.selectOne(NAMESPACE+".selectUserAccount", loginDTO);
	}



}
