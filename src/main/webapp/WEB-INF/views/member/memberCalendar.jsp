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
    <title>개인근태 조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>

        body {
            width: 1400px;
            height: 800px;
        }



        .section {
            width: 100%;
            height: 85%;
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

        
        .section,
        .section1 {
            display: flex;
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
   <jsp:include page="../common/menubar.jsp"/>
 
    <div class="section"><br>
        <div class="aside">
            <button><img class="icons" src="resources/images/common/mail.png"><br>메일</button>
            <button><img class="icons" src="resources/images/common/stamp.png"><br>결재</button>
            <button><img class="icons" src="resources/images/common/calendar.png"><br>일정</button>
            <button><img class="icons" src="resources/images/common/board.png"><br>게시판</button>
            <button><img class="icons" src="resources/images/common/chat_white.png"><br>메신저</button>
            <button><img class="icons" src="resources/images/common/address.png"><br>주소록</button>
            <button><img class="icons" src="resources/images/common/group.png"><br>인사관리</button>
            <button><img class="icons" src="resources/images/common/texting.png"><br>SNS</button>

        </div>
        <div class="section1">
            <div class="menubar">
                <div class="menubar">
                <button onclick="location.href='eMypage.do'">개인정보 조회</button>
                <button onclick="location.href='eCalendar.do'">개인근태 조회</button>
                </div>
            </div>
        </div>
        <div class="section2">
            
            <div id="mainContent">
                <div class="list">
                    <br><br>여기
                    <br>
                    <button type="button" class="btn btn-secondary btn-sm">검색</button>
                </div>
                <div class="list list1">
                        <p class="title" ><br><br>개인근태 조회</p>
                        <table class="table table-hover">
                            <tbody>
                                <thead >
                                    <tr>
                                        <th>날짜</th>
                                        <th>출근</th>
                                        <th>퇴근</th>
                                    </tr>
                                </thead>
                        
                                <tr>
                                    <td>2020-08-20</td>
                                    <td>08시 43분</td>
                                    <td>17시 40분</td>
                                </tr>
                                <tr>
                                    <td>2020-08-21</td>
                                    <td>08시 43분</td>
                                    <td>17시 40분</td>
                                </tr>
                                <tr>
                                    <td>2020-08-20</td>
                                    <td>08시 43분</td>
                                    <td>17시 40분</td>
                                </tr>
                                <tr>
                                    <td>2020-08-20</td>
                                    <td>08시 43분</td>
                                    <td>17시 40분</td>
                                </tr>
                                <tr>
                                    <td>2020-08-20</td>
                                    <td>08시 43분</td>
                                    <td>17시 40분</td>
                                </tr>
                                <tr>
                                    <td>2020-08-20</td>
                                    <td>08시 43분</td>
                                    <td>17시 40분</td>
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

</html></html>