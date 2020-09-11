<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#approval {
	background-color: #1e87e4;
}
.menubar{
	background:white;
	border-top:1px solid black;
	height:950px;
}
.title {
	font-size: 20px;
	color: rgba(78, 78, 78, 0.952);
	font-weight: bold;
	float: left;
}
.menubar>button {
	border: none;
	background: none;
	width: 100%;
	height: 50px;
	margin-top: 20px;
	padding-right: 60px;
}

.menubar button:hover {
	color: #1e87e4;
	font-weight: bold;
}

.dropdown-container>button {
	border: none;
	background: none;
	width: 100%;
	height: 50px;
}

#selectedAmenu{
	background: #1e87e4;
}

/*-----------------modal------------------------*/
.mbody {
	width: 50%;
	float: left;
}

.mbody p {
	color: rgb(153, 153, 153);
	text-align: left;
	font-weight: bold;
	margin-top: 15px;
}

.mlist {
	padding-left: 15px;
}

.mlist input[type=radio] {
	position: absolute;
	display: none;
}

.mlist label {
	cursor: pointer;
	font-weight: bold;
	padding: 5px 20px;
}

.mlist input[type=radio]:checked+label {
	color: #1e87e4;
}

</style>
</head>
<body>
	<div class="aside">

			<button id="selectedEmenu" onclick="location.href='receiveMailList.do'"><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button id ="selectedAmenu" onclick="location.href='ahome.do'"><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <button onclick="location.href='noticeMain.do'"><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button onclick="location.href='ntInboxList.do'"><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button onclick="location.href='eAddress.do'"><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
            <button><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
            <button><img class="icons" src="resources/images/common/texting.png"><br>SNS</button>
	</div>
	<div class="section1">
		<div class="menubar">
			<button class="dropdown-btn" style="font-weight: bold">
				상신함 &nbsp;&nbsp;
				<svg width="1em" height="1em" viewBox="0 0 16 16"
					class="bi bi-caret-down-fill" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
                        <path
						d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                    </svg>
			</button>
			<div class="dropdown-container">
				<button id="menu1" data-toggle="modal" data-target="#exampleModal">기안문작성</button>
				<button id="menu2" onclick="location.href='aRequestList.do'">기안문서함</button>
				<button id="menu3" onclick="location.href='aSaveList.do'">임시저장함</button>
			</div>
			<button class="dropdown-btn" style="font-weight: bold">
				수신함 &nbsp;&nbsp;
				<svg width="1em" height="1em" viewBox="0 0 16 16"
					class="bi bi-caret-down-fill" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
                        <path
						d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                    </svg>
			</button>
			<div class="dropdown-container">
				<button id="menu4" onclick="location.href='aWaitingList.do'">결재대기함</button>
				<button>결재문서함</button>
				<button id="menu6" onclick="location.href='aReftList.do'">참조문서함</button>
				<button>결재예정함</button>
			</div>
			<button class="dropdown-btn" style="font-weight: bold">
				부서함 &nbsp;&nbsp;
				<svg width="1em" height="1em" viewBox="0 0 16 16"
					class="bi bi-caret-down-fill" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
                            <path
						d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                        </svg>
			</button>
			<div class="dropdown-container">
				<button>기안완료함</button>
				<button>부서참조함</button>
			</div>
		</div>
	</div>
	<!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">결재양식 선택</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                    <form action="aFormView.do">
						<input type="hidden" name="eId" value="${loginUser.eId}">             
                        <div class="mbody">
                            <p>인사</p>
                            <div class="mlist">
                                <input type="radio" name="insertform" id="1" value="1"><label for="1">경조금 지금 신청서</label><br>
                                <input type="radio" name="insertform" id="2" value="2"><label for="2">사직서</label><br>
                                <input type="radio" name="insertform" id="3" value="3"><label for="3">시말서</label><br>
                                <input type="radio" name="insertform" id="4" value="4"><label for="4">증명서 발급</label><br>
                            </div>
            
                            <p >휴가</p>
                            <div class="mlist">
                                <input type="radio" name="insertform" id="5" value="5"><label for="5">복직원</label><br>
                                <input type="radio" name="insertform" id="6" value="6"><label for="6">휴직원</label><br>
                                <input type="radio" name="insertform" id="7" value="7"><label for="7">휴가원</label><br>
                            </div>
                        </div>
                        
                        <div class="mbody"> 
                            <p>일반</p>
                            <div class="mlist">
                                <input type="radio" name="insertform" id="8" value="8"><label for="8">기안서</label><br>
                                <input type="radio" name="insertform" id="9" value="9"><label for="9">품의서</label><br>
                                <input type="radio" name="insertform" id="10" value="10"><label for="10">지출 결의서</label><br>
                            </div>
                            <br><br>
                            <p>출장</p>
                            <div class="mlist">
                                <input type="radio" name="insertform" id="11" value="11"><label for="11">출장 신청서</label><br>
                                <input type="radio" name="insertform" id="12"value="12"><label for="12">출장 보고서</label><br>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-secondary" id="enroll">확인</button>
                    </div>
                    </form>
                </div>
                </div>
            </div>
	 <script>
        //* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
        var dropdown = document.getElementsByClassName("dropdown-btn");
        var i;

        for (i = 0; i < dropdown.length; i++) {
            dropdown[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "none") {
                    dropdownContent.style.display = "block";
                } else {
                    dropdownContent.style.display = "none";
                }
            });
        }
        
      </script>
</body>
</html>