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
}

.content {
	min-height: 400px;
	width: 960px;
	resize: none;
	overflow: auto;
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

#email1 {
	color: #1e87e4;
	font-weight: bold;
}

ul {
	list-style-type: none;
}

#receiverArea1, #receiverArea2, #receiverArea3, #title {
	width: 833px;
	height: 100%;
	position: relative;
}

li div {
	float: left;
}

#addMail {
	background-color: #bde2ff;
}
#failMail {
	background-color: pink;
}

p {
	font-size: 12px;
	font-weight: bold;
}

#dbtn {
	width: 10px;
	height: 10px;
}

#deleteImg {
	background: none;
	border: none;
}

.mgr {
	margin-right: 5px;
}

ul {
	list-style-position: outside;
	padding: 0;
	border-left: solid 2px red;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="section">
		<br>
		<jsp:include page="../common/emailMenubar.jsp" />
		<div class="section2">
			<form method="post" name="form" enctype="multipart/form-data">
				<div id="btn-wrapper" align="left">

					<button type="button" class="btn btn-secondary btn-sm" id="letsgo">보내기</button>
					<button type="submit" class="btn btn-secondary btn-sm" onclick="javascript: form.action='etemp.do'">임시저장</button>
					<button type="button" class="btn btn-secondary btn-sm">취소</button>
				</div>
				<div id="table-wrapper">
					<table>
						<tr align="left">
							<td><p>받는사람</p></td>
							<td style="height: 1px;">
								<div id="receiverArea1"
									style="border: 1px solid rgb(179, 179, 179)" class="rc1">
									<ul id="mailArea">
										<c:if test="${ !empty eId }">
											<li>
												<div id="addMail" class="mgr">
													<span class="Madd" id="fff">${ eId }</span>
													<input type='hidden' name='reId' value="${ eId }">
													<button type="button" class="dBtn" id="deleteImg">
														<img id="dbtn" src="resources/images/common/delete.png">
													</button>
												</div>
											</li>
										</c:if>
										<li id="test1">
											<div>
												<textarea name="autoW" wrap="off" id="ra1"
													autocomplete="false"
													style="min-width: 67px; border: none; resize: none; overflow: hidden; display: inline;"
													rows="1" onfocusout="fout"></textarea>
											</div>
										</li>
									</ul>
								</div>
							</td>
							<td><button type="button"  class="btn btn-secondary btn-sm"
									onclick="openAddr();">주소록</button></td>
						</tr>
						<tr align="left">
							<td><p>참조</p></td>
							<!-- <td><input type="email" id="receiver" class="rc1"></td> -->
							<td style="height: 1px;">
								<div id="receiverArea2"
									style="border: 1px solid rgb(179, 179, 179)" class="rc1">
									<ul id="mailArea">
										<li id="test2">
											<div>
												<textarea name="autoW" wrap="off" id="ra2"
													autocomplete="false"
													style="min-width: 67px; border: none; resize: none; overflow: hidden; display: inline;"
													rows="1"></textarea>
											</div>
										</li>
									</ul>
								</div>
							</td>
							<td><button type="button"  class="btn btn-secondary btn-sm"
									onclick="openAddr();">주소록</button></td>
						</tr>
						<tr align="left">
							<td><p>숨은참조</p></td>
							<!-- <td><input type="email" id="receiver" class="rc2"></td> -->
							<td style="height: 1px;">
								<div id="receiverArea3"
									style="border: 1px solid rgb(179, 179, 179)" class="rc1">
									<ul id="mailArea">
										<li id="test3">
											<div>
												<textarea name="autoW" wrap="off" id="ra3"
													autocomplete="false"
													style="min-width: 67px; border: none; resize: none; overflow: hidden; display: inline;"
													rows="1"></textarea>
											</div>
										</li>
									</ul>
								</div>
							</td>
							<td><button type="button"  class="btn btn-secondary btn-sm"
									onclick="openAddr();">주소록</button></td>
						</tr>
						<tr align="left">
							<td><p>파일첨부</p></td>
							<td colspan="2"><div class="custom-file mb-3">
									<input type="file" class="custom-file-input" id="customFile"
										name="filename"> <label class="custom-file-label"
										for="customFile"></label>
								</div></td>
						</tr>
						<tr>
							<td><p>제목</p></td>
							<td colspan="2">
								<div id="title" style="border: 1px solid rgb(179, 179, 179)">
									<textarea name="mTitle" wrap="off" id="ra3" autocomplete="false" style="width: 800px; border: none; resize: none; overflow: hidden; display: inline;" rows="1"></textarea>
								</div>
							</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td colspan="3"><textarea class="rc2 content" name="mContent"></textarea></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>

	<script>
		/* 팝업 오픈 */
        function openAddr(){
            var popupWidth = 720;
                var popupHeight = 450;
                var popupX = (window.screen.width / 2) - (popupWidth / 2);
                var popupY = (window.screen.height / 2) - (popupHeight / 2);
                // window.open('addr.html','window_name','width=850,height=600,location=no,status=no,scrollbars=yes');
                window.open('emailAddr.do', '주소록', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
        }
		
		/* 클릭하면 focus */
        $("#receiverArea1").click(function(){
            $("#ra1").focus();
        });
        $("#receiverArea2").click(function(){
            $("#ra2").focus();
        });
        $("#receiverArea3").click(function(){
            $("#ra3").focus();
        });
        
        /* 이메일 정규식 */
        function isEmail(textarea) {
        	  var emailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        	  console.log(emailReg.test(textarea));
        	  return emailReg.test(textarea);
        	};
        	
        /* 받는사람 키이벤트 */
        let textarea = document.getElementById('ra1');
        textarea.addEventListener('keyup', (e) => {
            const keyCode = e.keyCode;
            var $test = $("#test1");
	            if(keyCode == 13 || keyCode == 188 || keyCode == 32){
	            	if(isEmail(textarea.value)){
	                var $li = $("<li>");
	                var $div = $("<div id='addMail' class='mgr'>");
	                var str = $("#ra1").val().substring(0, $("#ra1").val().length - 1);
	                var $span = $("<span class='Madd' id='fff'>").text(str);
	                var $input = $("<input type='hidden' name='reId'>").val(str);
	                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
	                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
	                
	                $button.append($img);
	                $div.append($span);
	                $div.append($button);
	                $li.append($div);
	                $test.append($input);
	                $test.before($li);
	                $("#ra1").val("");
	            	} else{
	            		var $li = $("<li>");
		                var $div = $("<div id='failMail' class='mgr'>");
		                var str = $("#ra1").val().substring(0, $("#ra1").val().length - 1);
		                var $span = $("<span>").text(str);
		                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
		                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
		                
		                $button.append($img);
		                $div.append($span);
		                $div.append($button);
		                $li.append($div);
		                $test.before($li);
		                $("#ra1").val("");
	            	}
            }
        });
        
        /* 받는사람 포커스아웃 */
        textarea.addEventListener('focusout', (e) => {
            const keyCode = e.keyCode;
            var $test = $("#test1");
            if(textarea.value != ""){
	            	if(isEmail(textarea.value)){
	                var $li = $("<li>");
	                var $div = $("<div id='addMail' class='mgr'>");
	                var str = $("#ra1").val();
	                var $span = $("<span class='Madd' id='fff'>").text(str);
	                var $input = $("<input type='hidden' name='reId'>").val(str);
	                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
	                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
	                
	                $button.append($img);
	                $div.append($span);
	                $div.append($button);
	                $li.append($div);
	                $test.before($li);
	                $test.append($input);
	                $("#ra1").val("");
	            	} else{
	            		var $li = $("<li>");
		                var $div = $("<div id='failMail' class='mgr'>");
		                var str = $("#ra1").val();
		                var $span = $("<span>").text(str);
		                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
		                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
		                
		                $button.append($img);
		                $div.append($span);
		                $div.append($button);
		                $li.append($div);
		                $test.before($li);
		                $("#ra1").val("");
	            	}
            }
        });
        
        /* 참조 키이벤트 */
        let textarea2 = document.getElementById('ra2');
        textarea2.addEventListener('keyup', (e) => {
            const keyCode = e.keyCode;
            var $test = $("#test2");
            if(keyCode == 13 || keyCode == 188 || keyCode == 32){
            	if(isEmail(textarea2.value)){
                var $li = $("<li>");
                var $div = $("<div id='addMail' class='mgr'>");
                var str = $("#ra2").val().substring(0, $("#ra2").val().length - 1);
                var $span = $("<span>").text(str);
                var $input = $("<input type='hidden' name='feId'>").val(str);
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                
                $button.append($img);
                $div.append($span);
                $div.append($button);
                $li.append($div);
                $test.append($input);
                $test.before($li);
                $("#ra2").val("");
            	} else {
            		var $li = $("<li>");
                    var $div = $("<div id='failMail' class='mgr'>");
                    var str = $("#ra2").val().substring(0, $("#ra2").val().length - 1);
                    var $span = $("<span>").text(str);
                    var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                    var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                    
                    $button.append($img);
                    $div.append($span);
                    $div.append($button);
                    $li.append($div);
                    $test.before($li);
                    $("#ra2").val("");
            	}
            }
        });
        
        /* 참조 포커스아웃 */
        textarea2.addEventListener('focusout', (e) => {
            const keyCode = e.keyCode;
            var $test = $("#test2");
            if(textarea2.value != ""){
            	if(isEmail(textarea2.value)){
                var $li = $("<li>");
                var $div = $("<div id='addMail' class='mgr'>");
                var str = $("#ra2").val();
                var $span = $("<span>").text(str);
                var $input = $("<input type='hidden' name='feId'>").val(str);
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                
                $button.append($img);
                $div.append($span);
                $div.append($button);
                $li.append($div);
                $test.append($input);
                $test.before($li);
                $("#ra2").val("");
            	} else {
            		var $li = $("<li>");
                    var $div = $("<div id='failMail' class='mgr'>");
                    var str = $("#ra2").val();
                    var $span = $("<span>").text(str);
                    var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                    var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                    
                    $button.append($img);
                    $div.append($span);
                    $div.append($button);
                    $li.append($div);
                    $test.before($li);
                    $("#ra2").val("");
            	}
            }
        });

        /* 숨은참조 키이벤트 */
        let textarea3 = document.getElementById('ra3');
        textarea3.addEventListener('keyup', (e) => {
            const keyCode = e.keyCode;
            var $test = $("#test3");
            if(keyCode == 13 || keyCode == 188 || keyCode == 32){
            	if(isEmail(textarea3.value)){
                var $li = $("<li>");
                var $div = $("<div id='addMail' class='mgr'>");
                var str = $("#ra3").val().substring(0, $("#ra3").val().length - 1);
                var $span = $("<span>").text(str);
                var $input = $("<input type='hidden' name='heId'>").val(str);
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                
                $button.append($img);
                $div.append($span);
                $div.append($button);
                $li.append($div);
                $test.append($input);
                $test.before($li);
                $("#ra3").val("");
            } else{
            	var $li = $("<li>");
                var $div = $("<div id='failMail' class='mgr'>");
                var str = $("#ra3").val().substring(0, $("#ra3").val().length - 1);
                var $span = $("<span>").text(str);
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                
                $button.append($img);
                $div.append($span);
                $div.append($button);
                $li.append($div);
                $test.before($li);
                $("#ra3").val("");
            }
            }
        });
        
        /* 숨은참조 포커스아웃 */
        textarea3.addEventListener('focusout', (e) => {
            const keyCode = e.keyCode;
            var $test = $("#test3");
            if(textarea3.value != ""){
            	if(isEmail(textarea3.value)){
                var $li = $("<li>");
                var $div = $("<div id='addMail' class='mgr'>");
                var str = $("#ra3").val();
                var $span = $("<span>").text(str);
                var $input = $("<input type='hidden' name='heId'>").val(str);
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                
                $button.append($img);
                $div.append($span);
                $div.append($button);
                $li.append($div);
                $test.append($input);
                $test.before($li);
                $("#ra3").val("");
            } else{
            	var $li = $("<li>");
                var $div = $("<div id='failMail' class='mgr'>");
                var str = $("#ra3").val();
                var $span = $("<span>").text(str);
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                
                $button.append($img);
                $div.append($span);
                $div.append($button);
                $li.append($div);
                $test.before($li);
                $("#ra3").val("");
            }
            }
        });
        
        $(document).on("click", ".dBtn", function(){
            console.log( $(this).parents("li"));
            $(this).parents("li").remove();
        });
        
        $("#letsgo").on('click', function(){
        	var hi = $("#fff").text();
        	if(hi == ""){
        		alert("받는사람을 입력하시기 바랍니다.");
        	} else {
        		var formObj = $("form[name='form']");
        		formObj.attr("action", "esend.do");
        		formObj.submit();
        	}
        });
    </script>
</body>
</html>