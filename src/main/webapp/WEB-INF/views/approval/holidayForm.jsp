<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.name {
	font-weight: bold;
	color: rgb(51, 51, 51);
	font-size: 15px;
}

.dept {
	font-size: 13px;
	color: rgb(51, 51, 51);
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
.user{
        	display:none;
        }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	    <div class="section"><br>
        <jsp:include page="../common/approvalmenu.jsp"/>
	<div class="section2">
		<div class="content1">
			<div id="buttongroup">
				<button class="btn1">
					<img class="icon1" src="resources/images/approval/edit.png">결재요청
				</button>
				<button class="btn1">
					<img class="icon1" src="resources/images/approval/save.png">임시저장
				</button>
				<button class="btn1">
					<img class="icon1" src="resources/images/approval/close.png">취소
				</button>
				<button class="btn1" data-toggle="modal"
					data-target="#exampleModal2" onclick="openAddr();">
					<img class="icon1" src="resources/images/approval/people.png">결재선
				</button>
			</div>
			<span
				style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
				<table
					style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
					<!-- Header -->
					<colgroup>
						<col width="310">
						<col width="490">
					</colgroup>
					<tbody>
						<tr>
							<td
								style="background: white; padding: 0px !important; border: 0px currentColor; height: 90px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;"
								colspan="2"
								class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

								휴가원</td>
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
												<span unselectable="on" contenteditable="false"
												class="comp_wrap" data-cid="11"
												data-dsl="{{label:draftUser}}" data-wrapper=""
												style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												data-value="" data-autotype=""><span
													class="comp_item"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안자</span><span
													contenteditable="false" class="comp_active"
													style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
														<span class="Active_dot1"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
														class="Active_dot2"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
														<span class="Active_dot3"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
														class="Active_dot4"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
												</span> <span contenteditable="false" class="comp_hover"
													data-content-protect-cover="true" data-origin="11"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
														<a contenteditable="false"
														class="ic_prototype ic_prototype_trash"
														data-content-protect-cover="true"
														data-component-delete-button="true"></a>
												</span> </span><br>
											</td>
										</tr>
										<tr>
											<td
												style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

												기안부서</td>
											<td
												style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span unselectable="on" contenteditable="false"
												class="comp_wrap" data-cid="12"
												data-dsl="{{label:draftDept}}" data-wrapper=""
												style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												data-value="" data-autotype=""><span
													class="comp_item"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안부서</span><span
													contenteditable="false" class="comp_active"
													style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
														<span class="Active_dot1"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
														class="Active_dot2"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
														<span class="Active_dot3"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
														class="Active_dot4"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
												</span> <span contenteditable="false" class="comp_hover"
													data-content-protect-cover="true" data-origin="12"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
														<a contenteditable="false"
														class="ic_prototype ic_prototype_trash"
														data-content-protect-cover="true"
														data-component-delete-button="true"></a>
												</span> </span><br>
											</td>
										</tr>
										<tr>
											<td
												style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

												기안일</td>
											<td
												style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span unselectable="on" contenteditable="false"
												class="comp_wrap" data-cid="13"
												data-dsl="{{label:draftDate}}" data-wrapper=""
												style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												data-value="" data-autotype=""><span
													class="comp_item"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안일</span><span
													contenteditable="false" class="comp_active"
													style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
														<span class="Active_dot1"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
														class="Active_dot2"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
														<span class="Active_dot3"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
														class="Active_dot4"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
												</span> <span contenteditable="false" class="comp_hover"
													data-content-protect-cover="true" data-origin="13"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
														<a contenteditable="false"
														class="ic_prototype ic_prototype_trash"
														data-content-protect-cover="true"
														data-component-delete-button="true"></a>
												</span> </span><br>
											</td>
										</tr>
										<tr>
											<td
												style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">

												문서번호</td>
											<td
												style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
												<span unselectable="on" contenteditable="false"
												class="comp_wrap" data-cid="14" data-dsl="{{label:docNo}}"
												data-wrapper=""
												style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
												data-value="" data-autotype=""><span
													class="comp_item"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">문서번호</span><span
													contenteditable="false" class="comp_active"
													style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
														<span class="Active_dot1"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
														class="Active_dot2"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
														<span class="Active_dot3"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
														class="Active_dot4"
														style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
												</span> <span contenteditable="false" class="comp_hover"
													data-content-protect-cover="true" data-origin="14"
													style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
														<a contenteditable="false"
														class="ic_prototype ic_prototype_trash"
														data-content-protect-cover="true"
														data-component-delete-button="true"></a>
												</span> </span><br>
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
					style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;">
					<!-- 품의서 -->
					<colgroup>
						<col width="200">
						<col width="350">
						<col width="200">
						<col width="200">
					</colgroup>
					<tbody>
						<tr>
							<td
								style="padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(221, 221, 221);"
								colspan="4"><span
								style="font-weight: bold; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">신청인</span>
							</td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								소속</td>
							<td
								style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
								colspan="3" class="dext_table_border_t"><span
								unselectable="on" contenteditable="false" class="comp_wrap"
								data-cid="4" data-dsl="{{text}}" data-wrapper=""
								style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
								data-value=""><input class="ipt_editor" type="text"><span
									contenteditable="false" class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="4"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br></td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								직책</td>
							<td
								style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
								colspan="3" class="dext_table_border_t"><span
								unselectable="on" contenteditable="false" class="comp_wrap"
								data-cid="5" data-dsl="{{text}}" data-wrapper=""
								style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
								data-value=""><input class="ipt_editor" type="text"><span
									contenteditable="false" class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="5"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br></td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								성명</td>
							<td
								style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
								colspan="3" class="dext_table_border_t"><span
								unselectable="on" contenteditable="false" class="comp_wrap"
								data-cid="6" data-dsl="{{text}}" data-wrapper=""
								style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
								data-value=""><input class="ipt_editor" type="text"><span
									contenteditable="false" class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="6"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br></td>
						</tr>
						<tr>
							<td
								style="padding: 5px; border: currentColor; height: 20px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"
								colspan="4">
								<p
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;">
									<br>
								</p>
							</td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								휴가종류</td>
							<td
								style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
								colspan="3"><span unselectable="on" contenteditable="false"
								class="comp_wrap" data-cid="7" data-dsl="{{text}}"
								data-wrapper=""
								style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
								data-value=""><input class="ipt_editor" type="text"><span
									contenteditable="false" class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="7"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br></td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								휴가기간</td>
							<td
								style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;">
								<span unselectable="on" contenteditable="false"
								class="comp_wrap" data-cid="8" data-dsl="{{period}}"
								data-wrapper=""
								style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
								data-value=""><input class="ipt_editor ipt_editor_date"
									type="text"> ~ <input
									class="ipt_editor ipt_editor_date" type="text"><span
									contenteditable="false" class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="8"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br>
							</td>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								잔여일</td>
							<td
								style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;">
								<span unselectable="on" contenteditable="false"
								class="comp_wrap" data-cid="10" data-dsl="{{text$width:60$}}"
								data-wrapper=""
								style="width: 60px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
								data-value=""><input class="ipt_editor" type="text"><span
									contenteditable="false" class="comp_active"
									"="" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="10"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span>일
							</td>
						</tr>
						<tr>
							<td
								style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">

								휴가사유</td>
							<td
								style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
								colspan="3" class="dext_table_border_t"><span
								unselectable="on" contenteditable="false" class="comp_wrap"
								data-cid="9" data-dsl="{{text}}" data-wrapper=""
								style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
								data-value=""><input class="ipt_editor" type="text"><span
									contenteditable="false" class="comp_active"
									style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot2"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
										class="Active_dot4"
										style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
								</span> <span contenteditable="false" class="comp_hover"
									data-content-protect-cover="true" data-origin="9"
									style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false"
										class="ic_prototype ic_prototype_trash"
										data-content-protect-cover="true"
										data-component-delete-button="true"></a>
								</span> </span><br></td>
						</tr>
						<tr>
							<td
								style="border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; height: 100px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"
								colspan="4" class="dext_table_border_t"><span
								style="font-weight: bold; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">휴가기준
									제 13조에 의거 휴가를 신청하오니 허락하여 주시기 바랍니다.</span></td>
						</tr>
					</tbody>
				</table>
			</span>
			<br>
            <input multiple="multiple" type="file" name="uploadFile">
		</div>
		<div class="content2">
			<div id="radiobox">
				<input type="radio" name="info" id="info1" onchange="setDisplay()"
					checked="checked"><label for="info1">결재선</label> <input
					type="radio" name="info" id="info2" onchange="setDisplay()"><label
					for="info2">참조</label>
			</div>
			<div id="approvalinfo">
				
			</div>
			<div id="referenceinfo" style="display: none">
				<div class="peopleinfo">
					<img src="resources/images/common/profile_none.png">
					<div>
						<span class="name">최유빈 대리</span><br> <span class="dept">홍보팀</span><br>
						<span class="status">참조</span><br>
					</div>
				</div>

			</div>
		</div>
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
                window.open('lList.do', '주소록', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
        }
    </script>
</body>

</html>