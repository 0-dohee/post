<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>POST</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<link rel='stylesheet' media='all and (max-width: 600px)' href='${pageContext.request.contextPath}/resources/style3.css' /> 
	<link rel='stylesheet' media='all and (min-width: 601px) and (max-width: 1024px)' href='${pageContext.request.contextPath}/resources/style2.css' /> 
	<link rel='stylesheet' media='all and (min-width: 1025px)' href='${pageContext.request.contextPath}/resources/style.css' />
</head>
<body>
	<div id="page">
		<jsp:include page="../menu.jsp"/>
		<div id="postList_content">	
			<div id="postList_content_search">
				<div id="postList_content_search_left">
					<h1>POSTS</h1>
					<c:if test="${ id!=null }">
						<a href="insert" style="font-size: 16px;">게시글 등록하기</a>
					</c:if>
				</div>
				<div id="postList_content_search_right">
					<form name="list_frm" action="list" method="get">
						<input type="hidden" name="page" value="${ pm.cri.page }">
						<input type="hidden" name="bno">
						<select name="searchType">
							<option value="title" <c:out value="${cri.searchType=='title'?'selected':''}"/>>TITLE</option>
							<option value="writer" <c:out value="${cri.searchType=='writer'?'selected':''}"/>>WRITER</option>
							<option value="content" <c:out value="${cri.searchType=='content'?'selected':''}"/>>CONTENT</option>
						</select>
						<input type="text" name="keyword" value="${cri.keyword}"> 
						<input type="submit" value="">
					</form>
				</div>
			</div>
			<table class="list_tbl">
				<c:forEach items="${ list }" var="vo">
					<tr class="row">
						<td width=50 class="list_tbl_dd">
							<c:if test="${ vo.regdate == vo.updatedate }">
								<fmt:formatDate value="${ vo.regdate }" pattern="dd"/>
							</c:if>
							<c:if test="${ vo.regdate != vo.updatedate }">
								<fmt:formatDate value="${ vo.updatedate }" pattern="dd"/>
							</c:if>
						</td>
						<td width=25 class="list_tbl_EMM">
							<c:if test="${ vo.regdate == vo.updatedate }">
								<fmt:formatDate value="${ vo.regdate }" pattern="E"/>
								<div style="font-size:20px;"><fmt:formatDate value="${ vo.regdate }" pattern="MM"/></div>
							</c:if>
							<c:if test="${ vo.regdate != vo.updatedate }">
								<fmt:formatDate value="${ vo.updatedate }" pattern="E"/>
								<div style="font-size:20px;"><fmt:formatDate value="${ vo.updatedate }" pattern="MM"/></div>
							</c:if>
						</td>
						<td class="list_tbl_title">${ vo.title }</td>
						<td width=80 class="list_tbl_writer">${ vo.writer }</td>
						<td width=30 class="list_tbl_viewcnt_img"><img src="/resources/img/eye.png" width=17/></td>
						<td class="list_tbl_viewcnt"><fmt:formatNumber value="${vo.viewcnt}" pattern="#,###"/></td>
						<td class="bno">${ vo.bno }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="pagination">
			   	<c:if test="${pm.prev}">
			   		<a href="${pm.startPage-1}">◀</a>
			   	</c:if>
			   	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			   		<c:if test="${cri.page==i}">
			   			<a href="${i}" class="active">${i}</a>
			   		</c:if>
			   		<c:if test="${cri.page!=i}">
			   			<a href="${i}">${i}</a>
			   		</c:if>
			   	</c:forEach>
			   	<c:if test="${pm.next}">
			   		<a href="${pm.endPage+1}">▶</a>
			   	</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
<script>

	// 검색
	$(list_frm).submit(function(){
		$(list_frm.page).val(1);
	});

	// 읽기
	$(".row").on("click", function(){
		var bno=$(this).find(".bno").html();
		//alert(bno);
		list_frm.bno.value=bno;
		list_frm.action="read";
		list_frm.submit();
		//location.href="read?bno="+bno;
	});
	
	$("#pagination").on("click", "a", function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		$(list_frm.page).val(page);
		list_frm.submit();
	});
	
	$(".row").hover(function(){
		$(this).find(".list_tbl_title").css("font-weight", "bold");
		$(this).find(".list_tbl_title").css("color", "#E5C7B7");
	}, function(){
		$(this).find(".list_tbl_title").css("font-weight", "normal");
		$(this).find(".list_tbl_title").css("color", "black");
	});
</script>
</html>