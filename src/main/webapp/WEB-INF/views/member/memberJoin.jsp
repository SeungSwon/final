<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>회원가입</title>


 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>



<style>
* {
	box-sizing: border-box
}

#wrapper {
	width: 1200px;
	margin: auto;
	/*display: flex; */
	background-color: #5396c9;
}

/* style the container */
.container {
	width: 60%;
	position: relative;
	border-radius: 5px;
	background-color: hsl(0, 0%, 95%);
	padding: 20px 0 30px 0;
	/*display: flex;*/
}

/* style inputs and link buttons */
input, .btn, #postcodify_search_button {
	width: 100%;
	padding: 9px;
	border: none;
	border-radius: 4px;
	margin: 5px 0;
	opacity: 0.85;
	display: inline-block;
	font-size: 12px;
	line-height: 20px;
	text-decoration: none; /* remove underline from anchors */
}

/* style the submit button */
input[type=submit] {
	width: 70px;
	background-color: #0c70bd;
	color: rgb(255, 255, 255);
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #01579a;
}

input[type=button] {
	width: 70px;
	background-color: #0c70bd;
	color: rgb(255, 255, 255);
	cursor: pointer;
}

input[type=button]:hover {
	background-color: #01579a;
}

#postcodify_search_button {
	swidth: 70px;
	background-color: #0c70bd;
	color: rgb(255, 255, 255);
	cursor: pointer;
}

#postcodify_search_button:hover {
	background-color: #01579a;
}

/* ajax 적용 이후 */
span.guide {
	display: none;
	font-size: 12px;
	top: 12px;
	right: 10px;
}

span.ok {
	color: green;
}

span.error {
	color: black;
}
</style>

<!-- <script type="text/javascript"> 
//모든 공백 체크 정규식 
var empJ = /\s/g; 

//아이디 정규식 
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 

// 비밀번호 정규식 
var pwJ = /^[A-Za-z0-9]{4,12}$/; 

// 이름 정규식 
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 

// 이메일 검사 정규식 
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

//이메일 정규식
if (mailJ.test($('#email').val())){ 
	console.log(mailJ.test($('#email').val())); 
	inval_Arr[4] = true; 
	} else { 
		inval_Arr[4] = false; 
		alert('이메일을 확인하세요.'); 
		return false; 
	}
	
//이름에 특수문자 들어가지 않도록 설정 
$("#eName").blur(function() { 
	if (nameJ.test($(this).val())) { 
		console.log(nameJ.test($(this).val())); 
		$("#name_check").text(''); 
		} else { 
			$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)'); 
			$('#name_check').css('color', 'red'); } 
	}); 
			
$("#email").blur(function() { 
	if (mailJ.test($(this).val())) { 
		$("#email_check").text(''); 
		} else { 
			$('#email_check').text('이메일 양식을 확인해주세요.'); 
			$('#email_check').css('color', 'red'); } 
	});


</script> -->




</head>

