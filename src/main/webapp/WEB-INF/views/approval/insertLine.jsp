<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>

    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
        
    <style>
        /** {
            border: 1px solid gray;
        } */

        .wrapper{
            width: 850px;
            margin: auto;
        }
        .btn-wrapper{
            width: 600px;
            margin-top: 15px;
            display: inline-block;
        }
        .btn-wrapper button{
            margin-right: 50px;
        }
        .div1{
            width: 30%;
            margin-right: 15px;
        }
        .div3{
            width: 30%;
            margin-left: 15px;
        }
        .div1, .div2, .div3{
            float: left;
            /* display: inline-block; */
        }
        .rdiv {
            border: 1px solid gray;
            width: 250px;
            height: 220px;
            padding: 10px;
        }

        #search{
            margin-left: 300px;
            margin-top: 10px;
        }

        #mlist{
            border:1px solid gray;
            height: 500px;
            overflow:auto;
        }

        #mlist button{
            border:none;
            background: none;
            width: 100%;
            text-align: left;
            color: gray;
            font-weight: bold;
        }
        #mlist button:hover{
            color:#1e87e4;
        }

        .dropdown-container input[type=checkbox] {
        position: absolute;
        display: none;
        }

        .dropdown-container label {
        cursor: pointer;
        font-weight: 00;
        text-align: center;
        margin: 5px 0px 0px 25px;
        }

        .dropdown-container input[type=checkbox]:checked + label{
            color:#1e87e4;
        }

        ul,li{
            list-style: none;
            padding-left:0px; 
            cursor: pointer;
        }

        #rArea li:hover{
            border: 1px solid #1e87e4;
        }

        #dbtn{
            width: 10px;
            height: 10px;
        }
        #deleteImg{
            background: none;
            border: none;
        }
        
        .user1, .user2, .deptname{
           display:none;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <div class="div1">
            <input type="text" id="word">
            <button type="button" id="btn_search" class="btn btn-secondary btn-sm">검색</button>
            <div id="mlist">
               <c:forEach var="l" items="${ list }">
               <c:if test="${ l.rNum eq 1}">
                <button class="dropdown-btn" style="font-weight: bold" id="deptname">
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                    </svg>${ l.dName }
                </button>
                </c:if>
                <div class="dropdown-container">
                <c:if test="${ loginUser.eId ne l.eId }">
                  <input type="checkbox" name="checkRow" class="checkRow" value="${l.eId}" id="${l.eId}">
                  <label for="${l.eId}"><span class="ename">${ l.eName }&nbsp;${ l.rName }</span>
                  <p class="deptname">${l.dName}</p></label>
                </c:if>
                </div>
                </c:forEach>
            </div>
        </div>
        <div class="div2"><br><br><br><br><br>
            <button type="button" class="btn btn-secondary btn-sm" onclick="aReceiver();">&gt;&gt;</button> 
            <br><br><br><br><br><br><br><br><br><br><br>
            <button type="button" class="btn btn-secondary btn-sm" onclick="aRefer();">&gt;&gt;</button><br><br>
        </div>
        <div class="div3">
            <h5>결재선</h5>
            <div class="rdiv" id="rArea" align="center">
                <ul id="sortable"></ul>
            </div>
            <br>
            <h5>참조자</h5>
            <div class="rdiv" align="center" >
                <ul id="rRefer"></ul>
            </div>
        </div>
        <div class="btn-wrapper" align="center">
            <button type="button" class="btn btn-secondary btn-sm" onclick="line()">확인</button>
            <button type="button" class="btn btn-secondary btn-sm" onClick="self.close();">취소</button>
        </div>
    </div>

    <script>
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
        
        // 결재선
        function aReceiver() {
             var check = "";
             $(".checkRow:checked").each(function () {
                var $rArea = $("#sortable");
                var $value = $("<input type='hidden' name='leId' class='user1'>").val($(this).val());
                var $name = $("<li>").html($(this).next().html());
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/approval/trash.png'>");

                var testValue = $(".user1").text();
                var subValue = $(this).val();
                
                var iValue = testValue.indexOf(subValue);

                 if(iValue == -1){
                   $button.append($value);
                   $button.append($img);
                   $name.append($button);
                   $rArea.append($name);
                }else{ 
                  alert("동일한 사람이 존재합니다.");
                 } 
                 
                 console.log($("#deptname"));
                $(this).prop("checked", false);
             });
             
            
        }

        //참조
        function aRefer() {
             var check = "";
             $(".checkRow:checked").each(function () {
                console.log($(this).next().text());
                var $rRefer = $("#rRefer");
                var $value = $("<input type='hidden' name='leId' class='user2'>").val($(this).val());
                var $name = $("<li>").html($(this).next().html());
                var $button = $("<button type='button' class='dBtn' id='deleteImg'>");
                var $img = $("<img id='dbtn'src='resources/images/approval/trash.png'>");
            
                var testValue = $(".user2").text();
                var subValue = $(this).val();
                
                var iValue = testValue.indexOf(subValue);

                 if(iValue == -1){
                   $button.append($value);
                   $button.append($img);
                   $name.append($button);
                   $rRefer.append($name);
                }else{ 
                   alert("동일한 사람이 존재합니다.");
                 } 

                $(this).prop("checked", false);
             });
        }
        
        //부모페이지로
        function line(){
           $(opener.document).find("#approvalinfo").empty();
           $(opener.document).find("#referenceinfo").empty();
           
           $("#sortable li").each(function () {
              var $div = $("<div class='peopleinfo'>");
              var $img = $("<img src='resources/images/common/profile_none.png'>");
              var $div2 = $("<div id='line'>")
              var $name = $("<span class='name1'>").html($(this).html());
              var $status = $("<span class='status'>").text("결재");
              var $status2 = $("<input type='hidden' name='lLevel' value='결재'>");
             
              $name.append($status2);
              $name.append($status);
              $div2.append($name);
              $div2.prepend($img);
              $div.append($div2);
              $(opener.document).find("#approvalinfo").append($div);
           });
           
           $("#rRefer li").each(function () {
        	   var $div = $("<div class='peopleinfo'>");
               var $img = $("<img src='resources/images/common/profile_none.png'>");
               var $div2 = $("<div id='line'>")
               var $name = $("<span class='name2'>").html($(this).html());
               var $status = $("<span class='status' name='lLevel'>").text("참조");
               var $status2 = $("<input type='hidden' name='lLevel' value='참조'>");
               
               $name.append($status2);
               $name.append($status);
               $div2.append($name);
               $div2.prepend($img);
               $div.append($div2);
               $(opener.document).find("#referenceinfo").append($div); 
           });
           
           close();
        }
        
        //자식페이지로 값 가져오기
         window.onload = function() {
    		 $(opener.document).find(".name1").each(function () {
                 var $name = $("<li>").html($(this).html());
                 $("#sortable").append($name);
             }); 
    		 $(opener.document).find(".name2").each(function () {
                 var $name = $("<li>").html($(this).html());
                 $("#rRefer").append($name);
             }); 
    		 $(".dept").each(function () {
                $(this).empty();
             });
    		 $(".status").each(function () {
    			 $(this).empty();
             });
    		 
    	};

        // 지우는거
        $(document).on("click", ".dBtn", function(){
            $(this).parents("li").remove();
            $(this).parents("span").remove();
            $(this).parents("<br>").remove();
           
        })
        
        //드래그
        $(function () {
            $("#sortable").sortable();
            $("#sortable").disableSelection();
        });
        
      

    </script>
</body>

</html>