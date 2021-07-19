<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<meta charset="UTF-8">
<title>kendo 게시판</title>

</head>
<link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.common.min.css">
<link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.rtl.min.css">
<link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.default.min.css">
<link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.mobile.all.min.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://kendo.cdn.telerik.com/2015.3.930/js/angular.min.js"></script>
<script src="http://kendo.cdn.telerik.com/2015.3.930/js/jszip.min.js">

</script>
<script src="http://kendo.cdn.telerik.com/2015.3.930/js/kendo.all.min.js"></script>
<body>
	<div id="example">
		<div class="demo-section k-content wide">
			<textarea id="editor" rows="10" cols="30" style="width: 100%; height: 840px" aria-label="editor">
	    </textarea>
			<input type="button" id="button1" onclick="preview();" value="미리보기" />
			<input type="button" id="button1" onclick="save();" value="저장" />
			<script>
                $(document).ready(
                        function () {
                            $("#editor").kendoEditor(
                                    {
                                        tools : [ "bold", "italic",
                                                "underline", "strikethrough",
                                                "justifyLeft", "justifyCenter",
                                                "justifyRight", "justifyFull",
                                                "insertUnorderedList",
                                                "insertOrderedList",
                                                "insertUpperRomanList",
                                                "insertLowerRomanList",
                                                "indent", "outdent",
                                                "createLink", "unlink",
                                                "insertImage", "insertFile",
                                                "subscript", "superscript",
                                                "tableWizard", "createTable",
                                                "addRowAbove", "addRowBelow",
                                                "addColumnLeft",
                                                "addColumnRight", "deleteRow",
                                                "deleteColumn",
                                                "mergeCellsHorizontally",
                                                "mergeCellsVertically",
                                                "splitCellHorizontally",
                                                "splitCellVertically",
                                                "tableAlignLeft",
                                                "tableAlignCenter",
                                                "tableAlignRight", "viewHtml",
                                                "formatting",
                                                "cleanFormatting",
                                                "copyFormat", "applyFormat",
                                                "fontName", "fontSize",
                                                "foreColor", "backColor",
                                                "print" ],
                                        deserialization : {
                                            custom : function (html) {
                                                return sanitizeHtml(html);
                                            }
                                        },
                                        serialization : {
                                            custom : function (html) {
                                                return sanitizeHtml(html);
                                            }
                                        }
                                    });

                        });

                function preview() {
                    var editor = $("#editor").getKendoEditor();
                    previewOpen = window.open("", "previewOpen",
                            "width=900, height=600");
                    previewOpen.document.body.innerHTML = editor.value(); // Get the value of text area and run HTML code

                }

                function save() {
                    var editor = $("#editor").getKendoEditor();
                    var editor_val = editor.value();

                    $.ajax({ // 컨트롤러와 통신
                        type : 'POST',
                        url : "/board/ajaxTest",
                        data : {
                            "editor_val" : editor_val
                        },
                        async : false,
                        success : function (data) {
                            if (data == "success") {
                                alert("HTML 저장에 성공했습니다.^^");
                            } else {
                                alert("HTML 저장에 실패했습니다.ㅜㅜ");
                            }
                        }

                    });

                }
            </script>
		</div>
	</div>
</body>

</html>