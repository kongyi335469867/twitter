<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>用户中心</title>
    <link rel="stylesheet" type="text/css" href="css/BasicStyle.css"><!--后台页面基本样式-->
    <link rel="stylesheet" type="text/css" href="css/memberCenter.css"><!--后台用户中心页面样式-->
  </head>
  <body class="bd">
  	<!--%
		String allow = (String)session.getAttribute("ALLOW");
		if("allow".equals(allow)){
	%-->
	<div class="container">
		<div class="header">
			<div class="search">
				<input type="text" id="searchBar" placeholder="输入搜索内容...">
				<input type="button" value="搜索" name="searchBtn" class="searchBtn">
			</div>
			<div class="sort">
				<input type="button" value="按最近登录时间排序" name="sortBtn" class="sortBtn">
			</div>
			<div class="clear"></div>
		</div>
		<div class="box">
			<ul id="lists">
			
				<!-- li元素创建模块 -->
				<li class="list">
					<div class="headPortrait"><img src="img/1.jpg"></div>
					<div class="userName">邱奕辉</div>
					<div class="registrationName">@kong</div>
					<div class="loginTime">最近登录时间：2018-08-24 15:47:20</div>
					<div class="shutdown">
						<input type="button" value="停封" name="shutdownBtn" class="shutdownBtn">
					</div>
				</li>		
						
			</ul>
			<div class="noContent">
			没有相关内容！
			</div>
		</div>
		<div class="clear"></div>
		<div class="pagination">
			<a href=""><div class="prev">上一页</div></a>
			<ul class="pages">
				<a href="">
					<li class="li1 first">1</li>
				</a>
				<a href="">
					<li class="li2">2</li>
				</a>
				<a href="">
					<li class="li3">3</li>
				</a>
			</ul>
			<a href=""><div class="next">下一页</div></a>
		</div>
	</div>
	<!--%
		}else{
			response.sendRedirect("backstageError.jsp");  //重定向到提示无权利访问页面
		}
	%-->
  </body>
</html>
