<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>받는 사람 선택</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
	
    <style>
        body{
            width: 500px;
            height: 700px;
        }
        .selectReceiver{
            width: 90%;
            height: 90%;
            margin: auto;
            margin-top: 35px;
            margin-left: 35px;
        }
        div{
            /* border: 1px solid black; */
            margin: auto;
        }
        .select{
            width: 90%;
            height: 10%;
        }
        .address{
            width: 80%;
            height: 69%;
            border: 1px solid black;
        }
        
        /*----------------------*/
        .page_wrap {
            text-align:center;
            font-size:0;
            width: 80%;
            height: 10%;
            
        }

        .page_nation {
            display:inline-block;
            margin-top: 30px;
        }

        .page_nation .none {
            display:none;
        }

        .page_nation a {
            display:block;
            margin:0 3px;
            float:left;
            border:1px solid #e6e6e6;
            width:28px;
            height:28px;
            line-height:28px;
            text-align:center;
            background-color:#fff;
            font-size:13px;
            color:#999999;
            text-decoration:none;
        }

        /* pagination */
        .page_nation .arrow {
            border:1px solid #ccc;
        }
        
        .page_nation a.active {
            background-color:#42454c;
            color:#fff;
            border:1px solid #42454c;
        }
        .buttons{
           
        }
        #submit{
            font-weight: bold;
        }
        input[type=text]{
            margin-top: 15px;
        }
        table{
            text-align: center;
            width: 100%;
        }
        th, td{
            border: 1px solid gray;
        }
    </style>

</head>

<body>
    <div class="selectReceiver" align="center">
        <div class="select">
        	<form action="ntRcvSearch.do" name="searchForm" method="get">
            	<input type="text" size="37" placeholder="이름으로 검색하세요" name="searchValue" value="${ search.searchValue }">
            	<button class="btn btn-secondary btn-sm" id="search">검색</button>
            </form>
        </div>
        <div class="address">
	        <table>
	            <tr>
	                <th colspan="2">주소록</th>
	            </tr>
		       	<c:forEach var="m" items="${ list }">	
					<tr>
						<td>${ m.eName } ${ m.rName }, ${ m.dName }</td>
						<c:set var="eId" value="${ m.eId }"/>
						
						<td><a type="button" id="searchBtn" class="btn btn-secondary btn-sm" href="javascript:sendReceiver('${ m.eId }')">선택</a></td>			                    
					</tr>
				</c:forEach>
			</table>
        </div>
        <div class="page_wrap">
                <div class="page_nation">
                	<!-- << 버튼 눌렀을 때 1페이지로 이동 -->
                	<c:url var="first" value="ntreceiverView.do">
                		<c:param name="page" value="${ 1 }"/>
                	</c:url>
                	<a class="arrow pprev" href="${ first }">&lt;&lt;</a>
                	
                	<!-- 이전 -->
                	<c:if test="${ pi.currentPage <= 1 }">
                		<a class="arrow prev">&lt;</a>
                	</c:if>
                	<c:if test="${ pi.currentPage > 1 }">
                		<c:url var="before" value="ntreceiverView.do">
                			<c:param name="page" value="${ pi.currentPage - 1 }"/>
                		</c:url>
                	    <a class="arrow prev" href="${ before }">&lt;</a>
                	</c:if>
                    
                    <!-- 페이지 숫자 표시 -->
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:if test="${ p eq pi.currentPage }">
                    		<a href="${ pagination }">${ p }</a>
                    	</c:if>
                    	<c:if test="${ p ne pi.currentPage }">
                    		<c:url var="pagination" value="ntreceiverView.do">
                    			<c:param name="page" value="${ p }"/>
                    		</c:url>
                    		<a href="${ pagination }">${ p }</a>
                    	</c:if>
                    </c:forEach>      
                    
                    <!-- 다음 -->
                    <c:if test="${ pi.currentPage >= pi.maxPage }">
                    	<a class="arrow next">&gt;</a>
                    </c:if>
                    <c:if test="${ pi.currentPage < pi.maxPage }">
                    	<c:url var="after" value="clist.do">
                    		<c:param name="page" value="${ pi.currentPage + 1 }"/>
                    	</c:url>
                    	<a class="arrow next" href="${ after }">&gt;</a>
                    </c:if>
                    
                    <!-- 마지막 페이지로 -->
                    <c:url var="last" value="ntreceiverView.do">
                    	<c:param name="page" value="${ pi.maxPage }"/>
                    </c:url>
                    <a class="arrow nnext" href="${ last }">&gt;&gt;</a>
                </div>
            </div>
        <div class="buttons">
            
            <button type="button" class="btn btn-secondary btn-sm" id="cancel" onclick="window.close();">취소</button>
        </div>
    </div>

    <script>    	
    	
    	function sendReceiver(eId){
			opener.document.getElementById("addReceiver").value = eId;
 	 		self.close();
    	}
    </script>
</body>
</html>