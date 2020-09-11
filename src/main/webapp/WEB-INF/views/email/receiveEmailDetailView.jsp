<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<style>
#receiver {
	width: 800px;
	height: 30px;
	resize: none;
	overflow: auto;
}

.content {
	min-height: 400px;
	width: 960px;
}

.rc1:focus {
	outline: 1px solid #68a4ff;
}

.rc2:focus {
	outline: none;
}

#btn-wrapper {
	margin-top: 30px;
	margin-left: 50px;
}

#table-wrapper {
	margin-left: 50px;
	margin-top: 30px;
}

.aside button:first-child {
	background: #1e87e4;
}

p {
	font-size: 12px;
    font-weight: bold;
}

.mgr {
	margin-right: 5px;
}
td > button {
    font-size: 12px;
    margin-bottom: 9px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="section">
		<br>
		<jsp:include page="../common/emailMenubar.jsp" />
		<div class="section2">
                <div id="btn-wrapper" align="left">
                    <button type="button" class="btn btn-secondary btn-sm">답장</button>
                    <button type="button" class="btn btn-secondary btn-sm">전달</button>
                    <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                </div>
				<div id="table-wrapper">
					<table>
						<tr align="left">
							<td style="width: 80px;"><p>보낸사람</p></td>
							<td>
								<button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${ sendId }@ourwork.com</button>
								<c:url var="sEmailWithId" value="sendEmailGoId.do">
									<c:param name="eId" value="${ sendId }@ourwork.com"/>
								</c:url>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
                                </div>
                            </td>
						</tr>
						<tr align="left">
							<td style="width: 80px;"><p>받는사람</p></td>
							<td>
								<c:forEach var="r" items="${ receiver }">
								<button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${ r.eId }@ourwork.com</button>
								<c:url var="sEmailWithId" value="sendEmailGoId.do">
									<c:param name="eId" value="${ r.eId }@ourwork.com"/>
								</c:url>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
                                </div>
                                </c:forEach>
                            </td>
						</tr>
						<tr align="left">
							<td><p>참조</p></td>
							<td>
								<c:forEach var="f" items="${ ref }">
								<button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${ f.eId }@ourwork.com</button>
                                <c:url var="sEmailWithId" value="sendEmailGoId.do">
									<c:param name="eId" value="${ f.eId }@ourwork.com"/>
								</c:url>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
                                </div>
                                </c:forEach>
                            </td>
						</tr>
						<c:forEach var="h" items="${ hide }">
						<c:if test="${ id eq h.eId }">
						<tr align="left">
							<td><p>숨은참조</p></td>
							<td>
								<c:forEach var="d" items="${ hide }">
								<c:if test="${ id eq d.eId }">
								<button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${ d.eId }@ourwork.com</button>
                                <c:url var="sEmailWithId" value="sendEmailGoId.do">
									<c:param name="eId" value="${ d.eId }@ourwork.com"/>
								</c:url>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="${ sEmailWithId }">메일 쓰기</a>
                                </div>
                                </c:if>
                                </c:forEach>
                            </td>
						</tr>
						</c:if>
						</c:forEach>
						<tr>
							<td><p class="ms">제목</p></td>
							<td><span>${ email.mTitle }</span>
						</tr>
						<tr align="left">
							<td><p>파일첨부</p></td>
							<td><span>다운로드 할 파일 목록</span></td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="rc2 content" disabled>${ email.mContent } // ${ email.mId }</textarea></td>
						</tr>
					</table>
				</div>
				
		</div>
	</div>
</body>
</html>