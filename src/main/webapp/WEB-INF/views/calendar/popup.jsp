<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<style>
		.group-body{
			margin: auto;
		}
		
		
	</style>
</head>
<body>
	<div class="group" id="popupGroup">
		<div class="group-head">
			<h1 class="zTree-h1">일정 추가</h1>
		</div>
		<div class="group-body">
			<form id="scheduleData" action="addEvent.do" method="post">
				<div class="top">
					<input type="text" id="sName" name="sName" size="40" placeholder="제목을 입력해주세요">
				</div>
				<div class="domain"><h3 class="zTree-h3">시작 </h3></div>
				<div class="domain">
					<input class="date" type="date" id="sDate" name="sDate" size="40" >
				</div>
				<div class="domain"><h3 class="zTree-h3">종료 </h3></div>
				<div class="domain">
					<input class="date" type="date" id="fDate" name="fDate" size="40" >
				</div>
				<div class="domain"><h3 class="zTree-h3">장소 </h3></div>
				<div class="domain">
					<input id="place" type="text" name="place" size="40" >
				</div>
				<div class="domain"><h3 class="zTree-h3">메모 </h3></div>
				<div class="domain">
					<textarea class="memo" id="memo" name="memo" rows="5" cols="34"></textarea>
				</div>
			<input class="ok-button" type="button" value="확인">		
			<input class="cancel" type="button" onclick="window.close()" value="취소">
			</form>
		</div>
	</div>
	
	<script>
		$(".ok-button").click(function(){
			var sName = $("#sName").val();
			var sDate = $("#sDate").val();
			var fDate = $("#fDate").val();
			var place = $("#place").val();
			var memo = $("#memo").val();
			
			$.ajax({
				url: "addEvent.do",
				data: {sName:sName, sDate:sDate, fDate:fDate, place:place, memo:memo},
				type: "post",
				success: function(data){
					if(data == "success"){
						opener.location.reload();
						window.close();
					}
					
				},
				error: function(e){
					console.log(e);
				}
				
				
			});
		});
	</script>
</body>
</html>