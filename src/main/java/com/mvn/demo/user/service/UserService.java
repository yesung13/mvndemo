package com.mvn.demo.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvn.demo.user.model.LoginDTO;
import com.mvn.demo.user.model.UserVO;
import com.mvn.demo.user.repository.UserDAO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public UserVO getUserAccount(LoginDTO loginDTO) {
		return userDAO.selectUserAccount(loginDTO);
	}

}
