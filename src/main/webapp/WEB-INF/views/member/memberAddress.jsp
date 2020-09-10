<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>주소록 조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">


    <style>
        body {
            width: 1400px;
            height: 800px;
        }

        .section {
            width: 100%;
            height: 85%;
        }

        .aside {
            height: 100%;
            width: 6%;
            background: #01579a;
        }

        .section1 {
            width: 14%;
            height: 100%;
        }

        .section2 {
            text-align: center;
            width: 80%;
            height: 100%;   
            margin-left: 50px;
            margin-top: 80px;
            float: left;    
        }
        
        .section,
        .section1 {
            display: flex;
        }
        .aside button{
            width: 100%;
            height: 11%;
            background: none;
            border: none;
            color: white;
            float: left;
            margin-bottom: 4px;
        }
        .aside button:hover{
            background: #1e87e4;
        }

        .menubar button{
            border: none;
            background: none;
            width: 100%;
            height: 50px;
            margin-top: 20px;
        }
        .menubar button:hover{
            color: #1e87e4;
            font-weight: bold;
        }
        #pro{
        border-radius: 100px;
        }
        th{
            width: 80px;
            
        }
        
        td{
            font-size: 13px;
            font-weight : bold;
            height: 50px;
            width: 50px;
        }

        h4{
            font-weight : bold;
        }

        input {

        padding: 9px;
        border: 1px solid rgb(182, 181, 181);
        border-radius: 4px;
        margin: 5px 0;
        opacity: 0.85;
        display: inline-block;
        font-size: 12px;
        /* line-height: 20px; */
        text-decoration: none; /* remove underline from anchors */
        }

        #pro{
            width: 70px;
            height: 70px;
        }


       /* style the submit button */

        input[type=button] {
        background-color: #2a7fc0;
        color: white;
        cursor: pointer; 
        }

        input[type=button]:hover {
        background-color: #2670a8;
        }

        input[type=submit] {
        background-color: #2a7fc0;
        color: white;
        cursor: pointer; 
        }

        input[type=submit]:hover {
        background-color: #2670a8;
        }

        #thispage{
            font-weight: bold;  
            color:#1e87e4;
        }
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            float: left;
        }
        #selectedMenu{
            background: #1e87e4;  
        }


        /*----------------------*/
        .page_wrap {
        text-align:center;
        font-size:0;
        }
        .page_nation {
        display:inline-block;
        }
        .page_nation .none {
        display:none;
        }
        .page_nation a {
        display:block;
        margin:0 3px;
        float:left;
        border:1px solid #e6e6e6;
        width:28px;
        height:28px;
        line-height:28px;
        text-align:center;
        background-color:#fff;
        font-size:13px;
        color:#999999;
        text-decoration:none;
        }
        .page_nation .arrow {
        border:1px solid #ccc;
        }
        .page_nation .pprev {
        background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
        margin-left:0;
        }
        .page_nation .prev {
        background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
        margin-right:7px;
        }
        .page_nation .next {
        background:#f8f8f8 url('img/page_next.png') no-repeat center center;
        margin-left:7px;
        }
        .page_nation .nnext {
        background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
        margin-right:0;
        }
        .page_nation a.active {
        background-color:#42454c;
        color:#fff;
        border:1px solid #42454c;
        }
        
        #all, #department, #create, #business{
            display: flex;
        }
        .minicon{
            width: 20px;
            height: 20px;
        }
        .minicon2{
            border: none;
            background: none;
        }

         #radiobox{
            margin: 0 2%;
            text-align: left;
        }
        #radiobox input[type=radio] {
            position: absolute;
            display: none;
        }
        
        #radiobox label {
            cursor: pointer;
            font-weight: bold;
            color: gray;
            padding: 5px 20px;
            margin:0px;
        }

        #radiobox input[type=radio]:checked + label{
            color:#1e87e4;
            border-bottom: 2px solid #1e87e4;
        }
    </style>
</head>

<body>
 <jsp:include page="../common/menubar.jsp"/>
    <div class="section"><br>
