<!-- 화면만 -->
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
            color: #1e87e4;
            font-weight: bold;
        }
        
        #selectedMenu{
            background: #1e87e4;  
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
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
      width: 800px;
   }
   .in{
       padding: 0px;
       width: 650px;
       height: 30px;
       margin-bottom: 20px;
   }
   .int{
    padding: 0px;
    margin-bottom: 20px;
    width: 650px;
    height: 250px;
   }
   .division{
       width: 150px;
   }

        
    </style>
</head>

<body>
    <jsp:include page="../common/menubar.jsp" />
    <div class="section"><br>
        <jsp:include page="../common/noticemenu.jsp" />
        <div class="section1">
            <div class="menubar">
                    <div class="menubar">
                        <button id="selected">사내 게시판</button>
                        <button>팀별 게시판</button>
                        <button>팀별 공지사항</button>
                    </div>
            </div>
        </div>
        <div class="section2">
        <form action="updateno.do" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="page" value="${ currentPage }">
        	<input type="hidden" name="nNo" value="${ notice.nNo }">
            <table id="boardTable">
                <tr>
                    <td class="division">제목</td>
                    <td class="in"><input type="text" name="nTitle" size="50" class="in" value="${ notice.nTitle }"></td>
                </tr>
                <tr>
                    <td class="division">작성자</td>
                    <td class="in"><input type="text" readonly name="bWriter" size="50" class="in" value="${ notice.eId }"></td>
                </tr>
                <tr>
                    <td class="division">첨부파일</td>
                    <td class="in">
                    	<c:if test="${ !empty at.originName }">
                            		현재 업로드한 파일명 :
                            		<a>${ at.originName }</a>
                            	</c:if>
                            	<br>
                            	<input type="file" name="reloadFile" id="ex_file">
                    </td>
                </tr>
                <tr>
                    <td class="division">내용</td>
                    <td class="in"><textarea rows="10" cols="85" class="int" name="nContent">${ notice.nContent }</textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit" class="btn btn-secondary btn-sm" id="update">수정</button>
                        
                        <!-- 이거 안된다!! -->
                        <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='history.back();'">취소</button>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
	<script>
		$("#update").click(function(){
			if(confirm("게시판을 수정하시겠습니까?") == false){
				return false;
			}
		});
	</script>
</body>

</html>