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
       
       .sec{
       	margin-top: 90px;
       }

        #selectedMenu{
            background: #1e87e4;  
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }

        /* 메뉴바 */
        /* 여기 a 태그*/
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

        .approval, .schedule, .notice, .board{
            width: 48%;
            height: 48%;
            margin: 6px;
            box-sizing: border-box;
            display: inline-block;
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
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            float: left;
        }

        /* 페이징바 */
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

        .btn-secondary{
            background: white;
            color:black;
            height: 30px;
            font-size: 14px;
            
        }
        .la1{
            text-align: left;
        }
        .select{
            width: 50%;
            display:block;
            float: left;
            height: 34px;
        }
        .sel{
            text-align: right;
        }
        .btt{
            display: none;
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
                    <button onclick="location.href='pteam.do'">휴가 관리</button>
                    <button>결재 조회</button>
                    <button id="selected" onclick="location.href='employeeE.do'">사원 관리</button>
                    <button onclick="window.open('address.html','window_name','width=600,height=500,location=no,status=no,scrollbars=yes');">부서
                        관리</button>
                    <button>증명서 관리</button>
                    <button>근퇴 관리</button>
                </div>
            </div>
        </div>
        <div id="high1" class="section2 sec">
            <div id="test">
                <div  class="select">
                <label class="btn btn-secondary la1">
                    <input type="radio" name="tap" id="high" class="btt" onchange="setDisplay()" checked>재직사원
                </label>
                <label class="btn btn-secondary la1">
                    <input type="radio" name="tap" class="btt" onchange="setDisplay()" id="University">퇴사사원
                </label>
                </div>
                <div class="select sel">
                <form action="esearch1.do" name="searchForm" method="get">
	                <input type="hidden" name="page" value="${ pi.currentPage }"/>
	                <select id="searchCondition" name="searchCondition">
                    <option value="eName"
						<c:if test="${search.searchCondition == 'eName' }">selected
						</c:if>>이름</option>
                    <option value="dName"
					<c:if test="${search.searchCondition == 'dName'}">selected
						</c:if>>부서</option>
					<option value="rName"
						<c:if test="${search.searchCondition == 'rName'}">selected
					</c:if>>직급</option>
                </select>
                    <input type="search" name="searchValue" value="${ search.searchValue }">
                	<button type="submit" class="btn btn-secondary btn-sm">검색</button>
                	<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#staticBackdrop">신입사원 승인</button>
                </form>
                </div>
            </div>
            <div>
                <div>
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th></th>
                                <th>직급</th>
                                <th>부서</th>
                                <th>이름</th>
                                <th scope="col">입사날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                      	<c:forEach var="ey" items="${ Ylist }">
                            <tr>
                                <td></td>
                                <td>
                                	${ ey.rName }
                                </td>
                                <td>${ ey.dName }</td>
                                <td id="mContent">
                                	<c:url var="detail" value="edetail.do">
	                                	<c:param name="eId" value="${ ey.eId }"/>
	                                	<c:param name="page" value="${ pi.currentPage }"/>
                                	</c:url>
                                	<a href="${ detail} ">${ ey.eName }</a>
                                </td>
                                <td>${ ey.join_date }</td>
                            </tr>
                         </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- 페이징 처리! -->
                <div class="page_wrap">
                        <div class="page_nation">
                            <c:if test="${ pi.currentPage <= 1 }">
                            	<a class="arrow prev"><</a>
                            </c:if>
                            <c:if test="${ pi.currentPage > 1 }">
                            	<c:url var="before" value="employeeE.do">
                            		<c:param name="page" value="${ pi.currentPage -1 }"/>
                            	</c:url>
                            	<a class="arrow prev" href="${ before }"><</a>
                            </c:if>
                            
                            <!-- 페이징 숫자 -->
                            <c:forEach var="p" begin="${ pi.startPage }"  end="${ pi.endPage }">
                            	<c:if test="${ p eq pi.currentPage }">
                            		<a class="active">${ p }</a>
                            	</c:if>
                            	<c:if test="${ p ne pi.currentPage }">
                            		<c:url var="pagination" value="employeeE.do">
                            			<c:param name="page" value="${ p }"/>
                            		</c:url>
                            		<a href="${ pagination }" class="active">${ p }</a>
                            	</c:if>
                            </c:forEach>
                            
                            <c:if test="${ pi.currentPage >= pi.maxPage }">
                            	<a class="arrow next">></a>
                            </c:if>
                            <c:if test="${ pi.currentPage < pi.maxPage }">
                            	<c:url var="after" value="employeeE.do">
                            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
                            	</c:url>
                            	<a class="arrow next" href="${ after }">></a>
                            </c:if>
                        </div>
                   </div>
            </div>
        </div>
        
        
        
        <!-- 여기부터 퇴사사원입니다1!!!!!!!!!!!!!!!!!!!!!!!! -->
        <div id="University1" class="section2 sec">
            <div id="test">
                <div  class="select">
                <label class="btn btn-secondary la1">
                    <input type="radio" name="tap" id="high" class="btt" onchange="setDisplay()" checked>재직사원
                </label>
                <label class="btn btn-secondary la1">
                    <input type="radio" name="tap" class="btt" onchange="setDisplay()" id="University">퇴사사원
                </label>
                </div>
                <div class="select sel">
                <form action="esearch2.do" name="searchForm" method="get">
	                <select id="searchCondition" name="searchCondition">
                    <option value="eName"
						<c:if test="${search2.searchCondition == 'eName' }">selected
						</c:if>>이름</option>
                    <option value="dName"
					<c:if test="${search2.searchCondition == 'dName'}">selected
						</c:if>>부서</option>
					<option value="rName"
						<c:if test="${search2.searchCondition == 'rName'}">selected
					</c:if>>직급</option>
                </select>
                    <input type="search" name="searchValue" value="${ search2.searchValue }">
                	<button type="submit" class="btn btn-secondary btn-sm">검색</button>
                	<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#staticBackdrop">신입사원 승인</button>
                </form>
                </div>
            </div>
            
            <div>
                 <div>
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th></th>
                                <th>직급</th>
                                <th>부서</th>
                                <th>이름</th>
                                <th scope="col">입사날짜</th>
                                <th>이메일</th>
                            </tr>
                        </thead>
                        <tbody>
                      	<c:forEach var="en" items="${ Nlist }">
                            <tr>
                                <td></td>
                                <td>
                                	${ en.rName }
                                </td>
                                <td>${ en.dName }</td>
                                <td id="mContent">
                                	${ en.eName }
                                </td>
                                <td>${ en.join_date }</td>
                            </tr>
                         </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- 페이징 처리! -->
                <div class="page_wrap">
                        <div class="page_nation">
                            <c:if test="${ pin.currentPage <= 1 }">
                            	<a class="arrow prev"><</a>
                            </c:if>
                            <c:if test="${ pin.currentPage > 1 }">
                            	<c:url var="before" value="employeeE.do">
                            		<c:param name="pagen" value="${ pin.currentPage -1 }"/>
                            	</c:url>
                            	<a class="arrow prev" href="${ before }"><</a>
                            </c:if>
                            
                            <!-- 페이징 숫자 -->
                            <c:forEach var="p" begin="${ pin.startPage }"  end="${ pin.endPage }">
                            	<c:if test="${ p eq pin.currentPage }">
                            		<a class="active">${ p }</a>
                            	</c:if>
                            	<c:if test="${ p ne pin.currentPage }">
                            		<c:url var="pagination" value="employeeE.do">
                            			<c:param name="pagen" value="${ p }"/>
                            		</c:url>
                            		<a href="${ pagination }" class="active">${ p }</a>
                            	</c:if>
                            </c:forEach>
                            
                            <c:if test="${ pin.currentPage >= pin.maxPage }">
                            	<a class="arrow next">></a>
                            </c:if>
                            <c:if test="${ pin.currentPage < pin.maxPage }">
                            	<c:url var="after" value="employeeE.do">
                            		<c:param name="pagen" value="${ pin.currentPage + 1 }"/>
                            	</c:url>
                            	<a class="arrow next" href="${ after }">></a>
                            </c:if>
                        </div>
                   </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">신입사원 승인</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th>no</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>버튼</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>3</td>
                                    <td>dlgnt96@naver.com</td>
                                    <td>이후석</td>
                                    <td><button type="button" class="btn btn-secondary btn-sm">승인</button></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>dbsql@naver.com</td>
                                    <td>김윤지</td>
                                    <td><button type="button" class="btn btn-secondary btn-sm">승인</button></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>tmddnjs@naver.com</td>
                                    <td>송승원</td>
                                    <td><button type="button" class="btn btn-secondary btn-sm">승인</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <script>
        $(function(){
            $('#University1').hide();
        });


       function setDisplay() {
            if ($('input:radio[id=high]').is(':checked')) {
                $('#high1').show();
                $('#University1').hide();
            }else if ($('input:radio[id=University]').is(':checked')) {
                $('#high1').hide();
                $('#University1').show();
            }
        }
      </script>

</body>

</html>