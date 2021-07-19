<%-- <%@ page session="false"%> --%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<%@include file="/WEB-INF/views/common/cmmnHtml.jsp"%>
<head>
<title>Home</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<h1>Hello world!</h1>
	<h3>Spring Legacy Project</h3>
	<P>The time on the server is ${serverTime}.</P>

</body>
</html>
