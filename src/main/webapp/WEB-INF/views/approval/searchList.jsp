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
        /*--------------------------------------main--------------------------------------------*/
        .content1{
            margin: 20px 2%;
            text-align: right; 
        }

        .content2{
            width: 96%;
            height: 80%;
            margin: 0 2%    
        }

         #count{
            float: left;
            margin : 5px 15px;
        }

        #searchbox{
            margin: 0 2% 20px;
            height: 40px;
            background: rgba(230, 227, 227, 0.253);
            font-weight: bold;
            color: gray;
            padding: 7px;
        }
        /* 페이지!!!!!!!!!!!!!!!! */
.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}
    </style>
</head>

<body>
    <jsp:include page="../common/menubar.jsp" />
    <div class="section"><br>
        <br>
		<jsp:include page="../common/approvalmenu.jsp" />
        <div class="section2">
            <div class="content1">
                <p class="title">검색결과</p><span id="count">총 ${listCount}건</span>
                <form action="asearch.do" name="searchForm" method="get">
					<input type="text" placeholder="통합검색" name="search">
					<button type="submit" class="btn btn-secondary btn-sm" >검색</button>
				</form>		
            </div>
            <div id="searchbox">
                <p>검색어 : ${search} </p>
            </div>
            <div class="content2" id="all">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>기안일</th>
                            <th>결제양식</th>
                            <th>제목</th>
                            <th>기안자</th>
                            <th>기안부서</th>
                            <th>첨부</th>
                            <th>완료일</th>
                            <th>결재상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="a" items="${searchList}">
                        <tr>
                            <td>${a.astartDate }</td>
                            <td>${a.aName }</td>
                            <td>${a.aTitle }</td>
                            <td>${a.eName }</td>
                            <td>${a.dName }</td>
                            <td></td>
                            <td>${a.aendDate}</td>
                        <c:if test="${a.aStatus eq 'I' }">
							<td style="color: green;">진행중</td>
						</c:if>
						<c:if test="${a.aStatus eq 'Y' }">
							<td style="color: black;">완료</td>
						</c:if>
						<c:if test="${a.aStatus eq 'N' }">
							<td style="color: red;">반려</td>
						</c:if>
						<c:if test="${a.aStatus eq 'S' }">
							<td style="color: gray;">임시저장</td>
						</c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                	  <div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#">&lt;&lt;</a>
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="asearch.do">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="search" value="${ search }"/>
							</c:url>
							<a class="arrow prev" href="${ before }">&lt;</a>
						</c:if>
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<a href="#" class="active">[${ p }]</a>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="asearch.do">
									<c:param name="page" value="${ p }"/>
									<c:param name="search" value="${ search }"/>
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&gt;
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="asearch.do">
								<c:param name="page" value="${ pi.currentPage + 1 }"/>
								<c:param name="search" value="${ search }"/>
							</c:url>
							<a class="arrow next" href="${ after }">&gt;</a>
						</c:if>
						<a class="arrow nnext" href="#">&gt;&gt;</a>
					</div>
				</div>
            </div>
        </div>
    </div>
    </body>
</html>