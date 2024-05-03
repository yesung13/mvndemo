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
        $(document)
            .ready(
                function () {
                    $('#write_btn').click(function () {
                        writeCheck_btn();
                    });
                    // $("button[type='submit']").click(function () {
                    //     writeCheck_btn();
                    // });
                    $('#back_btn').click(function () {
                        window.location.href = '/board/list';
                    });

                    let formObj = $("form[role='form']");

                    $("button[type='submit']").on("click", function (e) {

                        e.preventDefault();

                        console.log("submit clicked");

                        let str = "";

                        $(".uploadResult ul li").each(function (i, obj) {

                            let jobj = $(obj);

                            console.dir(jobj);
                            console.log("-------------------------");
                            console.log(jobj.data("filename"));


                            str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                            str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                            str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                            str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";

                        });

                        console.log(str);

                        formObj.append(str).submit();

                    });

                    // 정규 표현식(regex). 파일 검사
                    let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
                    let maxSize = 225443840; //215MB

                    function checkExtension(fileName, fileSize) {

                        if (fileSize >= maxSize) {
                            alert("파일 사이즈 초과");
                            return false;
                        }

                        if (regex.test(fileName)) {
                            alert("해당 종류의 파일은 업로드 할 수 없습니다.")
                            return false;
                        }
                        return true;

                    }

                    // end 정규 표현식(regex). 파일 검사

                    // 파일 업로드 상세처리
                    $("input[type='file']").change(function (e) {
                        let formData = new FormData();

                        let inputFile = $("input[name='uploadFile']");

                        let files = inputFile[0].files;

                        //add filedata to formdata
                        for (let i = 0; i < files.length; i++) {
                            if (!checkExtension(files[i].name, files[i].size)) {
                                return false;
                            }
                            formData.append("uploadFile", files[i]);
                        }
                        $.ajax({
                            url: '/board/uploadAjaxAct',
                            processData: false,
                            contentType: false,
                            data: formData,
                            type: 'POST',
                            dataType: 'json',
                            success: function (result) {
                                console.log(result);
                                showUploadResult(result); //업로드 결과 처리 함수
                            }
                        }); //$.ajax

                    });

                    //업로드 한 파일 이름 출력
                    function showUploadResult(uploadResultArr) {
                        if (!uploadResultArr || uploadResultArr.length === 0) {
                            return;
                        }

                        let uploadUL = $(".uploadResult ul");

                        let str = "";

                        $(uploadResultArr)
                            .each(
                                function (i, obj) {

                                    // image type
                                    if (obj.image) {
                                        let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_"
                                            + obj.uuid + "_" + obj.fileName);
                                        str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>"
                                            + "<span> "
                                            + obj.fileName
                                            + "</span>&nbsp;"
                                            + "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-outline-light rounded-circle'><img id='cancel_img' src='/resources/images/x.svg'></button><br>"
                                            + "<img class='rounded' src='/board/display?fileName="
                                            + fileCallPath + "'>" + "</div></li>";
                                    } else {

                                        let fileCallPath = encodeURIComponent(obj.uploadPath + "/"
                                            + obj.uuid + "_" + obj.fileName);

                                        let fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

                                        str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>"
                                            + "<span> "
                                            + obj.fileName
                                            + "</span>&nbsp;"
                                            + "<button type='button'  data-file=\'" + fileCallPath + "\' data-type='file' class='btn btn-outline-light rounded-circle'><img id='cancel_img' src='/resources/images/x.svg'></button><br>"
                                            + "<img src='/resources/images/attach.png'></a>"
                                            + "<div></li>"
                                    }
                                });

                        uploadUL.append(str);
                    }

                    // end 업로드한 파일 이름 출력

                    // 파일삭제 'x' 버튼 이벤트
                    $(".uploadResult").on("click", "button", function (e) {

                        console.log("delete file");

                        let targetFile = $(this).data("file");
                        let type = $(this).data("type");

                        let targetLi = $(this).closest("li");

                        $.ajax({
                            url: '/board/deleteFile',
                            data: {
                                fileName: targetFile,
                                type: type
                            },
                            dataType: 'text',
                            type: 'POST',
                            success: function (result) {
                                alert(result);
                                targetLi.remove();
                                // location.reload();
                            }
                        }); //$.ajax
                    });
                    // end 파일삭제 'x' 버튼 이벤트

                }); // end doc ready

        // 게시글 제목, 내용 유효성 검사
        function writeCheck_btn() {
            let title = $("#title").val();
            let content = $("#editor").val();
            if (title == null || title === "") {
                alert("제목을 입력해 주세요!");
                $("#title").focus();
                return false;
            }

            // if (content == null || content === "") {
            //     alert("내용을 입력해 주세요!");
            //     $("#editor").focus();
            //     return false;
            // }
            return write_btn();
        }

        // 게시글 등록
        function write_btn() {
            // let form = $('#form')[0];
            // let data = new FormData(form);
            let formObj = $("form[role='form']");

            let str = "";

            $(".uploadResult ul li").each(function (i, obj) {

                let jobj = $(obj);

                console.dir(jobj);
                console.log("-------------------------");
                console.log(jobj.data("filename"));

                str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";

            });

            console.log(str);

            // formObj.append(str).submit();
            formObj.append(str);


            let data = new FormData(formObj[0]);

            console.log("Insert Request Data:", data);

            $.ajax({
                type: "POST",
                url: '/board/register',
                data: data,
                processData: false,
                contentType: false,
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
    </script>
    <script>
        $(document).ready(
            function () {
                CKEDITOR.replace('editor');
            });
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

                <form id="form" role="form">
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
                                     <textarea id="editor" name="content" rows="10" cols="20"
                                               style="width: 1108px; height: 840px"
                                               aria-label="editor"></textarea>
                                    <input type="button" id="button1" onclick="preview();" value="미리보기"/>
                                </td>
                            </tr>
                            <tr class="thead-light">
                                <th>
                                    <label>열람 권한 설정</label>
                                </th>
                            </tr>
                            <tr>
                                <td class="">
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
