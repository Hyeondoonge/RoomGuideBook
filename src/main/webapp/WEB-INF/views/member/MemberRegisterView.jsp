<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../main/header.jsp" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>

<head>
    <title>RoomGuideBook_LOGIN</title>
    <link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
    <link href="/resources/css/join.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script
        type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <!----webfonts---->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!----//webfonts---->
    <!----start-alert-scroller---->
    <script src="/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.easy-ticker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#demo').hide();
            $('.vticker').easyTicker();
            
            var result = '${result}';
            if(result == "registerMemberFailed"){
            	alert("이미 사용 중인 아이디입니다.");
            }
        });
    </script>
    <!----start-alert-scroller---->
    <!-- start menu -->
    <link href="/resources/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="/resources/js/megamenu.js"></script>
    <script>$(document).ready(function () { $(".megamenu").megamenu(); });</script>
    <script src="/resources/js/menu_jquery.js"></script>
    <!-- //End menu -->
    <!---slider---->
    <link rel="stylesheet" href="/resources/css/slippry.css">
    <script src="/resources/js/jquery-ui.js" type="text/javascript"></script>
    <script src="/resources/js/scripts-f0e4e0c2.js" type="text/javascript"></script>
    <script>
        jQuery('#jquery-demo').slippry({
            // general elements & wrapper
            slippryWrapper: '<div class="sy-box jquery-demo" />', // wrapper to wrap everything, including pager
            // options
            adaptiveHeight: false, // height of the sliders adapts to current slide
            useCSS: false, // true, false -> fallback to js if no browser support
            autoHover: false,
            transition: 'fade'
        });
    </script>
    <!---move-top-top---->
    <script type="text/javascript" src="/resources/js/move-top.js"></script>
    <script type="text/javascript" src="/resources/js/easing.js"></script>
    <script type="text/javascript">
    
    	document.domain = "roomguidebook.tk";
	
		 function goPopup(){
		        var pop = window.open("addressPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		    }
		
		function jusoCallBack(roadFullAddr,zipNo){
					$("#joinAddress").attr("value", String(roadFullAddr));
			}
		
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1200);
            });
        });
        
        
        function registerMember(){
        	var id = document.getElementsByName("id")[0].value;
        	var password = document.getElementsByName("password")[0].value;
        	var name = document.getElementsByName("name")[0].value;
        	var phoneNum = document.getElementsByName("phoneNum")[0].value;
        	var address = document.getElementsByName("address")[0].value;
        	var email = document.getElementsByName("email")[0].value;
        	
        	
        	if(id != "" && password != "" && name != "" && phoneNum != "" && address != "" && email != ""){
        		if(confirm("회원가입을 진행하시겠습니까?")){
        			var registerForm = document.registerForm;
                	registerForm.action = "registerMember";
                	registerForm.method = "post";
                	registerForm.submit();
        		}
        	}else{
        		alert("필수 항목이 누락되었습니다.");
        	}
        	
        }
    </script>
    
    <!---//move-top-top---->
</head>


<body>
    <!--- start-content---->
    <div class="content product-box-main">
        <div class="wrap">
          
            <div class="inner_join">
                <div class="join_form">
    
                    <form name = "registerForm" id="authForm">
                        <input type="hidden" name="redirectUrl">
                        <fieldset>
                        <legend class="screen_out">회원가입 정보 입력폼</legend>
                        <div class="box_join">
                            <div class="inp_text">
                            <label for="joinId" class="screen_out">아이디</label>
                            <input type="text" id="joinId" name="id" placeholder="ID" >
                            </div>
                            <div class="inp_text">
                            <label for="joinPw" class="screen_out">비밀번호</label>
                            <input type="password" id="joinPw" name="password" placeholder="Password" >
                            </div>
                            <div class="inp_text">
                            <label for="joinName" class="screen_out">이름</label>
                            <input type="text" id="joinName" name="name" placeholder="Name" >
                            </div>
                            <div class="inp_text">
                            <label for="joinPhoneNum" class="screen_out">전화번호</label>
                            <input type="text" id="joinPhoneNum" name="phoneNum" placeholder="Phone Number" >
                            </div>
                            <div class="inp_text">
                            <label for="joinAddress" class="screen_out">주소</label>
                            <input type="text" id="joinAddress" name="address" placeholder="Address" readonly>
                            <a class="find" href ="javascript:goPopup();">찾기</a>
                            </div>
                            <div class="inp_text">
                            <label for="joinEmail" class="screen_out">이메일</label>
                            <input type="text" id="joinEmail" name="email" placeholder="E-Mail" >
                            </div>
                        </div>
    
                        <button type="button" class="btn_join" onclick="registerMember();">회원가입</button>
                     
                        </fieldset>
                    </form>
                    
                </div>
            </div>

            <div class="clear"> </div>
        </div>
    </div>
    <!---- start-bottom-grids---->
    <div class="bottom-grids">

        <div class="bottom-bottom-grids">

        </div>
    </div>
    <!---- //End-bottom-grids---->
    <!--- //End-content---->
    <!---start-footer---->
    <div class="footer">
        <div class="wrap">
            <div class="footer-left">
                <ul>
                    <li><a href="#">RoomGuideBook</a> <span> </span></li>
                </ul>
            </div>

            <div class="clear"> </div>
        </div>
    </div>
    <!---//End-footer---->
    <!---//End-wrap---->
</body>
	
</html>