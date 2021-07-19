package com.mvn.demo.common.model;

public class ResultVO {
	private int resCode;
	private String resMsg;

	public int getResCode() {
		return resCode;
	}

	public void setResCode(int resCode) {
		this.resCode = resCode;
	}

	public String getResMsg() {
		return resMsg;
	}

	public void setResMsg(String resMsg) {
		this.resMsg = resMsg;
	}

	@Override
	public String toString() {
		return "ResultVO [resCode=" + resCode + ", resMsg=" + resMsg + "]";
	}

}
