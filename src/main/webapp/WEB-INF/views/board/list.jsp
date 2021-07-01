<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/common/cmmnHtml.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<table class="table table-bordered table-striped table-hover">
		<thead class="thead-dark">
			<tr class="text-center">
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="10%">작성자</th>
				<th width="10%">조회수</th>
				<th width="10%">댓글수</th>
				<th width="20%">작성일</th>
			</tr>
		</thead>
		<tbody>

			<%-- 공지사항 게시물 (최근 3개) --%>
			<%-- <c:if test="${fn:length(boardTypeNList) ne 0 && fn:length(boardTypeNList) ne null}">
				<c:forEach var="item" items="${boardTypeNList}">
					<tr>
						<td style="text-align: center" class="align-content-center">
							<a href="javascript:void(0)" class="btn btn-danger btn-sm disabled" aria-disabled="true">공지</a>
						</td>
						<td>
							<button type="button" class="btn btn-link text-decoration-none text-danger font-weight-bold" onclick="detail_btn(${item.boardId})">${item.title}</button>
							                       <c:if test="${item.attachCheck eq true}">
							                           <img src="${pageContext.request.contextPath}/resources/images/baseline_attachment_black_24dp.png" alt="..">
							                       </c:if>
						</td>
						<td style="text-align: center">${item.writer}</td>
						<td style="text-align: center">${item.viewCnt}</td>
						<td style="text-align: center">${item.replyCnt}</td>
						<td style="text-align: center">${item.boardDatetime}</td>
					</tr>
				</c:forEach>
			</c:if> --%>
			<%-- end 공지사항 게시물 --%>

			<%-- 게시물 --%>
			<c:choose>
				<c:when test="${fn:length(boardList) eq 0 || fn:length(boardList) eq null}">
					<tr>
						<td style="text-align: center" colspan="6">
							<span>게시글이 없습니다</span>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${boardList}">
						<tr>
							<td style="text-align: center">${item.no}</td>
							<td>
								<button type="button" class="btn btn-link text-decoration-none text-info" onclick="detail_btn(${item.id})">${item.title}</button>
								<c:if test="${item.attachCheck eq true}">
									<img src="${pageContext.request.contextPath}/resources/images/baseline_attachment_black_24dp.png" alt="..">
								</c:if>
							</td>
							<td style="text-align: center">${item.writer}</td>
							<td style="text-align: center">${item.viewCnt}</td>
							<td style="text-align: center">${item.replyCnt}</td>
							<td style="text-align: center">${item.writeDt}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>