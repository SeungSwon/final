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
    
    <title>개인정보 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
    
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"> </script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
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

        .section2 {
            text-align: center;
            width: 80%;
            height: 100%;
            margin-left: 50px;
            margin-top: 80px;
            float: left;
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;    
        }

        .section,
        .section1 {
            display: flex;
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
                /* 내용 td */
                td{
            font-size: 15px;
            /*font-weight : bold;*/
            height: 50px;
        }
        h4{
            font-weight : bold;
        }

        input {
        
        padding: 9px;
        border: 1px solid rgb(182, 181, 181);
        border-radius: 4px;
        margin: 5px 0;
        opacity: 0.85;
        display: inline-block;
        font-size: 12px;
        line-height: 20px;
        text-decoration: none; /* remove underline from anchors */
        }
        
        #add{
        width: 310px;
        }


       /* style the submit button */

        input[type=button] {
        background-color: #2a7fc0;
        color: white;
        cursor: pointer; 
        }

        input[type=button]:hover {
        background-color: #2670a8;
        }

        input[type=submit] {
        background-color: #2a7fc0;
        color: white;
        cursor: pointer; 
        }

        input[type=submit]:hover {
        background-color: #2670a8;
        }
        
        .modal-content{
            background-color: hsl(0, 0%, 95%);
        }
        tr,td{
            text-align: center;
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
            <button><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
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
        <form action="memberUpdate.do" method="post" id="updateForm" onsubmit="return validate();">
        
          <br><br>
            <p>개인정보 수정</p>

            <table align="center">
            
                <tr>
                    <td>이름 : </td>
                    <td>
                      <input type="text" name="eName" value="${ loginUser.eName }" readonly>
                    </td>
                </tr>
                <tr>
                    <td>프로필 사진 : </td>
                    <img id="new1" >
                    <button type="button" class="btn" id="profilImg" >사진첨부  </button> 
                    
                    <td>
                        <div id="profil" hidden>
                            <form>
                                <div class="form-group">
                                    <input type="file" id="Img1" name="Img1" onchange="loadImg(this,1)">
                                </div>
                            </form>
                        </div>
                    </td>
                    <td> <img class="pro" src="../html/image/IU.JPG"> </td>
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
						<input type="email" name="email" value="${ loginUser.email }" >
					</td>
					<td>
                        <input type="submit" name="submit" value="수정">

                    </td>
                </tr>
                <tr>
                    <td>전화번호 : </td>
                    <td>
                   	 <input type="text" name="phone" value="${ loginUser.phone }" >
                    </td>
                    <td>
                        <input type="submit" name="submit" value="수정">

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
						<input type="text" name="post" class="postcodify_postcode5" size="6" value="${ addr1 }">
						<button type="button" id="postcodify_search_button">검색</button>
					</td>
				</tr>
				<tr>
					<td>도로명 주소 : </td>
					<td><input id="add" type="text" name="address1" class="postcodify_address" value="${ addr2 }"></td>
				</tr>
				<tr>
					<td>상세 주소 : </td>
					<td><input type="text" name="address2" class="postcodify_details" value="${ addr3 }"></td>					
					<td>
                        <input type="submit" name="submit" value="수정">

                    </td>
				</tr>

                <tr>
                    <td>입사일 : </td>
                    <td><input type="date" name="join_date" value="${ loginUser.join_date }" readonly></td>
                </tr>

            </table>
            <br><br><input type="button" value="취소" required>&emsp;
            
            <input type="submit" value="수정완료" required>
			</form>
        </div>
         

    </div>


<script> 

$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 

$(function() { $("#contentImg1").click(function(){
			  $("#Img1").click();
				});
				
		// input type="file" 태그에 이미지 파일이 첨부 되었을 때
		// div에 미리보기 표현하기
		function loadImg(value, num){
			// value => this : input type="file"
			// num => 각 번호에 맞춰 위의 미리보기 img에 적용 시킬 숫자
			
			// file이 존재한다면
			if(value.files && value.files[0]){
				// 파일을 읽어들일 수 있는 FileReader 객체 생성
				var reader = new FileReader();
				
				// 파일 읽기가 다 완료 되었을 때 실행 되는 메소드
				reader.onload = function(e){
					switch(num){
					case 1:
						$("#new1").attr("src", e.target.result);
						break;
					}
				}
				
				// 파일 읽기 하는 메소드
				reader.readAsDataURL(value.files[0]);
			}
		}
						
</script>


</body>

</html>