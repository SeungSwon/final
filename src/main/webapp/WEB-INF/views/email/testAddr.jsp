<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>
        /* * {
            border: 1px solid gray;
        } */
        #addrList{
            width: 400px;
        }
        table > tr{
            margin-top: 30px;
        }
        .wrapper{
            width: 900px;
        }
        .btn-wrapper{
            width: 900px;
            display: inline-block;
        }
        .btn-wrapper button{
            margin-right: 50px;
        }
        .div1{
            width: 35%;
            margin-left: 30px;
            margin-right: 50px;
            height: 500px;
            overflow:auto;
        }
        .div3{
            width: 26.5%;
            margin-left: 50px;
        }
        .div1, .div2, .div3{
            float: left;
            /* display: inline-block; */
        }
        .rdiv {
            border: 1px solid black;
            width: 250px;
            height: 130px;
        }

        span {
            font-size: 11.5px;
        }

        #dbtn{
            width: 10px;
            height: 10px;
        }
        #deleteImg{
            background: none;
            border: none;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <div class="div1">
            <table>
                <tbody>
                    <!-- <thead class="main1">
                        <tr align="center">
                            <th>직원목록</th>
                        </tr>
                    </thead> -->
                    <c:forEach var="d" items="${ list }">
                    	<tr align="center">
	                        <td>
	                            <c:if test="${ d.rNum eq 1}">
					                <span style="font-weight: bold; font-size: 18px;">
					                    ${ d.dName }
					                </span>
				                </c:if>
	                        </td>
	                    </tr>
                    	<tr>
	                        <td>
	                            <input type="checkbox" name="checkRow" class="checkRow">
	                            <label>${ d.eName }(${ d.rName })/${ d.email }</label>
	                        </td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="div2"><br><br><br>
            <button type="button" class="btn btn-secondary btn-sm" onclick="aReceiver();">&gt;&gt;</button>
            <br><br><br><br><br><br>
            <button type="button" class="btn btn-secondary btn-sm" onclick="aRefer();">&gt;&gt;</button><br><br>
            <br><br><br><br>
            <button type="button" class="btn btn-secondary btn-sm" onclick="aHideR();">&gt;&gt;</button><br><br>
        </div>
        <div class="div3">
            <table>
                    <tr align="center">
                        <th>받는사람</th>
                    </tr>
                    <tr align="center">
                        <td><div class="rdiv" id="rArea" cols="30" rows="5" style="resize: none;" disabled></div></td>
                    </tr>
                </table>
                <table>
                    <tr align="center">
                        <th>참조</th>
                    </tr>
                    <tr align="center">
                        <td><div class="rdiv" id="rRefer" cols="30" rows="5" style="resize: none;" disabled></div></td>
                    </tr>
                </table>
                <table>
                    <tr align="center">
                        <th>숨은참조</th>
                    </tr>
                    <tr align="center">
                        <td><div class="rdiv" id="rHide" cols="30" rows="5" style="resize: none;" disabled></div></td>
                    </tr>
                </table>
        </div>
    </div>
    <div class="btn-wrapper" align="center">
        <button type="button" class="btn btn-secondary btn-sm">확인</button>
        <button type="button" class="btn btn-secondary btn-sm">취소</button>
    </div>

    <script>
        // 받는사람
        function aReceiver() {
             var check = "";
             $(".checkRow:checked").each(function () {
                console.log($(this).next().text());
                var $rArea = $("#rArea");
                var $span = $("<span>").text($(this).next().text());
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                var $br = $("<br>");

                $button.append($img);
                $span.append($button);
                $span.append($br);
                $rArea.append($span);

                $(this).prop("checked", false);
             });
        }

        // 참조
        function aRefer() {
             var check = "";
             $(".checkRow:checked").each(function () {
                console.log($(this).next().text());
                var $rRefer = $("#rRefer");
                var $span = $("<span>").text($(this).next().text());
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                var $br = $("<br>");

                $button.append($img);
                $span.append($button);
                $rRefer.append($span);
                $rRefer.append($br);

                $(this).prop("checked", false);
             });
        }

        // 숨은 참조
        function aHideR() {
             var check = "";
             $(".checkRow:checked").each(function () {
                console.log($(this).next().text());
                var $rHide = $("#rHide");
                var $span = $("<span>").text($(this).next().text());
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/common/delete.png'>");
                var $br = $("<br>");

                $button.append($img);
                $span.append($button);
                $rHide.append($span);
                $rHide.append($br);

                $(this).prop("checked", false);
             });
        }

        // 지우는거
        $(document).on("click", ".dBtn", function(){
            $(this).parents("span").remove();
        })
    </script>
</body>
</html>