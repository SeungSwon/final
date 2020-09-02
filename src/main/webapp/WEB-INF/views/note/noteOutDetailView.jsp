<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지 상세 조회</title>
<style>
        .icons{
            width: 50%;
            height: 50%;
            
        }
        .aside button{
            width: 100%;
            height: 11%;
            background: none;
            border: none;
            color: white;
            float: left;
            margin-bottom: 4px;
        }
        .aside button:hover{
            background: #1e87e4;
        }
        .top_profile button{
            margin-top: 30px;
            margin-right: 20px;
        }
        .dropdown-toggle{
            border: none;
            background: none;
        }
        .menubar button{
            border: none;
            background: none;
            width: 100%;
            height: 50px;
            margin-top: 20px;
        }
        .menubar button:hover{
            font-weight: bold;  
            color:#1e87e4;
           
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        /* 쪽지 창 */
        #outboxMessage{
            width: 500px;
            height: 380px;
            /* border: 1px solid gray; */
        }
        #sender{
            margin-top: 30px;
            width: 100%;
            height: 15%;
        }
        #mContent{
            margin: auto;
            width: 100%;
            height: 85%;
        }
        textarea{
            resize:none;
        }
    </style>
</head>
	<body>
		<c:import url="../common/menubar.jsp"/>
		<div class="section"><br>
	        <div class="aside">
	            <button><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
	            <button><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
	            <button onclick="location.href='calview.do'"><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
	            <button><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
	            <button id="selectedMenu" onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
	            <button onclick="location.href='clist.do'"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
	            <button><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
	            <button><img class="icons" src="resources/images/common/texting.png"><br>SNS</button>
	        </div>
	        <div class="section1">
	            <div class="menubar">
	                <button>채팅</button>
	                <button onclick="location.href='ntwriteView.do'">쪽지 쓰기</button>
	                <button onclick="location.href='ntInboxList.do'">받은 쪽지함</button>
	                <button id="selected" onclick="location.href='ntOutboxList.do'">보낸 쪽지함</button>
	                <button>쪽지 보관함</button>
	            </div>
	        </div>
		<div class="section2">
            <div id="outboxMessage">
                <div id="sender" align="center">
                    받는 사람 <input type="text" size="40" value="${ nt.receiver }">
                </div>
                <div id="mContent" align="center">
                    <textarea cols="55" rows="10" id="contentArea">${ nt.ntContent }</textarea>
                    <br>
                    <div id="buttons">
                    	<c:url var="ntsave" value="ntsave.do">
                    		<c:param name="ntId" value="${ nt.ntId }"/>
                    	</c:url>
                    	<c:url var="ntOutDelete" value="ntOutDelete.do">
                    		<c:param name="ntId" value="${ nt.ntId }"/>
                    		<c:param name="page" value="${ currentPage }"/>
                    	</c:url>
                    	<c:url var="returnNote" value="returnNote.do">
                    		<c:param name="ntId" value="${ nt.ntId }"/>
                    	</c:url>
                        <button type="button" id="save" class="btn btn-secondary btn-sm" onclick="location.href='${ntsave}'">보관</button>                        
                        <button type="button" id="delete" class="btn btn-secondary btn-sm" onclick="location.href='${ntOutDelete}'">삭제</button>
                        <c:if test="${ nt.receiveDate != null }">
                             <button type="button" id="returnNote" class="btn btn-secondary btn-sm" onclick="location.href='${ returnNote }'">발송취소</button>
                        </c:if>
                        <button type="button" id="toList" class="btn btn-secondary btn-sm" onclick="history.back();">목록으로</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    <script>
	   	$("#delete").click(function(){
	   		if(confirm("쪽지를 삭제하시겠습니까?") == false){
	   			return false;
	   		}
	   	});

    </script>	
</body>
</html>