<jsp:include page="../common/employeemenu.jsp"/>
        <div class="section1">
            <div class="menubar">
                <button onclick="location.href='eAddress.do'">주소록 조회</button>
                <button id="selected" onclick="location.href='clist.do'">거래처 조회</button>
                <button id="insertClient" onclick="location.href='cinsertView.do'">거래처 등록</button>
            </div>
        </div>
        <div class="section2">
        <br><br>
            <p class="title">주소록 조회</p>

            <div id="test" align="right">
                <select>
                    <option>------</option>
                    <option>부서</option>
                    <option>이름</option>
                </select>
                <input type="text">
                <button type="button" class="btn btn-secondary btn-sm">검색</button>
                
            </div>
            <div id="radiobox">
                <input type="radio" name="tab" id="tab1" onchange="setDisplay()" checked="checked"><label for="tab1">전체</label>
                <input type="radio" name="tab" id="tab2" onchange="setDisplay()"><label for="tab2">인사팀</label>
                <input type="radio" name="tab" id="tab3" onchange="setDisplay()"><label for="tab3">개발팀</label>
                <input type="radio" name="tab" id="tab4" onchange="setDisplay()"><label for="tab4">영업팀</label>
        </div>

            <div id="mainContent">
                
                <div id="all" >
                    <table class="table table-hover"> <!--style="width:540px" -->
                        <tbody>
                            <thead>
                                <tr>
                                    <th>프로필</th>
                                    <th>주소록</th>
                                </tr>
                            </thead>
                            
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀  value="${ eName }<br>
                                    	 value="${ phone }"<br>
                                   	     value="${ email }"<br>
                                    <button class="minicon2"><img class="minicon" src="${ contextPath }/resources${ profile.filePath }/${ profile.changeName }"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>

                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-hover tb">
                        <tbody>
                            <thead>
                                <tr>
                                    <th>프로필</th>
                                    <th>주소록</th>

                                </tr>
                            </thead>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>

                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


                <div id="department" style="display: none">
                        <table class="table table-hover"> <!--style="width:540px" -->
                            <tbody>
                                <thead>
                                    <tr>
                                        <th>프로필</th>
                                        <th>주소록</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td><img id=pro src="../html/image/IU.JPG"></td>
                                    <td>인사팀 이지은<br>
                                        010-1234-5678<br>
                                        kh123@ourwork.com<br>
                                        <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                        <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                    </td>
    
                                </tr>
                                <tr>
                                    <td><img id=pro src="../html/image/IU.JPG"></td>
                                    <td>인사팀 이지은<br>
                                        010-1234-5678<br>
                                        kh123@ourwork.com<br>
                                        <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                        <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                    </td>
                                </tr>
    
                            </tbody>
                        </table>
                        <table class="table table-hover tb">
                            <tbody>
                                <thead>
                                    <tr>
                                        <th>프로필</th>
                                        <th>주소록</th>
    
                                    </tr>
                                </thead>
                                <tr>
                                    <td><img id=pro src="../html/image/IU.JPG"></td>
                                    <td>인사팀 이지은<br>
                                        010-1234-5678<br>
                                        kh123@ourwork.com<br>
                                        <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                        <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                    </td>
    
                                </tr>
                                <tr>
                                    <td><img id=pro src="../html/image/IU.JPG"></td>
                                    <td>인사팀 이지은<br>
                                        010-1234-5678<br>
                                        kh123@ourwork.com<br>
                                        <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                        <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


  
                <div id="create" style="display: none">
                    <table class="table table-hover"> <!--style="width:540px" -->
                        <tbody>
                            <thead>
                                <tr>
                                    <th>프로필</th>
                                    <th>주소록</th>
                                </tr>
                            </thead>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>

                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <table class="table table-hover tb">
                        <tbody>
                            <thead>
                                <tr>
                                    <th>프로필</th>
                                    <th>주소록</th>

                                </tr>
                            </thead>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>

                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


                <div id="business" style="display: none">
                    <table class="table table-hover"> <!--style="width:540px" -->
                        <tbody>
                            <thead>
                                <tr>
                                    <th>프로필</th>
                                    <th>주소록</th>
                                </tr>
                            </thead>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>

                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <table class="table table-hover tb">
                        <tbody>
                            <thead>
                                <tr>
                                    <th>프로필</th>
                                    <th>주소록</th>

                                </tr>
                            </thead>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>

                            </tr>
                            <tr>
                                <td><img id=pro src="../html/image/IU.JPG"></td>
                                <td>인사팀 이지은<br>
                                    010-1234-5678<br>
                                    kh123@ourwork.com<br>
                                    <button class="minicon2"><img class="minicon" src="../html/image/b.mail.png"></button>
                                    <button class="minicon2"><img class="minicon" src="../html/image/send.png"></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <hr>

		<c:forEach var="a" items="${ list }">
			<tr>
				<td>${ a.eName }</td>
				<td>
				<c:if test="${ !empty loginUser }">
					<c:url var="adetail" value="adetail.do">
						<c:param name="eName" value="${ a.eName }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
				</c:if>
				</td>
				<td>${ a.fileLevel }</td>
				<td>${ a.dId } &nbsp; ${ a.eName }<br>
					${ a.phone }<br>
					${ a.email }
				</td>
			</tr>
			</c:forEach>

            <!-- 페이징 처리 -->
			<tr align="center" height="20">
				<td colspan="6">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.do">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.do">
							<c:param name="page" value="${ p }" />
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
				</td>


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


         function setDisplay() {
            if ($('input:radio[id=tab1]').is(':checked')) {
                $('#all').show();
                $('#department').hide();
                $('#create').hide();
                $('#business').hide();
            }else if ($('input:radio[id=tab2]').is(':checked')) {
                $('#all').hide();
                $('#department').show();
                $('#create').hide();
                $('#business').hide();
            }else if ($('input:radio[id=tab3]').is(':checked')) {
                $('#all').hide();
                $('#department').hide();
                $('#create').show();
                $('#business').hide();
            }else{
                $('#all').hide();
                $('#department').hide();
                $('#create').hide();
                $('#business').show();
            }
        }
    </script>

</body>

</html>