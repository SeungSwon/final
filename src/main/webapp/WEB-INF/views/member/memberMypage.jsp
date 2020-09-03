<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>개인정보 조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
   

    <style>
        body {
            width: 1400px;
            height: 800px;
        }

        .section {
            width: 100%;
            height: 85%;
        }

        .aside {
            height: 100%;
            width: 6%;
            background: #01579a;
        }

        .section1 {
            width: 14%;
            height: 100%;
            

        }
        
        .section,
        .section1 {
            display: flex;
        }
        
        
        .section2 {
            text-align: center;
/*             width: 80%;
            height: 100%;
            margin-left: 50px;
            margin-top: 80px; */
            float: left;
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;    
        }

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
                
        .menubar button{
            border: none;
            background: none;
            width: 100%;
            height: 50px;
            margin-top: 20px;
        }
        .menubar button:hover{
            color: #1e87e4;
            font-weight: bold;
        }
        
        h4{
            font-weight : bold;
        }
        
        #myinfo td {
            font-size: 15px;
            text-align: center;
            height: 50px;
            text-decoration: none;        
        }
        
        #mybtn{
         width: 20%;       
        }
        
        input {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 4px;
        margin: 5px 0;
        opacity: 0.85;
        display: inline-block;
        font-size: 17px;
        line-height: 20px;
        text-decoration: none; /* remove underline from anchors */
        }
        
        #add{
        width: 310px;
        }

        /* style the submit button */
        input[type=button] {
        width: 10%;
        padding: 12px;
        background-color: #2a7fc0;
        color: white;
        cursor: pointer; 
        
        }

        input[type=button]:hover {
        background-color: #2670a8;
        }
        

        .modal-content{
            background-color: hsl(0, 0%, 95%);
        }
       .pro{
            width:80px;
            height:80px;
        }
        
    </style>
</head>

<body>

   <jsp:include page="../common/menubar.jsp"/>

    <div class="section"><br>
        <div class="aside">
            <button><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <button><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button><img class="icons" src="resources/images/common/address.png" onclick="location.href='eAddress.do'"><br>주소록</button>
            <button><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
            <button><img class="icons" src="resources/images/common/texting.png"><br>SNS</button>

        </div>
        <div class="section1">
            <div class="menubar">
                <button onclick="location.href='eMypage.do'">개인정보 조회</button>
                <button onclick="location.href='eCalendar.do'">개인근태 조회</button>
            </div>
        </div>
        <div class="section2">
        <br><br>
            <p>개인정보 조회</p>
            <table align="center" id="myinfo">
                <tr>
                    <td>이름 : </td>
                    <td>
                      <input type="text" name="eName" value="${ loginUser.eName }" required>
                    </td>
                </tr>
                <tr>
                    <td>프로필 사진 : </td>
                    <td> <img class="pro" src="../html/image/IU.JPG"> </td>
                    <td>
                        <div id="profilemain">

                        </div>
                    </td>
                </tr>
                <tr>
                    <td>아이디 : </td>
                    <td>
                    <input type="text" name="eId" id="eId" value="${ loginUser.eId }" readonly>
					</td>
                </tr>
                
                <tr>
                    <td>생년월일 : </td>
                    <td>
						<input type="text" name="eBirth" value="${ loginUser.eBirth }" readonly>
					</td>
                </tr>

                <tr>
                    <td>이메일 : </td>
                    <td>
						<input type="email" name="email" value="${ loginUser.email }" readonly>
					</td>
                </tr>
                <tr>
                    <td>전화번호 : </td>
                    <td>
                   	 <input type="phone" name="phone" value="${ loginUser.phone }" readonly>
                    </td>
                </tr>
                <c:forTokens var="addr" items="${ loginUser.address }" delims="," varStatus="status">
					<c:if test="${ status.index eq 0 }">
						<c:set var="addr1" value="${ addr }" />
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="addr2" value="${ addr }" />
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="addr3" value="${ addr }" />
					</c:if>
				</c:forTokens>
                <tr>
                    <td>우편번호 : </td>
                    <td>
						<input id="add" type="text" name="post" class="postcodify_postcode5" size="6" value="${ addr1 }" readonly>
					</td>
                </tr>
				<tr>
					<td>도로명 주소 : </td>
					<td><input type="text" name="address1" class="postcodify_address" value="${ addr2 }" readonly></td>
				</tr>
				<tr>
					<td>상세 주소 : </td>
					<td><input type="text" name="address2" class="postcodify_details" value="${ addr3 }" readonly></td>
				</tr>

                <tr>
                    <td>입사일 : </td>
                    <td><input type="date" name="join_date" value="${ loginUser.join_date }" readonly></td>
                </tr>


            </table><br>

            <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop" value="수정하기" required>
           
           <button onclick="location.href='eUpdate.do'">개인정보수정</button>
           <button onclick="location.href='eUpdate.do'">비밀번호수정</button>
        </div>
        
        <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
        

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">

            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modaltitle">비밀번호 확인</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <div class="modal-footer">
					
					<form action="login.do" method="post" >
					<input type="button" id="mybtn" class="btn btn-secondary" data-dismiss="modal" value="취소">
                    <c:url var="edelete" value="eUpdate.do">
						<c:param name="ePwd" value="${ loginUser.ePwd }"/>
					</c:url>
						<input type="button" id="mybtn" class="btn btn-primary" value="수정">
					</form>
					
						
                        
                        
                    </div>
                </div>
            </div>
        </div>

    </div>
    </div>

</body>

</html>