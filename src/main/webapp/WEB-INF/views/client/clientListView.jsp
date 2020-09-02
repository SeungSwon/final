<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
        #selectedMenu{
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
            font-weight: bold;  
            color:#1e87e4;
        }

        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }

        /* pagination */
        .page_wrap {
            text-align:center;
            font-size:0;
        }
        .page_nation {
            display:inline-block;
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
        .page_nation .arrow {
            border:1px solid #ccc;
        }
        .page_nation .pprev {
            background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
            margin-left:0;
        }
        .page_nation .prev {
            background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
            margin-right:7px;
        }
        .page_nation .next {
            background:#f8f8f8 url('img/page_next.png') no-repeat center center;
            margin-left:7px;
        }
        .page_nation .nnext {
            background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
            margin-right:0;
        }
        .page_nation a.active {
            background-color:#42454c;
            color:#fff;
            border:1px solid #42454c;
        }
        
        #mContent{
            display: inline-block;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        td{
            font-size: 12px;
        }
        th{
            font-size: 14px;
        }
        
        /* .searchClient{
            background-image: url("/Users/yunz/KH/final project/Front/img/search.png");
            background-repeat: no-repeat;
            background-position: right 3px;
        } */
        select{
            height: 30px;
            font-size: 10px;
        }
        #excel{
            width: 25px;
            height: 25px;
        }
        
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            float: left;
            margin-top: 20px;
            margin-left: -20px;
        }
        .condition{
            margin: 20px 2%;
            padding: 0px 0px;
        }
        .toExcel{
            margin: 20px 2%;
        }
        #clientTable{
        	margin-top: 20px;
        	text-align:center;
        }
        #toDetail{
        	color: black;
        }
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="src/jquery.table2excel.js"></script>
</head>

<body>
    <c:import url="../common/menubar.jsp"/>
    <div class="section"><br>
        <div class="aside">
            <button><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button onclick="location.href='calview.do'"><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <button><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button id="selectedMenu"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
            <button><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
            <button><img class="icons" src="resources/images/common/texting.png"><br>SNS</button>
        </div>
        <div class="section1">
            <div class="menubar">
                <button>주소록 조회</button>
                <button id="selected" onclick="location.href='clist.do'">거래처 조회</button>
                <button id="insertClient" onclick="location.href='cinsertView.do'">거래처 등록</button>
            </div>
        </div>
        <div class="section2">
            <div class="condition" align="right">
                <p class="title">거래처 목록</p>
                <form action="csearch.do" name="searchForm" method="get">
	                <select id="searchCondition" name="searchCondition">
	                    <option>------</option>
	                    <option value="name" <c:if test="${ search.searchCondition eq 'name' }">selected</c:if>>거래처명</option>
	                    <option value="num" <c:if test="${ search.searchCondition eq 'num' }">selected</c:if>>사업자번호/주민등록번호</option>
	                </select>
	                <input type="text" class="searchClient" name="searchValue" value="${ search.searchValue }">
	                <button type="button" class="btn btn-secondary btn-sm" id="searchBtn">검색</button>
                	<button type="button" class="btn btn-secondary btn-sm" id="insertBtn" onclick="location.href='cinsertView.do'">등록</button>
            	</form>
            </div>
            <div class="mainContent">
                <table class="table table-hover table2excel" id="clientTable">
                    <thead>
                        <tr>
                            <th>구분</th>
                            <th width="200">거래처명</th>
                            <th>사업자번호/주민등록번호</th>
                            <th>전화번호</th>
                            <th>업태</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="c" items="${ list }">
                        <tr>
                            <td>
                            <c:if test="${ c.cSort == 1 }">
                            	법인
                            </c:if>
                            <c:if test="${ c.cSort == 2 }">
                            	개인
                            </c:if>
                            </td>
                            <td>
	                            <c:url var="cdetail" value="cdetail.do">
	                            	<c:param name="clId" value="${ c.clId }"/>
	                            	<c:param name="page" value="${ pi.currentPage }"/>
	                            </c:url>
	                            <a href="${ cdetail }" id="toDetail">${ c.cName }</a>
                            </td>
                            <td>${ c.bNum }</td>
                            <td>${ c.cPhone }</td>
                            <td>${ c.business }</td>
                            <td>${ c.createDate }</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
            </div>
            <div class="page_wrap">
                <div class="page_nation">
                	<!-- << 버튼 눌렀을 때 1페이지로 이동 -->
                	<c:url var="first" value="clist.do">
                		<c:param name="page" value="${ 1 }"/>
                	</c:url>
                	<a class="arrow pprev" href="${ first }">&lt;&lt;</a>
                	
                	<!-- 이전 -->
                	<c:if test="${ pi.currentPage <= 1 }">
                		<a class="arrow prev">&lt;</a>
                	</c:if>
                	<c:if test="${ pi.currentPage > 1 }">
                		<c:url var="before" value="clist.do">
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
                    		<c:url var="pagination" value="clist.do">
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
                    <c:url var="last" value="clist.do">
                    	<c:param name="page" value="${ pi.maxPage }"/>
                    </c:url>
                    <a class="arrow nnext" href="${ last }">&gt;&gt;</a>
                </div>
            </div>
            <div class="toExcel" align="right"><button type="button" class="btn btn-secondary btn-sm" id="getExcel">엑셀로 내보내기</button></div>
        </div>
    </div>
</body>
<script>
	$("#getExcel").click(function (e) {
	    window.open('data:application/vnd.ms-excel,' + $('.mainContent').html());
	    e.preventDefault();
	});



</script>

</html>

























