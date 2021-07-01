<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/common/cmmnHtml.jsp"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags" %>
<head>
    <meta charset="UTF-8">
    <title>kendo table sample</title>
</head>
<body>
<div id="example">
    <div id="grid"></div>
    <script>
        $(document).ready(function () {
            $("#grid").kendoGrid({
                dataSource: {
                    type: "odata",
                    transport: {
                        read: "https://demos.telerik.com/kendo-ui/service/Northwind.svc/Orders"
                    },
                    schema: {
                        model: {
                            fields: {
                                OrderID: {type: "number"},
                                Freight: {type: "number"},
                                ShipName: {type: "string"},
                                OrderDate: {type: "date"},
                                ShipCity: {type: "string"}
                            }
                        }
                    },
                    pageSize: 20,
                    serverPaging: true,
                    serverFiltering: true,
                    serverSorting: true
                },
                height: 550,
                filterable: true,
                sortable: true,
                pageable: true,
                columns: [{
                    field: "OrderID",
                    filterable: false
                },
                    "Freight",
                    {
                        field: "OrderDate",
                        title: "Order Date",
                        format: "{0:MM/dd/yyyy}"
                    }, {
                        field: "ShipName",
                        title: "Ship Name"
                    }, {
                        field: "ShipCity",
                        title: "Ship City"
                    }
                ]
            });
        });
    </script>
</div>
</body>
</html>