<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="img/index.ico" />
	<title>后台登录界面</title>
	<link rel="stylesheet" type="text/css" href="css/BasicStyle.css">
	<link rel="stylesheet" type="text/css" href="css/backstageLogin.css">
</head>
<body>
	<%
		String loginError = (String)session.getAttribute("LOGIN_ERROR");   //登录错误提示信息
	%>
	<div class="topDiv"></div>
	<div class="containerBox">
		<div class="owlPictureBox">
			<div class="head"></div>
			<div class="initial_left_hand" id="left_hand"></div>
			<div class="initial_right_hand" id="right_hand"></div>
		</div>
		<form action="BackstagePageCtrl?str=checklogin" method="post">
			<p style="padding: 30px 0px 10px; position: relative;">
				<span class="a_logo"></span>
				<input type="text" class="ipt" placeholder="管理员名" value="" name="adminname" autofocus="autofocus">
			</p>
			<p style="position: relative;">
				<span class="p_logo"></span>
				<input type="password" class="ipt" id="password" placeholder="管理员登录密码" value="" name="adminpw">
			</p>
			<div class="loginBtnBox">
				<p style="margin: 5px 35px 20px 45px;">
					<input type="submit" id="submitBtn" value="登录" />
				</p>
			</div>
		</form>
		<%
			if("loginError".equals(loginError)){
				session.removeAttribute("LOGIN_ERROR");
		%>
			<script type="text/javascript">
				alert("管理员登录名或管理员密码错误！");
			</script>
		<%
			}
		%>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			//密码输入框得到焦点
			$("#password").focus(function() {
				$("#left_hand").animate({
					left : "150",
					top : " -38"
				}, {
					step : function() {
						if (parseInt($("#left_hand").css("left")) > 140) {
							$("#left_hand").attr("class", "left_hand");
						}
					}
				}, 100);
				$("#right_hand").animate({
					right : "-64",
					top : "-38px"
				}, {
					step : function() {
						if (parseInt($("#right_hand").css("right")) > -70) {
							$("#right_hand").attr("class", "right_hand");
						}
					}
				}, 100);
			});
			//密码输入框失去焦点
			$("#password").blur(function() {
				$("#left_hand").attr("class", "initial_left_hand");
				$("#left_hand").attr("style", "left:100px;top:-12px;");
				$("#right_hand").attr("class", "initial_right_hand");
				$("#right_hand").attr("style", "right:-112px;top:-12px");
			});
		});
	</script>
</body>
</html>