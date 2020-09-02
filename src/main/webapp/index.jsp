<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1 align="center">OURWORK</h1>
	<div align="center">
		<button onclick="location.href='clist.do'">거래처</button>
		<button onclick="location.href='clist.do'">쪽지</button>
		<button onclick="location.href='clist.do'">일정</button>	
		<button onclick="location.href='home.do'">Click me!</button>	
	</div>
	<!-- 버튼을 클릭했을 때 메인페이지(home.jsp)로 넘어가게 하기
		 .do가 url-pattern 뒤에 붙으면 DispatcherServlet이 실행되게 할 것
		 => web.xml로 돌아가자 -->
		 
</body>
</html>