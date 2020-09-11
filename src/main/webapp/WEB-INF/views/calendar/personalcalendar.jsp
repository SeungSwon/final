<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.kh.ourwork.calendar.model.vo.Calendar, java.util.*, java.sql.Date"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<Calendar> list = (ArrayList<Calendar>)request.getAttribute("list");
%>
<html>
<head>
<title>개인 캘린더</title>
<link href='resources/fullcalendar/main.css' rel='stylesheet'/>
<script src='resources/fullcalendar/main.js'></script>
 <script src='resources/fullcalendar/locales/ko.js'></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        right: 'prev,next today',
        left: 'title',
      },
      initialDate: new Date(),
      selectMirror: true,
     
      // eventclick하면 숨겨진 div => 일정 정보 나옴
      eventClick: function(arg) {
        var sId = arg.event.extendedProps.sId;
        var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;
		
		var oWidth = $('#caldetail').width();
		var oHeight = $('#caldetail').height();
		
		var divLeft = event.pageX + 10;
		var divTop = event.pageY + 5;
        
        $.ajax({
        	url: "personalcaldetail.do",
        	data: {sId:sId},
        	dataType: "json",
        	type: "post",
        	success: function(data){
        		$("#sName").text(data.sName);	
        		$("#sDate").text(data.sDate);
				$("#fDate").text(data.fDate);
				$("#place").text(data.place);
				$("#memo").text(data.memo);
        		$("#paramsId").val(data.sId);
        		$("#parameId").val(data.eId);
        		
        		$('#caldetail').css({
        			"top": divTop,
        			"left": divLeft,
        			"position": "absolute"
        		}).toggle();
        	},
        	error: function(e){
        		console.log(e);
        	}
        });
        
      },
      locale: "ko",
      editable: true,
      events: [
<% 
  	  for (int i = 0; i < list.size(); i++) {
  	  	Calendar c = (Calendar)list.get(i);
  	  	
%>	
  	  {
	   sId : '<%= c.getsId() %>',
  	   title : '<%= c.getsName() %>',
  	   start : "<%= c.getsDate() %>",
  	   end : "<%= c.getfDate() %>",
  	   color : "rgb(100, 110, 120)"
  	   },
<%
	}
%>
      ]
    });
    calendar.render();
});
</script>
<style>
	#caldetail{
		border: 1px solid gray;
	    overflow-y: auto;
	    overflow-x: hidden;
	    position: absolute;
    	z-index: 1000;
	}
  	body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
  	}

  	.section2 {
   		max-width: 1100px;
     	margin: 20px 2%;
        padding: 0px 0px;
  	}
	.menubar button {
		border: none;
		background: none;
		width: 100%;
		height: 50px;
		margin-top: 20px;
	}
		
	.menubar button:hover {
	   color: #1e87e4;
	   font-weight: bold;
	}
       
    #selected{
		font-weight: bold;  
     	color:#1e87e4;
    }
    .btn{
    	text-align: center;
    }
    #detailTable{
    	text-align: center;
    }
    td{
    	padding: 5px;
    }
    #calendar{
    	position: relative;
    	z-index: 1001;
    }
    #detailTable{
    	background: white;
    	z-index: 100;
    }
    #detailTable th{
    	background: white;
    	border-bottom: 1px solid gray;
    	border-right: 1px solid gray;
    	padding: 5px;
    }
    #detailTable td{
    	background: white;
    	border-bottom: 1px solid gray;
    	padding: 10px;
    }
    #btns{
    	margin: auto;
    	background: white;
    }
    
    #calendar{
    	z-index: 200;
    }
    .fc-col-header-cell-cushion{
    	all: unset;
    }
    .fc-daygrid-day-number{
    	all: unset;
    }
    .fc-col-header-cell-cushion:hover{
    	text-decoration: none;
    	color: black;
    }
    .fc-daygrid-day-number:hover{
    	text-decoration: none;
    	color: black;
    }
    .fc-today{
    	background-color: lightgrey !important;
    }
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="section"><br>
		<c:import url="../common/calendarmenu.jsp"/>
		<div class="section1">
			<div class="menubar">
                <button onclick="location.href='calview.do'">전체 캘린더</button>
                <button onclick="location.href='teamcalview.do'">팀별 캘린더</button>
                <button id="selected" onclick="location.href='personalcalview.do'">개인 캘린더</button>
            </div>
		</div>
		<div class="section2">
		<br>	
			<div align="right">
				<button class="btn btn-secondary" type="button" onclick="window.open('addpersonalpopup.do','일정 추가','width=400, height=600,location=no,status=no,scrollbars=yes')">일정 추가</button>							
			</div>
			<br>
			<div id="calendar"></div>
     		<div id="caldetail">
				<table id="detailTable" align="center">
					<tr>
						<th>일정명</th>
						<td id="sName"></td>
					</tr>
					<tr>
						<th>시작일</th>
						<td id="sDate"></td>
					</tr>
					<tr>
						<th>종료일</th>
						<td id="fDate"></td>
					</tr>
					<tr>
						<th>장소</th>
						<td id="place"></td>
					</tr>
					<tr>
						<th>메모</th>
						<td id="memo"></td>
					</tr>
				</table>
				<div id="btns" align="center"><br>
					<input type="hidden" id="paramsId">
					<input type="hidden" id="parameId">
					<button class="btn btn-secondary" id="modify" onclick="fn_modify();">수정</button>
					<button class="btn btn-secondary" id="delete" onclick="location.href='deletepersonalcal.do?sId='+$('#paramsId').val()">삭제</button>
					<c:if test="${ loginUser.eId eq eId }">					
					</c:if>
				</div>
				<div style="height: 20px; background-color: #FFFFFF"></div>
			</div>
		</div>
	</div>
	<script>
	 	$("#delete").on("click", function(arg){
	 		if (confirm("일정을 삭제하시겠습니까?") == false) {
	 		    return false;
	 		}
	 	});
	 	function fn_modify(){
	 		var sId = $("#paramsId").val();
	 		window.open("<c:url value='updatePersonalCalView.do?sId="+sId+"'/>", "일정 수정", "width=500, height=600");
	 	}
	</script>
</body>
</html>