package com.mvn.demo.user.model;

import org.apache.ibatis.type.Alias;

@Alias("userVO")
public class UserVO {

	// ID 사용자 index
	private int id;

	// 사용자 계정
	private String userAccount;

	// 사용자 계정 암호
	private String userPw;

	// 사용자 Email 주소
	private String userEm;

	// 사용자 이름
	private String userNm;

	// 사용자 권한 (default: USER)
	private String role;

	// 사용자 계정 생성일
	private String createDt;

	// 사용자 계정 수정일
	private String updateDt;

	// 사용자 계정 삭제 여부
	private String delyn;

	// Getter & Setter

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public String getUserEm() {
		return userEm;
	}

	public void setUserEm(String userEm) {
		this.userEm = userEm;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getCreateDt() {
		return createDt;
	}

	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}

	public String getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", userAccount=" + userAccount + ", userPw=" + userPw + ", userEm=" + userEm + ", userNm=" + userNm + ", role=" + role + ", createDt=" + createDt + ", updateDt="
				+ updateDt + ", delyn=" + delyn + "]";
	}



}