<body>
	<div id='wrapper' align="center">
		<br>
		<br>
		<div class="container" text-align="center">
			<form action="memberJoin.do" method="post">
				<div class="row">
					<h2 style="text-align: center">회원가입</h2>

					<table>
						<div class="col">
							<tr>
								<td>*이름 :</td>
								<td><input type="text" name="eName" minlength="2" maxlength="5" placeholder="2-5글자"required> </td>
							</tr>
			                <tr>
			                    <td>프로필 사진 : </td>
			                  
			                    <td>                  
				                    <input type="file" name="reloadFile">                          	
									<!-- <button type="submit" name="submit">프로필등록</button> -->
			                    </td>
			                    
			                </tr>
							<tr>
								<td>*아이디 :</td>
								<td><input type="text" name="eId" id="eId"  maxlength="10"  placeholder="4글자이상" required></td>
								<td><input type="button" value="중복 확인" name="idchk" id="eIdbtn"> 
								
								<!-- ajax 이후 적용 --> 
								<span class="guide ok"> 이 아이디는 사용 가능합니다. </span> 
								<span class="guide error"> 이 아이디는 사용할 수 없습니다.</span> 							
								<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"></td>
							</tr>
							<tr>
								<td>*비밀번호 :</td>
								<td><input type="password" name="ePwd" id="ePwd" minlength="4" maxlength="16" placeholder=" 8-16자 영문,숫자 조합" required>
								</td>
							</tr>
							<tr>
								<td>*비밀번호 확인 :</td>
								<td><input type="password" name="ePwd2" id="ePwd2" minlength="4" maxlength="16" placeholder="비밀번호 확인" required></td>
								<td><font name="check" size="2" color="red"></font></td>
								
							</tr>

						<tr>
							<td>*이메일 :</td>
							<td><input type="text" name="email" placeholder="이메일 형식에 맞게 작성 " required></td>
							<!-- <td><font class="eheck_font" id="email_check" size="2" color="red"></font></td> -->
							<td><input type="button" value="중복 확인" name="emailchk" id="emailBtn">
							
							 
								<!-- ajax 이후 적용 --> 
								<span class="guide ok"> 이 메일은 사용 가능합니다.</span> 
								<span class="guide error"> 이 메일은 사용할 수 없습니다.</span> 							
								<input type="hidden" name="emailDuplicateCheck" id="emailDuplicateCheck" value="0"></td>
						</tr>
						<tr>
							<td>*핸드폰 번호 :</td>
							<td><input type="text" name="phone" maxlength="11" placeholder="(-제외)01012345678" required></td>
						</tr>
						<tr>
							<td>*우편번호 :</td>
							<td><input type="text" name="post" class="postcodify_postcode5" size="6" placeholder="검색해주세요" ></td>
							<td><button type="button" id="postcodify_search_button">검색</button></td>
							
						</tr>
						<tr>
							<td>*도로명 주소:</td>
							<td><input type="text" name="address1" class="postcodify_address" placeholder="상세히 입력해주세요" required></td>
						</tr>
						<tr>
							<td>*상세 주소:</td>
							<td><input type="text" name="address2" class="postcodify_details" placeholder="상세히 입력해주세요" required></td>
						</tr>
						<tr>
							<td>*입사일 :</td>
							<td><input type="date" name="join_date" required></td>

						</tr>
						<tr>
							<td>*생년월일 :</td>
							<td><input type="text" name="eBirth" placeholder="ex) 19960101" required></td>
						</tr>

						</div>
					</table>
					<input type="button" onclick="location.href='index.do'" value="취소">&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="submit" value="가입완료" required>
					</form>
				</div>
			
		</div>
		<br>
		<br>
	</div>
	<script> 
	
		$(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
	
		//아이디 일치여부
		$(function(){
			$("#eIdbtn").on("click", function(){
				var eId = $("#eId").val().trim(); // trim() : 공백 제거
				console.log(eId);
				
				if(eId.length < 4){
					alert("4글자 이상 입력하시오");
				}
				
				$.ajax({
					url : "dupid.do",
					data : {eId:eId},
					success : function(data){
						console.log(data);

						if(data.isUsable == true){	// boolean 타입 자체로 리턴 되므로 따옴표 없이 비교
							alert("사용 가능한 아이디입니다. 사용하시겠습니까?");
							eId.focus();
						}else{
							alert("사용할 수 없는 아이디입니다.");
							eId.focus();
						}
					},
						error : function(e){
						console.log(e);
					}
				});			
				
			});
			
		})
		
		//이메일 일치여부
		$(function(){
			$("#emailBtn").on("click", function(){
				var email = $("#email").val().trim(); // trim() : 공백 제거
				console.log(email);
				
				$.ajax({
					url : "edupid.do",
					data : {email:email},
					success : function(data){
						console.log(data);

						if(data.isUsable == true){	// boolean 타입 자체로 리턴 되므로 따옴표 없이 비교
							alert("이 메일주소는 사용 가능합니다");
						}else{
							alert("이 메일주소는 사용 불가능합니다");
						}
					},
						error : function(e){
						console.log(e);
					}
				});			
				
			});
			
		})
		
		//PWD 일치여부
		$(function() {
			$('#ePwd').keyup(function() {
				$('font[name=check]').text('');
			}); //#user_pass.keyup

			$('#ePwd2').keyup(function() {
				if ($('#ePwd').val() != $('#ePwd2').val()) {
					$('font[name=check]').text('');
					$('font[name=check]').html("비밀번호가 일치하지 않습니다.");
				} else {
					$('font[name=check]').text('');
					$('font[name=check]').html("비밀번호가 일치합니다.");
				}
				return false;
			}); 
		});
		
		
	</script>
		




	

</body>

</html>