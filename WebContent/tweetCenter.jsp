<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>推文中心</title>
    <link rel="stylesheet" type="text/css" href="css/BasicStyle.css"><!--后台页面基本样式-->
    <link rel="stylesheet" type="text/css" href="css/tweetCenter.css"><!--后台推文中心页面样式-->
  </head>
  <body class="bd">
  	<!--%
		String allow = (String)session.getAttribute("ALLOW");
		if("allow".equals(allow)){
	%-->
	<div class="container">
		<div class="header">
			<div class="search">
				<input type="text" id="searchBar" placeholder="输入搜索内容..."/>
				<input type="button" value="搜索" name="searchBtn" class="searchBtn"/>
			</div>
			<div class="sort">
				<input type="button" value="批量删除" name="sortBtn" class="sortBtn"/>
			</div>
			<div class="clear"></div>
		</div>
		<div class="contentBox">
			<div class="box">
				<table border="1" width="100%" height="auto" cellspacing="0" style="border: #ccc" id="table">
					<tr class="title">
						<th class="option">选项&nbsp;&nbsp;<input type="checkbox" name="checkAll" value="checkAll" id="checkAll"/></th>
						<th class="user">用户</th>
						<th class="content">内容</th>
						<th class="time">时间</th>
						<th class="operation">操作</th>
					</tr>
					<!-- 推文内容tr模块 -->
					<tr bgcolor="#F9F9F9" class="row">
						<td><input type="checkbox" name="checkitem" value="checkitem"></td>
						<td>
							<div class="images"><img src="img/1.jpg"/></div>
							<div class="name">
								<div class="userName">邱奕辉</div>
								<div class="registrationName">@kong</div>
							</div>
							<div class="clear"></div>
						</td>
						<td>
							<div class="publishingContent">布时间的英文翻译,发布时间英文怎么说,怎么用英语翻译发布时间,发布时间的英文意思,發布時間的英文,发布时间 meaning in English,發布時間的</div>
						</td>
						<td>
							<div class="publishedTime">2018-08-23 21:01:39</div>
						</td>
						<td><input type="button" value="删除" name="deleteBtn" class="deleteBtn" /></td>
					</tr>
				</table>
			</div>
			<div class="noContent">
				没有相关内容！
			</div>
		</div>
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
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/tweetCenter.js"></script><!--后台推文中心JS控制-->
	<!--%
		}else{
			response.sendRedirect("backstageError.jsp");  //重定向到提示无权利访问页面
		}
	%-->
  </body>
</html>
