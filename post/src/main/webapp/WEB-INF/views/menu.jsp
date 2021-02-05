<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Open+Sans+Condensed:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<div id="menu">
		<div id="menu_content">
			<div class="menu_logo"><a href="/">TITLE</a></div>
			<c:if test="${ id!=null }">
				<div class="items"><a href="/logout">LOGOUT</a></div>
				<div class="items"><a href="/post/list">POSTS</a></div>
				<div class="items">${ name }님</div>
			</c:if>
			<c:if test="${ id==null }">
				<div class="items"><a href="/login">LOGIN</a></div>
				<div class="items"><a href="/post/list">POSTS</a></div>
			</c:if>
		</div>
	</div>
</body>
<script>
	var bannerOffset = $('#menu').offset();

	$(window).scroll(function() { //window에 스크롤링이 발생하면
		if ($(document).scrollTop() > bannerOffset.top) { // 위치 및 사이즈를 파악하여 미리 정한 css class를 add 또는 remove 합니다.
			$('#menu').addClass('menu_Fixed');
		} else {
			$('#menu').removeClass('menu_Fixed');
		}
	});
</script>
</html>