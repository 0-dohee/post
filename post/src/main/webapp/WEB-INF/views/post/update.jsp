<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Read</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<link rel='stylesheet' media='all and (max-width: 600px)' href='${pageContext.request.contextPath}/resources/style3.css' /> 
	<link rel='stylesheet' media='all and (min-width: 601px) and (max-width: 1024px)' href='${pageContext.request.contextPath}/resources/style2.css' /> 
	<link rel='stylesheet' media='all and (min-width: 1025px)' href='${pageContext.request.contextPath}/resources/style.css' />
</head>
<body>
	<div id="page">
		<jsp:include page="../menu.jsp"/>
		<div id="postUpdate_content">
			<form name="update_frm" action="update" method="post" enctype="multipart/form-data">
				<div id="postUpdate_content_area">
					<input type="hidden" name="page" value="${ cri.page }">
					<input type="hidden" name="bno" value="${ vo.bno }">
					<input type="hidden" name="searchType" value="${cri.searchType}"> 
					<input type="hidden" name="keyword" value="${cri.keyword}">
					<table class="update_tbl">
						<tr>
							<td width=40 class="update_tbl_writer_img"><img src="/resources/img/user.png" width=40/></td>
							<td class="update_tbl_writer"><input type="text" name="writer" value="${ vo.writer }" readonly></td>
						</tr>
						<tr>
							<td colspan=2 class="update_tbl_title"><input type="text" name="title" value="${ vo.title }"></td>
						</tr>
						<tr>
							<td colspan=2 class="update_tbl_img">
								<input type="file" name="file">
								<input type="hidden" name="image" value="${ vo.image }">
								<c:if test="${vo.image!=null && vo.image!=''}">
									<img src="/post/display?fileName=${vo.image}" width=100% id="image">
								</c:if> 
								<c:if test="${vo.image==null || vo.image==''}">
									<img src="http://placehold.it/895x716" width=100% id="image">
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan=2><textarea rows="10" cols="50" name="content">${ vo.content }</textarea></td>
						</tr>
					</table>
					<div style="text-align: center;">
						<input type="submit" value="UPDATE ?">
						<input type="button" value="DELETE ?" id="btnDelete">
					</div>
				</div>
				<input type="button" value="All Posts" id="btnList">
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>	
</body>
<script>
	// 수정
	$(update_frm).submit(function(e) {
		e.preventDefault();
		
		if(!confirm("수정하시겠습니까?")) return;

		update_frm.submit();
	})
	
	// 삭제
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		update_frm.action="delete";
		update_frm.submit();
	})
	
	// 목록
	$("#btnList").on("click", function(){
		update_frm.action="list";
		update_frm.submit();
	});
	
	// 이미지를 클릭했을때
	$("#image").on("click", function(){
		$(update_frm.file).click();
	});
	
	// 파일 선택 버튼을 눌렀을때
	$(update_frm.file).on("change", function(){
		var file=$(update_frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

</script>
</html>