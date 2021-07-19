<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/common/cmmnHtml.jsp"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<head>
<meta charset="UTF-8">
<title>kendo table sample</title>
</head>
<body>
	<div id="example">
		<div id="grid"></div>
		<script>
            $(document).ready(function () {
                getList();
            });

            function getList() {
                var data = new kendo.data.DataSource({
                    /* autoSync: true, */
                    type : 'jsonp',
                    transport : {
                        read : {
                            cache : true,
                            datatype : 'json',
                            url : '/api/board/list',
                            //type : 'POST',

                            success : function (res) {
                                options.success(res);
                            },
                            error : function (res) {
                                options.error(res);
                            },
                            contentType : 'application/json'
                        }
                    },
                    schema : {
                        model : {
                            fields : {
                                no : {
                                    type : 'number'
                                },
                /*                 title : {
                                    type : "string"
                                } */
                            //writer: {type: "string"},
                            // writeDt: {type: "date"}
                            }
                        }

                    }
                /*        pageSize: 20,
                       serverPaging: true,
                       serverFiltering: true,
                       serverSorting: true */
                });

                $("#grid").kendoGrid({
                    /* height : 550, */
                    /*  filterable: true,
                     sortable: true,
                     pageable: true, */
                    columns : [ {
                        field : "no",
                        title : 'NO',
                        filterable : false
                    } /* {
                        field : "title",
                        title : "Title"
                    }, */
                    //{field: "writeDt", title: "Write date", format: "{0:MM/dd/yyyy}"},
                    //{field: "writer", title: "Writer"}
                    ]
                });
            }
        </script>
	</div>
</body>
</html> --%>