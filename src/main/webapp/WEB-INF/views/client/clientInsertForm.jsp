<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록</title>

<style>
		 
        .menubar button{
            border: none;
            background: none;
            width: 100%;
            height: 50px;
            margin-top: 20px;
        }
        .menubar button:hover{
            font-weight: bold;  
            color:#1e87e4;
        }
		#selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        .table th{
            font-size: 14px;  
            text-align: center;
            background: lightgrey;
            width: 300px;
        }
        .table td{
            font-size: 12px;
            width: 400px;
        }
        input[type=text]{
            width: 500px;
        }
        #emailId{
            width: 250px;
        }
        select{
            height: 25px;
            width: 147px;
        }
        
        #direct{
            width:150px;
        }
        table{
            border: 1px solid lightgrey;
            margin-top: 50px;
        }
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            float: left;
            margin-left: 20px;
            margin-top: 20px;
        }
        #clientTable{
            margin: 20px 2%;
        }
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="section"><br>
       	<c:import url="../common/clientmenu.jsp"/>
        <div class="section1">
            <div class="menubar">
                <button>주소록 조회</button>
                <button onclick="location.href='clist.do'">거래처 조회</button>
                <button id="selected" onclick="location.href='cinsertView.do'">거래처 등록</button>
            </div>
        </div>
        <div class="section2">
            <p class="title">거래처 등록</p>
            
            <form action="cinsert.do" method="post" enctype="multipart/form-data" onsubmit="return validate();">
            <div id="clientTable">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>거래처명</th>
                            <td><input type="text" name="cName" id="cName"></td>
                            <!-- <input type="hidden" name="eId"> -->
                        </tr>
                        <tr>
                            <th>구분</th>
                            <td>
                                <select name="cSort" id="cSort">
                                    <option value=1>법인</option>
                                    <option value=2>개인</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>대표자명</th>
                            <td><input type="text" name="represent"></td>
                        </tr>
                        <tr>
                            <th>사업자등록번호/주민등록번호</th>
                            <td><input type="text" name="bNum" id="bNum"></td>
                        </tr>
                        <tr>
                            <th>우편번호</th>
                            <td>
                            	<input type="text" name="post" class="postcodify_postcode5" size="5">
                            	<button type="button" id="search_button" class="btn btn-secondary btn-sm">검색</button>
                            </td>
                        </tr>
                        <tr>
                       		<th>도로명 주소</th>
                       		<td><input type="text" name="address1" class="postcodify_address"></td>
                        </tr>
                        <tr>
                        	<th>상세 주소</th>
                        	<td><input type="text" name="address2" class="postcodify_details"></td>
                        </tr>
                        <tr>
                            <th>대표전화</th>
                            <td><input type="text" placeholder="구분자를 포함하여 입력해주세요." name="cPhone"></td>
                        </tr>
                        <tr>
                            <th>FAX번호</th>
                            <td><input type="text" placeholder="구분자를 포함하여 입력해주세요." name="fax"></td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td><input type="text" name="business"></td>
                        </tr>
                        <tr>
                            <th>담당자</th>
                            <td><input type="text" name="manager"></td>
                        </tr>
                        <tr>
                            <th>담당자 부서</th>
                            <td><input type="text" name="mDepartment"></td>
                        </tr>
                        <tr>
                            <th>담당자 전화</th>
                            <td><input type="text" placeholder="구분자를 포함하여 입력해주세요." name="mPhone"></td>
                        </tr>
                        <tr>
                            <th>담당자 이메일</th>
                            <td>
                                <input type="text" name="mEmail">
                            </td>
                        </tr>
                        <tr>
                            <th>사업자등록증</th>
                            <td><input type="file" name="uploadFile"></td>
                        </tr>

                    </tbody>
                </table>
                <div class="buttons" align="center">
                    <button type="button" class="btn btn-secondary btn-sm" id="cancel" onclick="history.back();">취소</button>
                    <button type="submit" class="btn btn-secondary btn-sm" id="insert">등록</button>
                </div>
            </div>
          </form>
                <br>
                
                <br><br>
            </div>
        </div>
    <script>
    	$(function() { 
    		$("#search_button").postcodifyPopUp(); 
    	});
		
    	function validate(){
       		
    		if($("#cName").val().trim().length == 0){
    			alert("거래처명을 입력해주세요.");
    			$("#cName").focus();
    			return false;
    		}else if($("#bNum").val().trim().length == 0){
    			alert("사업자등록번호/주민등록번호를 입력해주세요.");
    			$("#bNum").focus();
    			return false;
    		}else if(confirm("거래처를 등록하시겠습니까?") == false){
    			return false;
    		}
    		return true;
    	}
    </script>
</body>
</html>