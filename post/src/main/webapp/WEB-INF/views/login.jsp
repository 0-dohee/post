<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<link rel='stylesheet' media='all and (max-width: 600px)' href='${pageContext.request.contextPath}/resources/style3.css' /> 
	<link rel='stylesheet' media='all and (min-width: 601px) and (max-width: 1024px)' href='${pageContext.request.contextPath}/resources/style2.css' /> 
	<link rel='stylesheet' media='all and (min-width: 1025px)' href='${pageContext.request.contextPath}/resources/style.css' />
</head>
<body>
	<div id="page">
		<jsp:include page="menu.jsp"/>
		<div id="login_content">
			<div id="login_content_title">LOG IN</div>
			<form name="login_frm" action="login" method="post">
				<table id="login_tbl">
					<tr>
						<td><input type="text" name="id" placeholder="ID"></td>
					</tr>
					<tr>
						<td><input type="password" name="pass" placeholder="PASSWORD"></td>
					</tr>
					<tr>
						<td><input type="submit" value="log in"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
<script>

	$(login_frm).submit(function(e){
	var id=$(login_frm.id).val();
	var pass=$(login_frm.pass).val();
	
	e.preventDefault();

	$.ajax({
		type:"post",
		url:"/login",
		data:{"id":id, "pass":pass},
		success:function(data) {
			if(data==0) {
				alert("아이디가 존재하지 않습니다.");
			}else if(data==1) {
				alert("아이디/비밀번호를 확인해주세요.");
			}else {
				location.href="/";
			}
		}
	});
});

</script>
</html>