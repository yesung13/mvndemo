package com.mvn.demo.user.model;

public class LoginDTO {

	private String userAccount;
	private String userPw;

	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	@Override
	public String toString() {
		return "LoginDTO [userAccount=" + userAccount + ", userPw=" + userPw + "]";
	}




}
