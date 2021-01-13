<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>

<head>
    <title>login</title>
    <link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
    <link href="/resources/css/login.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script
        type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <!----webfonts---->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!----//webfonts---->
    <!----start-alert-scroller---->
    <script src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery.easy-ticker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#demo').hide();
            $('.vticker').easyTicker();
        });
        
        var result = "${result}";
        if(result == "fail"){
        	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
        }
        
    </script>
    <!----start-alert-scroller---->
    <!-- start menu -->
    <link href="../resources/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="../resources/js/megamenu.js"></script>
    <script>$(document).ready(function () { $(".megamenu").megamenu(); });</script>
    <script src="../resources/js/menu_jquery.js"></script>
    <!-- //End menu -->
    <!---slider---->
    <link rel="stylesheet" href="../resources/css/slippry.css">
    <script src="../resources/js/jquery-ui.js" type="text/javascript"></script>
    <script src="../resources/js/scripts-f0e4e0c2.js" type="text/javascript"></script>
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
    <script type="text/javascript" src="../resources/js/move-top.js"></script>
    <script type="text/javascript" src="../resources/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1200);
            });
        });
    </script>
</head>
<body>
    <div class="content product-box-main">
        <div class="wrap">

            <div class="inner_login">
                <div class="login_form">

                    <form action="/loginPost" method="post" id="authForm">
                        <input type="hidden" name="redirectUrl">
                        <fieldset>
                            <legend class="screen_out">로그인 정보 입력폼</legend>
                            <div class="box_login">
                                <div class="inp_text">
                                    <label for="loginId" class="screen_out">아이디</label>
                                    <input type="text" id="loginId" name="id" placeholder="ID">
                                </div>
                                <div class="inp_text">
                                    <label for="loginPw" class="screen_out">비밀번호</label>
                                    <input type="password" id="loginPw" name="password" placeholder="Password">
                                </div>
                            </div>

                            <button type="submit" class="btn_login">로그인</button>
                            <div class="login_append">
                                <div class="inp_chk">
                                    <!-- 체크시 checked 추가 -->
                                    <input type="checkbox" id="keepLogin" class="inp_radio" name="keepLogin">
                                    <label for="keepLogin" class="lab_g">
                                        <span class="img_top ico_check"></span>
                                        <span class="txt_lab">로그인 상태 유지</span>
                                    </label>
                                </div>

                            </div>

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