<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.kh.ourwork.calendar.model.vo.Calendar, java.util.*"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<Calendar> list = (ArrayList<Calendar>)request.getAttribute("list");
%>
<html>
<head>

<link href='resources/fullcalendar/lib/main.css' rel='stylesheet'/>
<script src='resources/fullcalendar/lib/main.js'></script>
 <script src='resources/fullcalendar/lib/locales/ko.js'></script>
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
      
      // 일정 등록
      /* select: function(arg) {
        var sName = prompt('일정 입력 : ');
        var plcae = prompt('장소 : ');
        var memo = prompt("메모 : ");
       
        if (sName) {
          calendar.addEvent({
        	title: sName,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      }, */
      
      dateClick: function(arg){
    	  var sName = prompt('일정 입력 : ');
          var place = prompt('장소 : ');
          var memo = prompt("메모 : ");
          
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
    	  
      },
      
      // 일정 삭제
      eventClick: function(arg) {
        if (confirm('일정을 삭제하시겠습니까?')) {
          arg.event.remove()
        }
      },

      locales: 'ko',
      editable: true,
      events: [
<% 
  	  for (int i = 0; i < list.size(); i++) {
  	  	Calendar c = (Calendar)list.get(i);
%>	
  	  {
  	   title : '<%= c.getsName() %>',
  	   start : '<%= c.getsDate() %>',
  	   end : '<%= c.getfDate() %>'
  	   },
<%
	}
%>
		{
		   title : 'defult',
		   start : "2019-09-01",
		   end : "2019-09-01"
		  }
      ]
    });
    calendar.render();
});
</script>
<style>
  	body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
  	}

  	#calendar {
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
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="section"><br>
		<c:import url="../common/calendarmenu.jsp"/>
		<div class="section1">
			<div class="menubar">

                <button onclick="location.href='calview.do'">전체 캘린더</button>
                <button id="selected" onclick="location.href='teamcalview.do'">팀별 캘린더</button>
                <button onclick="location.href='personalcalview.do'">개인 캘린더</button>
            </div>
		</div>
		<div class="section2">	
			<div id='calendar'></div>
			<button class="addSchedule" onclick="window.open('addpopup.do','일정 추가','width=550, height=720,location=no,status=no,scrollbars=yes')">추가</button>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>

