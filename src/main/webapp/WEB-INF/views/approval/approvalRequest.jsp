<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="section">
		<br>
		<jsp:include page="../common/approvalmenu.jsp" />
		<div class="section2">
			<div class="content1">
				<p class="title">기안문서함</p>
				<input type="text">
				<button type="button" class="btn btn-secondary btn-sm">검색</button>
			</div>
			<div id="radiobox">
				<input type="radio" name="tab" id="tab1" onchange="setDisplay()"checked="checked"><label for="tab1">전체</label> 
				<input type="radio" name="tab" id="tab2" onchange="setDisplay()"><label for="tab2">진행</label> 
				<input type="radio" name="tab" id="tab3" onchange="setDisplay()"><label for="tab3">완료</label> 
				<input type="radio" name="tab" id="tab4" onchange="setDisplay()"><label for="tab4">반려</label>
			</div>
			<div class="content2" id="all">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일</th>
							<th>결제양식</th>
							<th>제목</th>
							<th>첨부</th>
							<th>완료일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>20/08/16</td>
							<td>지출결의서</td>
							<td>인사팀 지출결의서</td>
							<td>1</td>
							<td></td>
							<td style="color: green;">진행중</td>
						</tr>
						<tr>
							<td>20/08/14</td>
							<td>지출결의서</td>
							<td>인사팀 지출결의서</td>
							<td>1</td>
							<td></td>
							<td style="color: red;">반려</td>
						</tr>
						<tr>
							<td>20/08/14</td>
							<td>지출결의서</td>
							<td>인사팀 지출결의서</td>
							<td>1</td>
							<td>20/08/15</td>
							<td style="color: gray;">완료</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="content2" id="proceed" style="display: none">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일</th>
							<th>결제양식</th>
							<th>제목</th>
							<th>첨부</th>
							<th>완료일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>20/08/16</td>
							<td>지출결의서</td>
							<td>인사팀 지출결의서</td>
							<td>1</td>
							<td></td>
							<td style="color: green;">진행중</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="content2" id="complete" style="display: none">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일</th>
							<th>결제양식</th>
							<th>제목</th>
							<th>첨부</th>
							<th>완료일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>20/08/14</td>
							<td>지출결의서</td>
							<td>인사팀 지출결의서</td>
							<td>1</td>
							<td></td>
							<td style="color: gray;">완료</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="content2" id="companion" style="display: none">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일</th>
							<th>결제양식</th>
							<th>제목</th>
							<th>첨부</th>
							<th>완료일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>20/08/14</td>
							<td>지출결의서</td>
							<td>인사팀 지출결의서</td>
							<td>1</td>
							<td></td>
							<td style="color: red;">반려</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	 <script>
         function setDisplay() {
            if ($('input:radio[id=tab1]').is(':checked')) {
                $('#all').show();
                $('#proceed').hide();
                $('#complete').hide();
                $('#companion').hide();
            }else if ($('input:radio[id=tab2]').is(':checked')) {
                $('#all').hide();
                $('#proceed').show();
                $('#complete').hide();
                $('#companion').hide();
            }else if ($('input:radio[id=tab3]').is(':checked')) {
                $('#all').hide();
                $('#proceed').hide();
                $('#complete').show();
                $('#companion').hide();
            }else{
                $('#all').hide();
                $('#proceed').hide();
                $('#complete').hide();
                $('#companion').show();
            }
        }
    </script>
</body>
</html>