<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/email.css"
	type="text/css">
</head>
<body>
	<div class="aside">
  <button id="selectedEmenu" onclick="location.href='receiveMailList.do'"><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button onclick="location.href='ahome.do'"><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <button onclick="location.href='noticeMain.do'"><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button onclick="location.href='eAddress.do'"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
            <button><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
            <button><img class="icons" src="resources/images/common/texting.png"><br>SNS</button>
	</div>
	<div class="section1">
		<div class="menubar">
			<button id="email1" onclick="location.href='sendMail.do'">메일쓰기</button>
			<button id="email2" onclick="location.href='receiveMailList.do'">받은메일함</button>
			<button id="email3" onclick="location.href='sendMailList.do'">보낸메일함</button>
			<button id="email4" onclick="location.href='temporaryEmailList.do'">임시보관함</button>
		</div>
	</div>
</body>
</html>