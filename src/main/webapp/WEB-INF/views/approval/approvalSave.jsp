<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<style>
.content1 {
	margin: 20px 2%;
	text-align: right;
}

.content2 {
	width: 96%;
	height: 85%;
	margin: 0px 2%
}

.btn1 {
	border: none;
	background: none;
	float: left;
}

.btn1:hover {
	background: #f1f1f1
}

.icon1 {
	width: 18px;
	height: 18px;
	margin-right: 5px;
}
#menu3{
	color: #1e87e4;
	font-weight:bold;	
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
	<div class="section">
		<br>
		<jsp:include page="../common/approvalmenu.jsp" />
		<div class="section2">
			<div class="content1">
				<p class="title">임시저장함</p>
				<form action="asearch.do" name="searchForm" method="get">
					<input type="text" placeholder="통합검색" name="search" minlegth="2">
					<button type="submit" class="btn btn-secondary btn-sm" >검색</button>
				<button type="button" onclick="adelete();" class="btn btn-secondary btn-sm">선택삭제</button>
				</form>	
			</div>
			<div class="content2">
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th scope="col"><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
							<th scope="col">결재양식</th>
							<th scope="col">제목</th>
							<th scope="col">첨부</th>
							<th scope="col">생성일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="a" items="${list}">
						<tr>
							<td><input class="checkRow" name="RowCheck" type="checkbox" value="${a.aId}"></td>
							<td>${a.aName }</td>
							<td>
							<c:url var="asdetail" value="aSavedetail.do">
								<c:param name="aId" value="${ a.aId }"/>
								<c:param name="aName" value="${a.aName }"/>
			                    <c:param name="page" value="${ pi.currentPage }"/>
			                </c:url>
			                <a href="${asdetail}" style="color:black">${a.aTitle}</a>
			                </td>
			                <c:if test="${a.atNum ne 0 }">
							<td>${a.atNum}</td>
							</c:if>
							<c:if test="${a.atNum eq 0 }">
							<td></td>
							</c:if>
							<td>${a.astartDate }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<table align="center">
					<div class="page_wrap">
						<div class="page_nation">
							<!-- << 버튼 눌렀을 때 1페이지로 이동 -->
							<c:url var="first" value="aSaveList.do">
								<c:param name="page" value="${ 1 }" />
							</c:url>
							<a class="arrow pprev" href="${ first }">&lt;&lt;</a>

							<!-- 이전 -->
							<c:if test="${ pi.currentPage <= 1 }">
								<a class="arrow prev">&lt;</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="aSaveList.do">
									<c:param name="page" value="${ pi.currentPage - 1 }" />
								</c:url>
								<a class="arrow prev" href="${ before }">&lt;</a>
							</c:if>

							<!-- 페이지 숫자 표시 -->
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<a href="${ pagination }">${ p }</a>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="aSaveList.do">
										<c:param name="page" value="${ p }" />
									</c:url>
									<a href="${ pagination }">${ p }</a>
								</c:if>
							</c:forEach>

							<!-- 다음 -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a class="arrow next">&gt;</a>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="aSaveList.do">
									<c:param name="page" value="${ pi.currentPage + 1 }" />
								</c:url>
								<a class="arrow next" href="${ after }">&gt;</a>
							</c:if>

							<!-- 마지막 페이지로 -->
							<c:url var="last" value="aSaveList.do">
								<c:param name="page" value="${ pi.maxPage }" />
							</c:url>
							<a class="arrow nnext" href="${ last }">&gt;&gt;</a>
						</div>
					</div>
				</table>
			</div>
		</div>
	</div>

	<script>
	 function allChk(obj){
	      var chkObj = document.getElementsByName("RowCheck");
	      var rowCnt = chkObj.length - 1;
	      var check = obj.checked;
	      if (check) {﻿
	          for (var i=0; i<=rowCnt; i++){
	           if(chkObj[i].type == "checkbox")
	               chkObj[i].checked = true;
	          }
	      } else {
	          for (var i=0; i<=rowCnt; i++) {
	           if(chkObj[i].type == "checkbox"){
	               chkObj[i].checked = false;
	           }
	          }
	      }
	  } 
	 
	function adelete(){
		var check ="";
	    $(".checkRow:checked").each(function(){
	    	check = check + $(this).val() + ",";
	    });
	    check = check.substring(0, check.lastIndexOf(","));
	    console.log("check : " + check);
	    
	    if(check == ""){
	    	alert("삭제할 결재문서를 선택해주세요");
	    	return false;
	    }else{
	    	confirm("선택한 결재문서를 삭제하시겠습니까?");
	    	location.href = "aSaveDelete.do?check="+ check;
		}
			alert("선택된 결재문서가 삭제되었습니다");
		}
	</script>
</body>
</html>