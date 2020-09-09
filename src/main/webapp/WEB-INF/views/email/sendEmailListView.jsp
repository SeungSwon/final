<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>

<style>
.fa-caret-down {
	float: right;
	padding-right: 8px;
}

#mainContent {
	text-align: center;
	width: 968Fpx;
	margin: 0px 2%;
}

#test {
	margin: 20px 2%;
	padding: 0px 0px;
}

#mContent {
	width: 550px;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

td {
	font-size: 12px;
}

th {
	font-size: 14px;
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
#email3 {
	color: #1e87e4;
	font-weight: bold;
}
#cp{
	text-decoration: none;
    color: black;
}
</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="section"><br>
		<jsp:include page="../common/emailMenubar.jsp" />
		<div class="section2">
            <div id="test" align="right">
                <p class="title">보낸 메일함</p>
                <input type="text" placeholder="제목, 내용, 보낸사람">
                <button type="button" class="btn btn-secondary btn-sm">검색</button>
                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#deleteMail" data-whatever="@mdo">선택삭제</button>
            </div>
            <div id="mainContent">
                <div id="messageList">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th>받는 사람</th>
                            <th id="mContentHead">제목</th>
                            <th scope="col">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                   		<%-- <c:set var="test" value="0"/> --%>
                        <c:forEach var="e" items="${ list }">
                        		<%-- <c:if test="${ test != e.mId }">
                        		<c:set var="test" value="${ e.mId }"/> --%>
								<tr>
									<td><input class="check" type="checkbox"></td>
									<td>
										<button class="dropdown-toggle" type="button"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											${ e.dName } ${ e.eName }&lt;${ e.reId }@ourwork.com&gt;
										</button>
										<c:url var="sEmailWithId" value="sendEmailGoId.do">
											<c:param name="eId" value="${ e.reId }@ourwork.com"/>
										</c:url>
										
										<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
											<a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
										</div>
										</td>
										<c:url var="sendEmailDetailView" value="sendEmailDetailView.do">
											<c:param name="mId" value="${ e.mId }"/>
										</c:url>
									<td id="mContent"><a href="${ sendEmailDetailView }" id="cp">${ e.mTitle }</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ e.sendDate }"/></td>
								</tr>
								<%-- </c:if> --%>
							</c:forEach>
                    </tbody>
                  </table>
                </div>
                <hr>
                <div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#">&lt;&lt;</a>
						
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							&lt; &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="sendMailList.do">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a class="arrow prev" href="${ before }">&lt;</a>
						</c:if>
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<a href="#" class="active">[${ p }]</a>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="sendMailList.do">
									<c:param name="page" value="${ p }"/>
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<!-- <a href="#" class="active">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a> -->
						<!-- <a class="arrow next" href="#">&gt;</a> -->
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&gt;
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="sendMailList.do">
								<c:param name="page" value="${ pi.currentPage + 1 }"/>
							</c:url>
							<a class="arrow next" href="${ after }">&gt;</a>
						</c:if>
						<a class="arrow nnext" href="#">&gt;&gt;</a>
					</div>
				</div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="deleteMail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">메일 삭제</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <h3>정말 삭제하시겠습니까?</h3>
                </div>
                <div class="modal-footer" align="center">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" data-toggle="modal" data-target="#successDelete" data-whatever="@mdo">삭제</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="successDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">메일 삭제</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <h5>삭제가 완료되었습니다.</h5>
                </div>
                <div class="modal-footer" align="center">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>