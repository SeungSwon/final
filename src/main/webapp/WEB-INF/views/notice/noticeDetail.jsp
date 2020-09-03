<!-- 수정해야함 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OurWork</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>

        
        #selectedMenu{
            background: #1e87e4;  
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        
        /* 여기 메뉴바*/
        .menubar a{
            padding: 6px 8px 6px 16px;
            text-decoration: none;
            font-size: 15px;
            color: rgb(52, 53, 77);
            display: block;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            outline: none;
            margin-top: 20px;
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
        
        /* 테이블 */
        #boardTable {
      margin:auto;
      border:solid 1px white;
      width: 900px;
      height: 70%;
      margin-top: 30px;
   }
   
   #boardTable th, #boardTable td {
      border:solid 1px white;
      text-align:center;
      font-size: 15px;
      padding: 10px;
   }
   .division{
       width: 150px;
   }
   /* 댓글 */
   .reply{
       margin-left: 200px;
   }

    img{
        text-align: right;
    }
   
   #rContent{
       width: 600px;
       text-align: center;
       margin-left: 30px;
   }
   .rbtn{
       margin-top: -30px;
   }
   #rep{
       margin-left: 100px;
   }
    .imgsa{
        width: 20px;
        height: 20px;
    }

    .imgg{
        text-align: right;
    }
    .replyTable1{
        width: 100%;
    }
    .replyTable1{
        width: 81.5%;
    }
    .tatr{
    	margin-bottom: 20px;
    }
        
    </style>
</head>

<body>
    <jsp:include page="../common/menubar.jsp" />
    <div class="section"><br>
       <jsp:include page="../common/noticemenu.jsp" />
        <div class="section1">
            <div class="menubar">
                    <button id="selected">사내 게시판</button>
                    <button>팀별 게시판</button>
                    <button>팀별 공지사항</button>
        </div>
        </div>
        <div class="section2">
            <table id="boardTable">
                <tr class="tatr">
                    <td class="division">제목</td>
                    <td class="in">${ notice.nTitle }</td>
                </tr>
                <tr class="tatr">
                    <td class="division">작성자</td>
                    <td class="in">${ notice.eId }</td>
                </tr>
                <tr class="tatr">
                    <td class="division">첨부파일</td>
                    <td class="in">
                    	<c:if test="${ !empty at.originName }">
                            <a href="${ contextPath }/resources/images/clientUploadFiles/${ at.changeName }" download>${ at.originName }</a>
                        </c:if> 
                        <c:if test="${ empty at.originName }">
                            등록된 파일이 없습니다.
                        </c:if> 
                    </td>
                </tr>
                <tr class="tatr">
                    <td class="division">내용</td>
                    <td class="in"><textarea class="int" rows="10" cols="85" readonly="readonly">${ notice.nContent }</textarea></td>
                </tr>
                <tr class="tatr">
                    <td colspan="2" align="center">
                    	<c:url var="noticeMain" value="noticeMain.do">
                    		<c:param name="page" value="${ currentPage }"/>
                    	</c:url>
                        <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ noticeMain }'">목록으로</button>
                        
                        <!-- 여기 if문으로 나눠야함 -->
                        <c:url var="upno" value="upno.do">
                        	<c:param name="nNo" value="${ notice.nNo }"/>
                        	<c:param name="page" value="${ currentPage }"/>
                        </c:url>
                        <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ upno }'">수정하기</button>
                        
                        <c:url var="deno" value="deno.do">
                        	<c:param name="nNo" value="${ notice.nNo }"/>
                        </c:url>
                        <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ deno }'">삭제하기</button>
                    </td>
                </tr>
            </table>
            <!-- 댓글 등록 부분 => ajax에서 기능 구현 boardDeatilView.jsp에 있음 참고할것-->
            <div class="reply">
                <table class="replyTable">
                    <tr>
                        <td>댓글작성</td><br>
                        <td colspan="3"><textarea cols="75" rows="3" id="rContent"></textarea>
                            <button type="button" class="btn btn-secondary btn-sm rbtn">등록</button>
                        </td>
                    </tr>
                </table>
                <!-- 댓글 작성 후 보이는 테이블-->
                <br>
                <table class="replyTable1">
                        <thead class="the">
                            <tr>
                                <td><b>이후석</b>&nbsp;&nbsp;&nbsp;<span>2020-02-12 : 대박이다 여기에 댓글이?</span></td>
                                <td class="imgg"><img class="imgsa" src="image/city1.PNG"></td>
                            </tr>
                        </thead>
                    </table>
            </div>
        </div>
    </div>

</body>

</html>