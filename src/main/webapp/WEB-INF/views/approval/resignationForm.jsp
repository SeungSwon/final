<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	width: 75%;
	height: 100%;
	float: left;
}

.content2 {
	width: 25%;
	height: 100%;
	float: left;
	padding-left:40px;
}

.btn1 {
	border: none;
	background: none;
}

.btn1:hover {
	background: #f1f1f1 	
}

.icon1 {
	width: 25px;
	height: 25px;
	margin-right: 5px;
}

#buttongroup {
	align: left;
	margin: 20px 0px;
}

#radiobox input[type=radio] {
	position: absolute;
	display: none;
}

#radiobox label {
	cursor: pointer;
	color: gray;
	font-weight: bold;
	text-align: center;
	padding: 20px 30px;
}

#radiobox input[type=radio]:checked+label {
	color: #1e87e4;
}

.peopleinfo img {
	width: 60px;
	height: 60px;
	float: left;
	margin-right: 10px;
}

.name1, .name2 {
	font-weight: bold;
	color: rgb(51, 51, 51);
	font-size: 15px;
}


.deptname {
	margin: 0px;
	font-size: 13px;
	color: rgb(117, 117, 117);
}

.status {
	font-size: 13px;
	color: rgb(117, 117, 117);
}


.dropdown-container div {
	margin: 2px 0px 0px 20px;
	font-weight: bold;
	cursor: pointer;
}

