<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>글쓰기</title>
    <%@include file="/WEB-INF/views/common/cmmnHtml.jsp" %>
    <%--ck editor--%>
    <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

    <style>
        html {
            font-size: 14px;
            font-family: Arial, Helvetica, sans-serif;
        }

        .btn-outline-light {
            color: #ffffff !important;
            border-color: #ffffff !important;
        }

        .btn-outline-light:hover {
            color: #212529 !important;
            background-color: #b9bbbe !important;
        }

        .table td span {
            font-family: 'Gothic A1', sans-serif;
            font-size: 0.813em;
            font-weight: 500;
            color: gray;
        }

        .table td a {
            font-family: 'Nanum Gothic', sans-serif;
            font-size: 0.938em;
            font-weight: 700;
            text-decoration: none;
            color: #4374D9;
        }

        .uploadResult {
            width: 100%;
            /*background-color: gray;*/
        }

        .uploadResult ul {
            display: flex;
            flex-flow: column;
            justify-content: start;
            align-items: start;
        }

        .uploadResult ul li {
            list-style: none;
            padding: 10px;
            align-content: start;
            text-align: start;
        }

        .uploadResult ul li img {
            width: 30px;
        }

        .uploadResult ul li span {
            color: blue;
            font-weight: bold;
        }

        .bigPicture {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .bigPicture img {
            width: 600px;
        }

        .bg-color {
            background-color: #e9ecef;
        }

        /*div > input {*/
        /*    width: 100px;*/
        /*}*/
    </style>
    <script type="text/javascript">
        $(document).ready(function () {

            CKEDITOR.replace('content');

            $('#write_btn').click(function () {
                writeCheck_btn();
            });
            // $("button[type='submit']").click(function () {
            //     writeCheck_btn();
            // });
            $('#back_btn').click(function () {
                window.location.href = '/board/list';
            });

        }); // end doc ready

        // 게시글 제목, 내용 유효성 검사
        function writeCheck_btn() {
            let title = $("#title").val();
            let content = CKEDITOR.instances.content.getData();

            console.log("ckeditor", content);

            if (title == null || title === "") {
                alert("제목을 입력해 주세요!");
                $("#title").focus();
                return false;
            }

            if (content == null || content === "") {
                alert("내용을 입력해 주세요!");
                $("#editor").focus();
                return false;
            }
            return write_btn();
        }

        // 게시글 등록
        function write_btn() {

            // let formObj = $("#writeForm");
            // let data = new FormData(formObj[0]);
            CKUpdate();
            let data = new FormData();
            data.append('userId', $("input[name='userId']").val());
            data.append('writer', $("input[name='writer']").val());
            data.append('title', $('#title').val());
            data.append('content', CKEDITOR.instances.content.getData());
            data.append('readPermission', $("input[name='readPermission']").val());
            // data.append('file', $('#file')[0].files[0]);



            console.log("Insert Request Data:", data);

            $.ajax({
                type: "POST",
                url: '/board/register',
                data: data,
                processData: false, // formdata 전송 시 필수
                contentType: false, // formdata 전송 시 필수
                // cache: false,
                // timeout: 600000,
                success: function (response) {
                    console.log("Insert Response Data:", response);
                    if (response.resCode === 600) {
                        alert(response.resMsg);
                        location.replace('/board/list');
                    } else if (response.resCode === 601) {
                        alert(response.resMsg);
                    } else if (response.resCode === 607) {
                        alert(response.resMsg);
                    }
                },
                error: function (xhr, e, response) {
                    console.log("Insert Error:", xhr, e, response);
                    alert("에러!!")
                }
            });
        }

        function CKUpdate() {
            let instance = CKEDITOR.instances.content;
            instance.updateElement();
            console.log("content::::", instance);

        }
    </script>
</head>
<body>

<%-- 헤더 --%>
<c:import url="/WEB-INF/views/common/header.jsp"/>


<%-- 바디 --%>
<section>
    <div class="container mt-5">
        <div id="example">
            <div class="demo-section k-content wide">

                <h3 class="text-center">글쓰기</h3>
                <%--        <form id="form" role="form" action="${pageContext.request.contextPath}/board/register" method="post">--%>

                <form id="writeForm">
                    <input type="hidden" value="<c:out value="${sessionScope.account.id}" />" name="userId">
                    <input type="hidden" value="<c:out value="${sessionScope.account.userNm}" />" name="writer">
                    <div class="">
                        <table class="table table-bordered">
                            <tr class="thead-light">
                                <th>
                                    <label for="title">제목</label>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" id="title" name="title" class="form-control"
                                           placeholder="40자 이내  작성하세요" maxlength="40"/>
                                </td>
                            </tr>
                            <tr class="thead-light">
                                <th>
                                    <label>내용</label>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                     <textarea id="content" name="content" rows="10" cols="20" class="editor"
                                               style="width: 1108px; height: 840px"
                                               aria-label="content"></textarea>
                                    <input type="button" id="button1" onclick="preview();" value="미리보기"/>
                                </td>
                            </tr>
                            <tr class="thead-light">
                                <th>
                                    <label>열람 권한 설정</label>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <!-- Admin -->
                                    <input type="checkbox" name="readPermission" class="mr-1" value="A">
                                    <span class="mr-2">관리자</span>
                                    <!-- User -->
                                    <input type="checkbox" name="readPermission" class="mr-1" value="U">
                                    <span class="mr-2">일반 사용자</span>
                                    <!-- managers -->
                                    <input type="checkbox" name="readPermission" class="mr-1" value="M">
                                    <span class="mr-2">매니저</span>
                                    <!-- partners -->
                                    <input type="checkbox" name="readPermission" class="" value="P">
                                    <span>협력사</span>
                                </td>
                            </tr>
                            <tr class="thead-light">
                                <th>
                                    <label>첨부파일</label>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="uploadDiv">
                                        <input type="file" id="file" name="uploadFile" multiple/>
                                        <span class="date">&nbsp;&nbsp;※&nbsp;jpg, png, zip, hwp, docx, pdf 확장자만 첨부 가능 </span>
                                    </div>
                                    <div class="uploadResult">
                                        <ul></ul>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="row justify-content-center">
                        <button type="reset" class="btn btn-outline-secondary">초기화</button>
                        <button type="button" id="write_btn" class="btn btn-outline-secondary mx-1">작성</button>
                        <%--                <button type="submit" class="btn btn-outline-secondary mx-1">작성</button>--%>
                        <button type="button" id="back_btn" class="btn btn-outline-secondary">취소</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

</section>

<%-- 푸터 --%>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>
