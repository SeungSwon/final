<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 수정</title>

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
        select{
            height: 25px;
            width: 147px;
        }
        
        #direct{
            width:150px;
        }
        table{
            border: 1px solid lightgrey;
            margin-top: 20px;
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
        /* #clientTable label {
			  display: inline-block;
			  padding: .5em .75em;
			  color: #fff;
			  font-size: inherit;
			  line-height: normal;
			  vertical-align: middle;
			  background-color: #5cb85c;
			  cursor: pointer;
			  border: 1px solid #4cae4c;
			  border-radius: .25em;
			  -webkit-transition: background-color 0.2s;
			  transition: background-color 0.2s;
		}
		
		#clientTable label:hover {
		  	background-color: #6ed36e;
		}
		
		#clientTable label:active {
		  	background-color: #367c36;
		}
		
		#clientTable input[type="file"] {
			  position: absolute;
			  width: 1px;
			  height: 1px;
			  padding: 0;
			  margin: -1px;
			  overflow: hidden;
			  clip: rect(0, 0, 0, 0);
			  border: 0;
		} */
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="section"><br>
        <c:import url="../common/clientmenu.jsp"/>

        <div class="section1">
            <div class="menubar">
                <button>주소록 조회</button>
                <button id="selected" onclick="location.href='clist.do'">거래처 조회</button>
                <button onclick="location.href='cinsertView.do'">거래처 등록</button>
            </div>
        </div>
        <div class="section2">
            <p class="title">거래처 수정</p>
            
            <form action="cupdate.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="page" value="${ currentPage }">
			<input type="hidden" name="clId" value="${ c.clId }">
            <div id="clientTable">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>거래처명</th>
                            <td><input type="text" name="cName" value="${ c.cName }"></td>
                            <!-- <input type="hidden" name="eId"> -->
                        </tr>
                        <tr>
                            <th>구분</th>
                            <td>
                                <select name="cSort">
                                    <option value="1" <c:if test="${ c.cSort == 1 }">selected</c:if>>법인</option>
                                    <option value="2" <c:if test="${ c.cSort == 2 }">selected</c:if>>개인</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>대표자명</th>
                            <td><input type="text" name="represent" value="${ c.represent }"></td>
                        </tr>
                        <tr>
                            <th>사업자등록번호/주민등록번호</th>
                            <td><input type="text" name="bNum" value="${ c.bNum }"></td>
                        </tr>
                        
                        <c:forTokens var="addr" items="${ c.cAddress }" delims="," varStatus="status">
                        	<c:if test="${ status.index eq 0 }">
                        		<c:set var="addr1" value="${ addr }"/>
                        	</c:if>
                        	<c:if test="${ status.index eq 1 }">
                        		<c:set var="addr2" value="${ addr }"/>
                        	</c:if>
                        	<c:if test="${ status.index eq 2 }">
                        		<c:set var="addr3" value="${ addr }"/>
                        	</c:if>
                        </c:forTokens>
                        
                        <tr>
                            <th>우편번호</th>
                            <td>
                            	<input type="text" name="post" class="postcodify_postcode5" value="${ addr1 }">
                  				<button type="button" id="postcodify_search_button" class="btn btn-secondary btn-sm">검색</button>
                            </td>
                        </tr>
                        <tr>
                            <th>도로명주소</th>
                            <td>
                            	<input type="text" name="address1" class="postcodify_address" value="${ addr2 }">
                            </td>
                        </tr>
                        <tr>
                            <th>상세주소</th>
                            <td><input type="text" name="address2" class="postcodify_details" value="${ addr3 }"></td>
                        </tr>
                        <tr>
                            <th>대표전화</th>
                            <td><input type="text" placeholder="구분자를 포함하여 입력해주세요." name="cPhone" value="${ c.cPhone }"></td>
                        </tr>
                        <tr>
                            <th>FAX번호</th>
                            <td><input type="text" placeholder="구분자를 포함하여 입력해주세요." name="fax" value="${ c.fax }"></td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td><input type="text" name="business" value="${ c.business }"></td>
                        </tr>
                        <tr>
                            <th>담당자</th>
                            <td><input type="text" name="manager" value="${ c.manager }"></td>
                        </tr>
                        <tr>
                            <th>담당자 부서</th>
                            <td><input type="text" name="mDepartment" value="${ c.mDepartment }"></td>
                        </tr>
                        <tr>
                            <th>담당자 전화</th>
                            <td><input type="text" placeholder="구분자를 포함하여 입력해주세요." name="mPhone" value="${ c.mPhone }"></td>
                        </tr>
                        <tr>
                            <th>담당자 이메일</th>
                            <td>
                                <input type="text" name="mEmail" value="${ c.mEmail }">
                            </td>
                        </tr>
                        <tr>
                            <th>사업자등록증</th>
                            <td>
                            	<c:if test="${ !empty at.originName }">
                            		현재 업로드한 파일명 :
                            		<a>${ at.originName }</a>
                            	</c:if>
                            	<br>
                            	<input type="file" name="reloadFile" id="ex_file">
                            </td>
                        </tr>
                        <tr>
                        	<th>수정사유</th>
                        	<td><input type="text" name="reason"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="buttons" align="center">
                    <button type="button" class="btn btn-secondary btn-sm" id="cancel" onclick="history.back();">취소</button>
                    <button type="submit" class="btn btn-secondary btn-sm" id="update">수정</button>
                </div>
            </div>
          </form>
                <br><br><br>
            </div>
        </div>
    <script>
    	$(function() { 
    		$("#postcodify_search_button").postcodifyPopUp(); 
    	});
		
    	$("#update").click(function(){
    		if(confirm("거래처를 수정하시겠습니까?") == false){
    			return false;
    		}
    	});
    </script>
</body>
</html>