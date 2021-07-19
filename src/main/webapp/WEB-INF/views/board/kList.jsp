<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/common/cmmnHtml.jsp"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<meta charset="UTF-8">
<title>kendo 게시판</title>

</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div class="container">
		<script type="text/javascript">
            function doExcelDownloadProcess() {
                var f = document.form1;
                f.action = "/board/downloadExcelFile";
                f.submit();
            }
        </script>
		<div class="mt-5">
			<form id="form1" name="form1" method="post" enctype="multipart/form-data">
				<button class="btn btn-success" type="button" onclick="doExcelDownloadProcess()">엑셀다운로드</button>
			</form>
			<div id="result"></div>
		</div>
		<div class="mt-2">
			<c:url value="/api/board/list" var="transportReadUrl" />


			<kendo:grid name="grid" groupable="true" sortable="true" style="height:550px;">
				<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="5">
				</kendo:grid-pageable>
				<kendo:grid-columns>
					<%-- 			<kendo:grid-column title="Contact Name" field="contactName" width="240"
				template="<div class='customer-photo' style='background-image: url(../resources/web/Customers/#:data.customerId#.jpg);'></div><div class='customer-name'>#: contactName #</div>"
			>
			</kendo:grid-column> --%>
					<kendo:grid-column title="No." field="no" />
					<kendo:grid-column title="제목" field="title" />
					<kendo:grid-column title="작성자" field="writer" width="150" />
					<kendo:grid-column title="조회수" field="viewCnt" />
					<kendo:grid-column title="댓글수" field="replyCnt" />
					<kendo:grid-column title="작성일자" field="writeDt" />
				</kendo:grid-columns>
				<kendo:dataSource pageSize="10">
					<kendo:dataSource-schema>
						<kendo:dataSource-schema-model>
							<kendo:dataSource-schema-model-fields>
								<kendo:dataSource-schema-model-field name="no" type="number" />
								<kendo:dataSource-schema-model-field name="title" type="string" />
								<kendo:dataSource-schema-model-field name="writer" type="string" />
								<kendo:dataSource-schema-model-field name="country" type="string" />
								<kendo:dataSource-schema-model-field name="country" type="string" />
							</kendo:dataSource-schema-model-fields>
						</kendo:dataSource-schema-model>
					</kendo:dataSource-schema>
					<kendo:dataSource-transport>
						<kendo:dataSource-transport-read url="${transportReadUrl}" />
					</kendo:dataSource-transport>
				</kendo:dataSource>
			</kendo:grid>
		</div>
	</div>
</body>
<style type="text/css">
.customer-photo {
	display: inline-block;
	width: 32px;
	height: 32px;
	border-radius: 50%;
	background-size: 32px 35px;
	background-position: center center;
	vertical-align: middle;
	line-height: 32px;
	box-shadow: inset 0 0 1px #999, inset 0 0 10px rgba(0, 0, 0, .2);
	margin-left: 5px;
}

.customer-name {
	display: inline-block;
	vertical-align: middle;
	line-height: 32px;
	padding-left: 3px;
}
</style>
</html>