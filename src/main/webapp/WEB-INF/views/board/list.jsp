<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/common/cmmnHtml.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <script type="text/javascript">
        // 게시글 상세보기 및 게시글 조회수 증가
        function detail_btn(boardId) {
            location.href = '/board/detail?id=' + boardId;

            //게시글 조회수
            //var data = {};
            //data.boardId = boardId;
            //$.ajax({
            //    type: 'put',
            //    url: '/board/viewCnt',
            //   data: data,
            // });
        }
    </script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<section class="container mt-4">
    <table>
        <tr>
            <th>
                <h2>게시판</h2>
            </th>
        </tr>
    </table>

    <div>${test}</div>

    <%-- 게시판 --%>
    <div class="row mt-5 mb-2 pl-1">
        <div class="col-9">
            <%-- 				<c:if test="${listCnt > 0}">
                <span class="float-left"> 총 게시글 수 : ${pagination.listCnt } / 총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 총 블럭 수 :
                    ${pagination.rangeCnt } / 현재 블럭 : ${pagination.curRange } </span>
            </c:if> --%>
        </div>
        <div class="col-3">
            <div class="float-right">
                <button class="btn btn-info btn-sm mr-2" onclick="location.href='/board/write'">kendo 글쓰기</button>
                <button class="btn btn-info btn-sm" onclick="location.href='/board/write'">ck 글쓰기</button>
            </div>
        </div>
    </div>
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
                            <button type="button" class="btn btn-link text-decoration-none text-info"
                                    onclick="detail_btn(${item.id})">${item.title}</button>

                                <%-- 						<c:if test="${item.attachCheck eq true}">
                                <img src="${pageContext.request.contextPath}/resources/images/baseline_attachment_black_24dp.png" alt="..">
                            </c:if> --%>
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
</section>
<%-- 푸터 --%>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>