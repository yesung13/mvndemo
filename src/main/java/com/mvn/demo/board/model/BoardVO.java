package com.mvn.demo.board.model;

import org.apache.ibatis.type.Alias;

@Alias("boardVO")
public class BoardVO {

	// 글 순번
	private int no;

	// 글 index
	private int id;

	// 글 작성자 index
	private int userId;

	// 글 작성자
	private String writer;

	// 글 제목
	private String title;

	// 글 내용
	private String content;

	// 글 조회수
	private int viewCnt;

	// 글 댓글수
	private int replyCnt;

	// 글 타입(공지사항: N, QnA: Q)
	private String boardType;

	// 읽기 권한(일반 사용자:U, 관리자:A, 매니저:M, 협력사:P)
	private String readPermission;

	// 글 등록일
	private String writeDt;

	// 글 수정일
	private String modifyDt;

	// 글 삭제 여부
	private String delYn;

	// Getter & Setter
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getReadPermission() {
		return readPermission;
	}

	public void setReadPermission(String readPermisstion) {
		this.readPermission = readPermisstion;
	}

	public String getWriteDt() {
		return writeDt;
	}

	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}

	public String getModifyDt() {
		return modifyDt;
	}

	public void setModifyDt(String modifyDt) {
		this.modifyDt = modifyDt;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", id=" + id + ", userId=" + userId + ", writer=" + writer + ", title=" + title
				+ ", content=" + content + ", viewCnt=" + viewCnt + ", replyCnt=" + replyCnt + ", boardType="
				+ boardType + ", readPermisstion=" + readPermission + ", writeDt=" + writeDt + ", modifyDt=" + modifyDt
				+ ", delYn=" + delYn + "]";
	}

}
