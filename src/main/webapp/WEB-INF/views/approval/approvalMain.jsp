<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/*--------------------------------------main--------------------------------------------*/
.content {
	width: 96%;
	height: 45%;
	margin: 2%;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	    <div class="section"><br>
        <jsp:include page="../common/approvalmenu.jsp"/>

        <div class="section2">
            <div class="content">
                <p class="title">결재 대기 문서</p>
                <table class="table">
                    <thead>
                        <tr>
                            <th>기안일</th>
                            <th>결제양식</th>
                            <th>제목</th>
                            <th>기안자</th>
                            <th>기안부서</th>
                            <th>첨부</th>
                        </tr>
                    </thead>
                    <tbody>
                         <tr>
                            <td colspan="6" style="text-align: center">
                                <br>결재할 문서가 없습니다
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <div class="content">
                    <p class="title">기안 진행 문서</p>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>기안일</th>
                                <th>결제양식</th>
                                <th>제목</th>
                                <th>첨부</th>
                                <th>결재상태</th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr>
                                <td>20/08/16</td>
                                <td>지출결의서</td>
                                <td>인사팀 지출결의서</td>
                                <td>1</td>
                                <td style="color: green;">진행중</td>
                            </tr>
                        </tbody>
                    </table>
    
                </div>
            </div>
        </div>
</body>
</html>