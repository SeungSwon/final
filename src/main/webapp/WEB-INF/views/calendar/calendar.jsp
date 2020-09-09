<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.kh.ourwork.calendar.model.vo.Calendar, java.util.*, java.sql.Date"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<Calendar> list = (ArrayList<Calendar>)request.getAttribute("list");
%>
<html>
<head>

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
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      
      /* dateClick: function(arg){
    		
          $.ajax({
        	  url:"addEvent.do",
        	  data:{sName:sName, place:place, memo:memo},
        	  type:"post",
        	  success:function(data){
        		  if(data == "success"){
        			  console.log("success");
        			  if(sName) {
        		          calendar.addEvent({
        		        	title: sName,
        		            start: arg.start,
        		            end: arg.end,
        		            allDay: arg.allDay
        		          })
        		        }
        		        calendar.unselect()
        		  }
        	  },
        	  error:function(e){
        		  console.log(e);
        	  }
        	  
        	  
          });
    	  
      },  */
      
      // eventclick하면 숨겨진 div => 일정 정보 나옴
      
      eventClick: function(arg) {
        console.log(arg);
        var sId = arg.event.extendedProps.sId;
        
        $.ajax({
        	url: "caldetail.do",
        	data: {sId:sId},
        	dataType: "json",
        	type: "post",
        	success: function(data){
        		console.log(data);
        		
        		$("#sName").text(data.sName);	
        		$("#sDate").text(data.sDate);
				$("#fDate").text(data.fDate);
				$("#place").text(data.place);
				$("#memo").text(data.memo);
        		$("#paramsId").val(data.sId);
        		$("#parameId").val(data.eId);
       			$("#caldetail").toggle();
        	},
        	error: function(e){
        		console.log(e);
        	}
        });
        
      },
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
  	   end : "<%= c.getfDate() %>"
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
		border: 1px dotted black;
	    top: 400px;
	    left: 100px;
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
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="section"><br>
		<c:import url="../common/calendarmenu.jsp"/>
		<div class="section1">
			<div class="menubar">
                <button onclick="location.href='calView.do'">전체 캘린더</button>
                <button>팀별 캘린더</button>
                <button>개인 캘린더</button>
            </div>
		</div>
		<div class="section2">
		<br>	
			<div align="right">
				<button class="btn btn-secondary" type="button" onclick="window.open('addpopup.do','일정 추가','width=400, height=600,location=no,status=no,scrollbars=yes')">일정 추가</button>							
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
				<div id="btns">
					<input type="hidden" id="paramsId">
					<input type="hidden" id="parameId">
					<c:set var="eId" value="$('#parameId').val()"/>
					<c:url var="modifypopup" value="modifypopup.do">
						<c:param name="sId" value="$('#paramsId').val()"/>
					</c:url>
						<button class="btn btn-secondary" onclick="window.open('${modifypopup}','일정 수정','width=400, height=600,location=no,status=no,scrollbars=yes')">수정</button>
						<button class="btn btn-secondary" id="delete" onclick="location.href='deletecal.do?sId='+$('#paramsId').val()">삭제</button>
					<c:if test="${ loginUser.eId eq eId }">					
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script>
	 	$("#delete").on("click", function(arg){
	 		if (confirm("일정을 삭제하시겠습니까?") == false) {
	 		    return false;
	 		}
	 	});
	</script>
</body>
</html>