#select {
	overflow: auto;
	border: none;
}
.user1, .user2, .dBtn{
	display:none;
}
#menu1{
	color: #1e87e4;
	font-weight:bold;	
}
#notice{
	font-size:13px;	
}
.notice{
	font-weight:bold;
}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	    <div class="section"><br>
        <jsp:include page="../common/approvalmenu.jsp"/>
	<div class="section2">
	<form action="holidayInsert.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="eId" value="${apeople.eId}">
	<input type="hidden" name="aName" value="사직서">
		<div class="content1">
			<div id="buttongroup">
				<button class="btn1" type="submit">
					<img class="icon1" src="resources/images/approval/edit.png">결재요청
				</button>
				<button type="button"class="btn1">
					<img class="icon1" src="resources/images/approval/save.png">임시저장
				</button>
				<button type="button" class="btn1" onclick="location.href='ahome.do'">
					<img class="icon1" src="resources/images/approval/close.png">취소
				</button>
				<button type="button" class="btn1" onclick="openAddr();">
					<img class="icon1" src="resources/images/approval/people.png">결재선
				</button>
			</div>
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

					<span
						style="font-family: &amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<table
							style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
							<!-- Header -->

							<tbody>
								<tr>
									<td
										style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;"
										colspan="2"
										class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">사직서</td>
								</tr>
								<tr>
									<td
										style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">

										<table
											style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
											<!-- User -->
											<colgroup>
												<col width="100">
												<col width="220">
											</colgroup>
											<tbody>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

														기안자</td>
													<td
														style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
														<span class="comp_item"
														style="font-family: &amp; amp; amp; quot; malgun gothic&amp;amp; amp; quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
															${apeople.eName}</span><br>
													</td>
												</tr>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

														기안부서</td>
													<td
														style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
														<span class="comp_item"
														style="font-family: &amp; amp; amp; quot; malgun gothic&amp;amp; amp; quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
															${apeople.dName}</span><br>
													</td>
												</tr>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

														기안일</td>
													<td
														style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
														<span class="comp_item"
														style="font-family: &amp; amp; amp; quot; malgun gothic&amp;amp; amp; quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
															<c:out value="${today}" />
													</span><br>
													</td>
												</tr>
												<tr>
													<td
														style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

														문서번호</td>
													<td
														style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
														<span class="comp_item"
														style="font-family: &amp; amp; amp; quot; malgun gothic&amp;amp; amp; quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><br>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td
										style="background: white; padding: 0px !important; border: currentColor; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
										<!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. -->
									</td>
								</tr>
							</tbody>
						</table>
						<table
							style=" margin-top: 10px; width: 800px; border-collapse: collapse; font-family: malgun gothic, dotum, arial, tahoma;">
							<!-- user -->
							<colgroup>
								<col width="100">
								<col width="80">
								<col width="80">
								<col width="270">
								<col width="140">
								<col width="140">
							</colgroup>

							<tbody>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px"
										colspan="5">
										<input class="ipt_editor" size="80px" type="text" name="rTitle"><br></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										부&nbsp;&nbsp;&nbsp;&nbsp;서</td>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										직&nbsp;&nbsp;&nbsp;&nbsp;위</td>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										성&nbsp;&nbsp;&nbsp;&nbsp;명</td>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										입사일</td>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										퇴사 희망일</td>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										퇴사 후 연락처</td>
								</tr>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px">
										${apeople.dName}<br>
									</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px">
										${apeople.rName}<br>
									</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px">
										${apeople.eName}<br>
									</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px">
										<br>
									</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px">
										<input class="ipt_editor" type="date" name="expectDate"><br>
									</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px">
										<input class="ipt_editor" type="text" name="rPhone"><br>
									</td>
								</tr>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px"
										colspan="6">사직사유 (상세히 기술)</td>
								</tr>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px"
										colspan="6"><textarea rows="5" cols="100" class="ipt_editor" type="text" name="rReason"></textarea><br></td>
								</tr>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px"
										colspan="6">-소속부서 면담 결과-</td>
								</tr>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										면담자</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px"
										colspan="5">
										<input class="ipt_editor ipt_editor_date" type="text" name="interviewee"><br></td>
								</tr>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										면&nbsp;담&nbsp;내&nbsp;용<br>(구체적&nbsp;기술)
									</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px"
										colspan="5"><textarea rows="4" cols="100" class="ipt_editor" type="text" name="interview" ></textarea><br></td>
								</tr>
								<tr>
									<td
										style="border-bottom: black 1px solid; text-align: center; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(221, 221, 221); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold; border-right: black 1px solid; padding-top: 5px">

										업무인수자</td>
									<td
										style="border-bottom: black 1px solid; text-align: left; border-left: black 1px solid; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: normal; border-right: black 1px solid; padding-top: 5px"
										colspan="5"><input class="ipt_editor ipt_editor_date" type="text" name="consignee"><br></td>
								</tr>
								<tr>
									<td
										style="text-align: center; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; border-top: black 1px solid; font-weight: bold;"
										colspan="6"><br>상기와 같이 사직코자 하오니 수리하여 주시기 바랍니다. <br>
									</td>
								</tr>
								<tr>
									<td
										style="text-align: left; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; background: rgb(255, 255, 255); height: 18px; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; font-weight: bold; padding-top: 5px"
										colspan="6">■ 참&nbsp;&nbsp;&nbsp;고<br>업무인수인계서 및
										대여피복, 회사비품 미반납 및 정리사항 미 확인시 퇴직정산이 지연됩니다.
									</td>
								</tr>
							</tbody>
						</table>
					</span> <br>
            <input multiple="multiple" type="file" name="uploadFile">
		</div>
		<div class="content2">
			<div id="radiobox">
				<input type="radio" name="info" id="info1" onchange="setDisplay()" checked="checked"><label for="info1">결재선</label> 
				<input type="radio" name="info" id="info2" onchange="setDisplay()"><label for="info2">참조</label>
			</div>
			<div id="approvalinfo"></div>
			<div id="referenceinfo" style="display: none"></div>
		</div>
        </form>
	</div>
</div>
	<script>
        function setDisplay() {
            if ($('input:radio[id=info1]').is(':checked')) {
                $('#approvalinfo').show();
                $('#referenceinfo').hide();
            } else {
                $('#referenceinfo').show();
                $('#approvalinfo').hide();
            }
        }
        
        function openAddr(){
            	var popupWidth = 900;
                var popupHeight = 600;
                var popupX = (window.screen.width / 2) - (popupWidth / 2);
                var popupY = (window.screen.height / 2) - (popupHeight / 2);
                // window.open('addr.html','window_name','width=850,height=600,location=no,status=no,scrollbars=yes');
                window.open('lList.do', '조직도', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
        }
    </script>
</body>

</html>