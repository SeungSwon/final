<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
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
        #writeMessage{
            width: 500px;
            height: 380px;
            /* border: 1px solid gray; */
        }
        #receiver{
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
        #mContent p{
            margin-right: 30px;
            font-size: 12px;
        }
    </style>
</head>

<body>
	<c:import url="../common/menubar.jsp"/>
    <div class="section"><br>
        <div class="aside">
            <button><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <button><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button id="selectedMenu" onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button onclick="location.href='clist.do'"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
            <button><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
            <button><img class="icons" src="resources/images/common/texting.png"><br>SNS</button>
        </div>
        <div class="section1">
            <div class="menubar">
                <button>채팅</button>
                <button>쪽지 쓰기</button>
                <button id="selected">받은 쪽지함</button>
                <button>보낸 쪽지함</button>
                <button>쪽지 보관함</button>
            </div>
        </div>
        <div class="section2">
            <div id="writeMessage">
            	<form action="replysend.do" method="post">
                <div id="receiver" align="center">
                    받는 사람 <input type="text" size="40" id="addReceiver" name="addReceiver" value="${ eId }">
                    <input type="hidden" name="page" value="${ pi.currentPage }">
                </div>
                <br>
                <div id="mContent" align="center">
                    <textarea cols="55" rows="10" id="contentArea" name="ntContent"></textarea>
                    <br>
                    <p align="right" id="count">0/1000자</p>
                    <div id="buttons">
                        <button type="button" id="cancel" class="btn btn-secondary btn-sm" onclick="history.back();">취소</button>
                        <button type="submit" id="submit" class="btn btn-secondary btn-sm">보내기</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script>
       
        $(document).on('keyup', '#contentArea', function(e){
            var textarea = $(this).val();
            $('#count').text(getBytes(textarea)+"/1000자");
            
            var countNum = parseInt(getBytes(textarea));
            
		
            if(countNum > 1000){
                $("#count").css("color", "red");
            }else{
                $("#count").css("color", "black");
            }

        });
        
        function getBytes(str){
        var cnt = 0;
        for(var i =0; i<str.length;i++) {
            cnt += (str.charCodeAt(i) >128) ? 2 : 1;
            }
        return cnt;
        }
        
        $("#submit").click(function(){
        	var textarea = $("#contentArea").val();
        	var num = parseInt(getBytes(textarea));
        	var receiver = $("#addReceiver").val();

        	
        	if(confirm("쪽지를 보내시겠습니까?") == false){
        		return false;
        	}else if(receiver == ""){
        		alert("받는 사람을 입력해주세요.");
        		return false;
        
        	}else if(num == 0){
        		alert("내용을 입력해주세요.");
        		return false;
        	}else if(num > 1000){
        		alert("1000자 이하로 적어주세요.");
        		return false;
        	}
        	return true;
        });
        
    </script>
</body>

</html>