package com.mvn.demo.user.repository;

import com.mvn.demo.user.model.LoginDTO;
import com.mvn.demo.user.model.UserVO;

public interface UserDAO {

	UserVO selectUserAccount(LoginDTO loginDTO);

}
