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
    <title>휴가 조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>
        /* div {
            border: 1px solid skyblue;

        } */

        body {
            width: 1400px;
            height: 800px;
        }

        .header {
            width: 100%;
            height: 10%;
            border-bottom: 1px solid #003f6e;
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
            border-right: 1px solid #003f6e;

        }
        .title{
            font-size: 20px;
            color:rgba(78, 78, 78, 0.952);
            font-weight: bold;
            text-align: center;

        }

        /* 메뉴바 */
        /* 여기 a 태그*/
        .menubar a{
            padding: 6px 8px 6px 16px;
            text-decoration: none;
            font-size: 15px;
            color: rgb(52, 53, 77);
            display: block;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            outline: none;
            margin-top: 20px;
        }


        .section2 {
            width: 80%;
            height: 100%;
            float: left;
            
        }

        .header,
        .section,
        .section1 {
            display: flex;
        }

       .logo {
            width: 20%;
            border: none;
        }

        .top_profile {
            width: 80%;
        }

        .profile{
            width: 80px;
            height: 80px;
            margin-right: 30px;
        }
        .approval, .schedule, .notice, .board{
            width: 48%;
            height: 48%;
            margin: 6px;
            box-sizing: border-box;
            display: inline-block;
        }
        .icons{
            width: 50%;
            height: 50%;
            
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
        .top_profile button{
            margin-top: 30px;
            margin-right: 20px;
        }
        .dropdown-toggle{
            border: none;
            background: none;
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
        #selectedMenu{
            background: #1e87e4;  
        }
        /* sidebar 버튼 선택되었을 때 */
        #selected{
            font-weight: bold;  
            color:#1e87e4;
        }
        /* 페이징바 */
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
        .list{
            float: left;
            width: 50%;
            height: 500px;
            text-align: center;
            margin-top: 20px;
        }
        .list1{
            text-align: left;
        }
        .pasing{
            text-align: center;
        }
        tr,td{
            text-align: center;
        }
        #test{
            margin-top: 10px;
        }

    </style>
</head>

<body>
    <jsp:include page="../common/menubar.jsp" />
    <div class="section"><br>
       <jsp:include page="../common/noticemenu.jsp" />
        <div class="section1">
            <div class="menubar">
                    <button onclick="location.href='pteam.do'">휴가 관리</button>
                    <button>결재 조회</button>
                    <button id="selected" onclick="location.href='employeeE.do'">사원 관리</button>
                    <button onclick="window.open('address.html','window_name','width=600,height=500,location=no,status=no,scrollbars=yes');">부서
                        관리</button>
                    <button>증명서 관리</button>
                    <button>근퇴 관리</button>
        </div>
        </div>
        <div class="section2">
            
            <div id="test" align="right">
                    
                <select>
                    <option>------</option>
                    <option>영업팀</option>
                    <option>인사팀</option>
                </select>
                <input type="text">
                <button type="button" class="btn btn-secondary btn-sm">검색</button>
            </div>
            <div id="mainContent">
                <div class="list">
                    <br><br>여기
                    <br>
                    <button type="button" class="btn btn-secondary btn-sm">검색</button>
                </div>
                <div class="list list1">
                        <p class="title" ><br><br>근태 조회</p>
                        <table class="table table-hover">
                                <thead class="thead-light">
                                    <tr>
                                        <th>2020-08-17 월요일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="2">인사팀 최유빈</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">인사팀 최유빈</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">인사팀 최유빈</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">인사팀 최유빈</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">인사팀 최유빈</td>
                                    </tr>
                                </tbody>
                              </table>
                              <div class="pasing">
                              <div class="page_nation">
                                    <a class="arrow pprev" href="#"><<</a>
                                    <a class="arrow prev" href="#"><</a>
                                    <a href="#" class="active">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <a href="#">5</a>
                                    <a class="arrow next" href="#">></a>
                                    <a class="arrow nnext" href="#">>></a>
                                </div>
                            </div>
                </div>
                    
        </div>
    </div>

</body>

</html>