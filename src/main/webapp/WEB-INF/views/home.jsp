<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>
.approval, .schedule, .notice, .board {

   width: 48%;
   height: 48%;
   margin: 20px 6px 0px 6px;
   box-sizing: border-box;
   display: inline-block;

}

/*--------------------------------------main--------------------------------------------*/
.content {
   width: 96%;
   height: 45%;
   margin: 2%;
}

.title {
   font-size: 20px;
   color: white;
   font-weight: bold;
   float: left;
   margin: 0px 0px;
   text-align: center;
}

.plus {
   width: 25px;
   height: 25px;
   float: right;
   cursor: pointer;
}

.tabletitle {
   height: 13%;
   background: #01579a;
   padding: 8px 15px;
   border-radius: 10px 10px 0px 0px
}

#profilediv {
   margin-top: 100px;
}

#mainpro {
   width: 150px;
   height: 150px;
   border-radius: 70px;
   margin-left: 35px;
}

#proname {
   margin: 15px 60px 0px 60px;
   font-size: 20px;
   font-weight: bold;
   color: gray;
}

#homename{
	text-align: center;
}


#procompany {
   margin: 0px 30px;
   color: gray;
}

#buttongroup {
   float: left;
}

#buttongroup button {
   border: none;
   background: none;
   font-size: 17px;
   font-weight: bold;
   color: rgb(107, 107, 107)
}

#buttongroup button:hover {
   background: #f1f1f1
}

#buttongroup img {
   width: 20px;
   height: 20px;
   margin-right: 5px;
}

#buttongroup {
   align: left;
   margin: 30px 8px;
}

#talk {
   width: 200px;
   height: 40px;
   margin: 15px 15px;
   font-size: 20px;
   background: #01579a;
   color: white;
   border-radius: 5px;
   border: white;
   text-align: center;
}

#talk:hover {
   background: #1e87e4;
}
</style>
</head>
<body>
   <jsp:include page="common/menubar.jsp" />
   <div class="section">
      <br>
      <div class="aside">
         	<button id="selectedEmenu" onclick="location.href='receiveMailList.do'"><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button onclick="location.href='ahome.do'"><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <button onclick="location.href='noticeMain.do'"><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button onclick="location.href='eAddress.do'"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
            <button onclick="location.href='pteam.do'"><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
            <button><img class="icons" src="resources/images/common/texting.png"><br>SNS</button>
      </div>
      <div class="section1">
         <div id="profilediv">
            <img id="mainpro" src="resources/images/common/profile_1.JPG">
            <br><p id="homename"><c:out value="${ loginUser.eName }님 "/></p>            


            <p id="procompany">(주) Samsung Company</p>
            <div id="buttongroup">
               <button><img src="resources/images/common/mail2.png">메일쓰기</button>
               <button><img src="resources/images/common/briefcase.png">결재작성</button>
               <button style="margin-top: 10px"><img src="resources/images/common/calendar2.png">일정등록</button>
               <button><img src="resources/images/common/checklist.png">설문작성</button>
            </div>
            <button id="talk">ourTalk</button>
         </div>
      </div>

      <div class="section2">
         <div class="approval">
            <div class="tabletitle">
               <p class="title">결재대기함</p>
               <img class="plus" src="resources/images/common/plus.png">
            </div>
            <table class="table">
               <tr>
                  <th>기안일</th>
                  <th>결제양식</th>
                  <th>제목</th>
                  <th>기안자</th>
                  <th>첨부</th>
               </tr>
               <tr>
                  <td>20/08/17</td>
                  <td>휴가신청</td>
                  <td>인사팀휴가신청</td>
                  <td>최유빈</td>
                  <td>1</td>
               </tr>
               <tr>
                  <td>20/08/16</td>
                  <td>출방보고서</td>
                  <td>홍보팀출장</td>
                  <td>최유빈</td>
                  <td></td>
               </tr>
            </table>
         </div>
         <div class="schedule">
            <div class="tabletitle">
               <p class="title">오늘의 일정</p>
               <img class="plus" src="resources/images/common/plus.png">
            </div>
            <table class="table">
               <tr>
                  <th>시간</th>
                  <th>일정내용</th>
               </tr>
               <tr>
                  <td>14:00</td>
                  <td>기획회의</td>

               </tr>
               <tr>
                  <td>15:30</td>
                  <td>출장보고서 제출하기</td>
               </tr>
            </table>
         </div>
         <div class="notice">
            <div class="tabletitle">
               <p class="title">공지사항</p>
               <img class="plus" src="resources/images/common/plus.png">
            </div>
            <table class="table">
               <tr>
                  <th>No.</th>
                  <th>내용</th>
                  <th>글쓴이</th>
                  <th>작성일</th>
               </tr>
               <tr>
                  <td>1</td>
                  <td>인테리어 변경</td>
                  <td>이승현</td>
                  <td>20/08/16</td>
               </tr>
               <tr>
                  <td>2</td>
                  <td>출장 리스트</td>
                  <td>이승현</td>
                  <td>20/08/15</td>
               </tr>
            </table>
         </div>
         <div class="board">
            <div class="tabletitle">
               <p class="title">게시판</p>
               <img class="plus" src="resources/images/common/plus.png">
            </div>
            <table class="table">
               <tr class="midheader" text-align="center">
                  <th>No.</th>
                  <th>내용</th>
                  <th>글쓴이</th>
                  <th>작성일</th>
               </tr>
               <tr>
                  <td>1</td>
                  <td>인테리어 변경</td>
                  <td>이승현</td>
                  <td>20/08/16</td>
               </tr>
               <tr>
                  <td>2</td>
                  <td>출장 리스트</td>
                  <td>이승현</td>
                  <td>20/08/15</td>
               </tr>
            </table>
         </div>
      </div>
   </div>
</body>
</html>