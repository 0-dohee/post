<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<div id="postRead_content">
			<div id="postRead_content_area">
				<table class="read_tbl">
					<tr>
						<td width=40 class="read_tbl_writer_img"><img src="/resources/img/user.png" width=40/></td>
						<td width=40 class="read_tbl_writer">${ vo.writer }</td>
						<td>
							<c:if test="${ vo.regdate == vo.updatedate }">
								${ vo.regdate }
							</c:if>
							<c:if test="${ vo.regdate != vo.updatedate }">
								${ vo.updatedate }
							</c:if>
						</td>
						<td class="read_tbl_submit" width=60>
							<form name="read_frm" action="update">
								<input type="hidden" name="page" value="${ cri.page }">
								<input type="hidden" name="bno" value="${ vo.bno }">
								<input type="hidden" name="searchType" value="${cri.searchType}"> 
								<input type="hidden" name="keyword" value="${cri.keyword}">
								<c:if test="${ id!=null }">
									<input type="submit" value="수정하기">
								</c:if>
							</form>
						</td>
					</tr>
					<tr>
						<td colspan=4 class="read_tbl_title">${ vo.title }</td>
					</tr>
					<tr>
						<td colspan=4>
							<c:if test="${vo.image!=null && vo.image!=''}">
								<img src="/post/display?fileName=${vo.image}" width=100%>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan=4 class="read_tbl_content">${ vo.content }</td>
					</tr>
					<tr>
						<td colspan=4 class="read_tbl_viewcnt"><fmt:formatNumber value="${vo.viewcnt}" pattern="#,###"/>&nbsp;&nbsp;views</td>
					</tr>
				</table>
			</div>
			<input type="button" value="All Posts" id="btnList">
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	// 목록
	$("#btnList").on("click", function(){
		read_frm.action="list";
		read_frm.submit();
	});
</script>
</html>