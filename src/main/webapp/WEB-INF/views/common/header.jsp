<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/">Spring Demo</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="${pageContext.request.contextPath}/admin/list" aria-disabled="true">회원관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/list">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/klist">kendo 게시판</a></li>
			</ul>
			<c:choose>
				<c:when test="${empty sessionScope.account}">
					<form class="form-inline my-2 my-lg-0">
						<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/account/login">로그인</a></li>
							<li class="nav-item"><a class="nav-link disabled" href="${pageContext.request.contextPath}/account/signUp">회원가입</a></li>
						</ul>
					</form>
				</c:when>
				<c:otherwise>
					<form class="form-inline my-2 my-lg-0">
						<ul class="navbar-nav mr-auto mt-2 mt-lg-0">

							<li class="nav-item"><a class="nav-link" href="javascript:void(0);"> <c:out value="${sessionScope.account.userNm}" /> 님
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>

						</ul>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
</header>
