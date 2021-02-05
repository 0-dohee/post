<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<link rel='stylesheet' media='all and (max-width: 600px)' href='${pageContext.request.contextPath}/resources/style3.css' /> 
	<link rel='stylesheet' media='all and (min-width: 601px) and (max-width: 1024px)' href='${pageContext.request.contextPath}/resources/style2.css' /> 
	<link rel='stylesheet' media='all and (min-width: 1025px)' href='${pageContext.request.contextPath}/resources/style.css' />
</head>
<body>
	<div id="page">
		<jsp:include page="menu.jsp"/>
		<jsp:include page="header.jsp"/>
		<div id="content">
			<div id="content_title"><h1>POSTS</h1></div>
			<div id="content_row">
				<c:forEach items="${ indexList }" var="ivo">
					<figure class="content_row_list">
						<c:if test="${ivo.image!=null && ivo.image!=''}">
							<img src="/post/display?fileName=${ivo.image}" width=100%>
						</c:if> 
						<c:if test="${ivo.image==null || ivo.image==''}">
							<img src="http://placehold.it/150x120" width=100%>
						</c:if>
						<div class="content_row_info">
							<div class="content_row_bno">${ ivo.bno }</div>
							<div class="content_row_title">${ ivo.title }</div>
							<div class="content_row_updatedate">${ ivo.updatedate }</div>
							<div class="content_row_viewcnt_area">
								<img src="/resources/img/eye.png" width=20/>
								<div class="content_row_viewcnt">
									<fmt:formatNumber value="${ivo.viewcnt}" pattern="#,###"/>
								</div>
							</div>
						</div>
					</figure>
				</c:forEach>
			</div>
			<button id="content_button" onClick="location.href='/post/list'">+&nbsp; SEE MORE</button>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
<script>
	// 읽기 
	$(".content_row_list").on("click", function(){
		var bno=$(this).find(".content_row_bno").html();
		location.href="/post/read?bno="+bno;
	});
</script>
</html>