<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="header">
		<div id="header_box">
			<div class="header_box_div">
				<h1>BULLETIN BOARD</h1>
				<p>게시판 글 등록하기</p>
			</div>
			<div class="header_box_none"></div>
			<a href="/post/list" class="header_box_button" onclick="window.open(this.href, '_blank'); return false;"><button>GO</button></a>
		</div>
	</div>
</body>
<script>
	$("#header_box").fadeIn(1000);
</script>
</html>