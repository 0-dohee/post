<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
	<link rel='stylesheet' media='all and (max-width: 600px)' href='${pageContext.request.contextPath}/resources/style3.css' /> 
	<link rel='stylesheet' media='all and (min-width: 601px) and (max-width: 1024px)' href='${pageContext.request.contextPath}/resources/style2.css' /> 
	<link rel='stylesheet' media='all and (min-width: 1025px)' href='${pageContext.request.contextPath}/resources/style.css' />
</head>
<body>
	<div id="page">
		<jsp:include page="../menu.jsp"/>
		<div id="postInsert_content">
			<form name="insert_frm" action="insert" method="post" enctype="multipart/form-data">
				<div id="postInsert_content_area">
					<h1>Write post</h1>
					<table class="insert_tbl">
						<tr>
							<td class="insert_tbl_title" colspan=2><input type="text" name="title" placeholder="제목을 입력해 주세요."></td>
						</tr>
						<tr>
							<td width=40 class="insert_tbl_writer_img"><img src="/resources/img/user.png" width=40/></td>
							<td class="insert_tbl_writer"><input type="text" name="writer" value="${ id }" readonly></td>
						</tr>
						<tr>
							<td class="insert_tbl_img" colspan=2>
								<input type="file" name="file">
								<img id="image" src="http://placehold.it/895x716" width=100%>
							</td>
						</tr>
						<tr>
							<td colspan=2 class="insert_tbl_textarea"><textarea rows="10" cols="50" name="content"></textarea></td>
						</tr>
					</table>
					<div style="text-align: center;">
						<input type="submit" value="SAVE">
					</div>
				</div>
				<input type="button" value="All Posts" onClick="location.href='list'" id="btnList">
			</form>	
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	// 이미지를 클릭했을때
	$("#image").on("click", function(){
		$(insert_frm.file).click();
	});

	// 이미지
	$(insert_frm.file).on("change", function(){
		var file=$(insert_frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
</html>