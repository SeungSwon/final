<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ourwork</title>
</head>
<body>
	<div id="error-container" style="text-align:center;">
		<h1>Error</h1>
		<h2 style="color:red;">${ msg }<br>
		<%= request.getAttribute("javax.servlet.error.message") %></h2>
		<button onclick="location.href='/ourwork'">로그인 페이지로 돌아가기</button>	
	</div>

</body>
</html>