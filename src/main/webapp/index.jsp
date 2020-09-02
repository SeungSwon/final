
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>로그인</title>
    <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<link rel="stylesheet" href="${ contextPath }/resources/css/menubar-style.css" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box
}

#wrapper {
	width: 1200px;
	margin: auto;
	/*display: flex; */
	background-color: #5396c9;
}

/* style the container */
.container {
	width: 50%;
	position: relative;
	border-radius: 5px;
	background-color: hsl(0, 0%, 95%);
	padding: 20px 0 30px 0;
	/*display: flex;*/
}

/* bottom container */
.bottom-container {
	width: 50%;
	text-align: center;
	background-color: #01579a;
	border-radius: 0px 0px 4px 4px;
	display: flex;
}

/* style inputs and link buttons */
input, .btn {
	width: 100%;
	padding: 12px;
	/* border: none; */
	border-radius: 4px;
	margin: 5px 0;
	opacity: 0.85;
	display: inline-block;
	font-size: 17px;
	line-height: 20px;
	text-decoration: none; /* remove underline from anchors */
}

/* style the submit button */
input[type=submit] {
	background-color: #73b8ec;
	color: white;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #5e9ece;
}

/* Two-column layout */
.col {
	align-content: center;
	width: 50%;
	margin: auto;
	padding: 0 50px;
	margin-top: 6px;
}

.bottom {
	width: 100%;
	margin: auto;
	padding: 0 50px;
	margin-top: 6px;
}
/* Clear floats after the columns */
.row2 {
	margin: auto;
}

#button {
	background-color: #73b8ec;
	color: white;
	cursor: pointer;
}

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
	/* hide the vertical line */
	.vl {
		display: none;
	}

	/* show the hidden text on small screens */
	.hide-md-lg {
		display: block;
		text-align: center;
	}
}

/* 모달 */
.mo1 {
	width: 150px;
	text-align: center;
}

.mo2 {
	padding: 5px;
}

.b12 {
	margin-left: 500px;
	margin-top: 30px;
}

.modal-content {
	width: 500px;
}

.in {
	padding: 0px;
	width: 300px;
	height: 30px;
	margin-bottom: 20px;
}

.btn-group {
	width: 200px;
	text-align: center;
}

.btn-secondary {
	background: #01579a;
}

.modal-body {
	text-align: center;
}

#id, #pwd {
	margin-top: 16px;
	border: black;
}
</style>

</head>

<body>
	<div id='wrapper' align="center">
		<br> <br>
		<div class="container">
			
				<div class="row2">
					<h4 style="text-align: center">로그인하세요</h4>
					
					<form action="login.do" method="post" >
					<div class="col">
						<input type="text" name="eId" placeholder="ID" required> 
						<input type="password" name="ePwd" placeholder="Password" maxlength="20" required>
						<input type="submit" value="로그인">
					
					</div>
					</form>
				</div>
		</div>

		<div class="bottom-container">
			<div class="row2">

				<div class="bottom">
					<button href="#" data-toggle="modal" style="color: white"
						class="btn" data-target="#staticBackdrop">ID/PWD 찾기</button>
				</div>
				<div class="bottom">
					<button style="color: white" class="btn" onclick="location.href='eJoin.do'">회원가입</button>
				</div>

			</div>
		</div>
		<br> <br>
	</div>
	</div>
	
	<!-- ModalID -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">ID/PWD찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-secondary active"> 
						<input type="radio" name="tap" id="findId" onchange="setDisplay()" checked>ID찾기
						</label> <label class="btn btn-secondary"> <input type="radio"
							name="tap" id="findPwd" onchange="setDisplay()">PW찾기
						</label>
					</div>
					<div id="id">
						<table>
							<tr class="mo2">
								<td class="mo1">이름</td>
								<td><input type="text"></td>
							</tr>
							<tr class="mo2">
								<td class="mo1">이메일</td>
								<td><input type="email"></td>
							</tr>
						</table>
					</div>
					<div id="pwd">
						<table>
							<tr class="mo2">
								<td class="mo1">아이디</td>
								<td><input type="id"></td>
							</tr>
							<tr class="mo2">
								<td class="mo1">이메일</td>
								<td><input type="email"></td>
							</tr>
						</table>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">찾기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$('#pwd').hide();
		});

		function setDisplay() {
			if ($('input:radio[id=findId]').is(':checked')) {
				$('#id').show();
				$('#pwd').hide();
			} else if ($('input:radio[id=findPwd]').is(':checked')) {
				$('#id').hide();
				$('#pwd').show();
			}
		}
	</script>
	
	<button onclick="location.href='home.do'">메인</button>	
	<button onclick="location.href='eAddress.do'">주소록</button>
	<button onclick="location.href='eCalendar.do'">캘린더</button>
	<button onclick="location.href='eMypage.do'">마이페이지</button>
	<button onclick="location.href='eUpdate.do'">정보수정</button>
	




</body>


</html>

