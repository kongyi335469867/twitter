<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
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
  	<%
  		List<String[]> usersList = (List<String[]>)request.getAttribute("USERS_LIST"); //用户信息  
  		int usersPageCount = (Integer)request.getAttribute("USERS_PAGE_COUNT");   //总页码
  		int usersPageNow = (Integer)request.getAttribute("USERS_CURRENT_PAGE");  //当前页码
  		String noContent = (String)request.getAttribute("U_NOCONTENT");  //暂无用户相关内容提示

		String allow = (String)session.getAttribute("ALLOW");
		if("allow".equals(allow)){
	%>
	<div class="container">
		<div class="header">
			<form action="BackstagePageCtrl?str=memberCenter&usearch=usearch" method="post">
			<div class="search">
				<input type="text" id="searchBar" name="usearchUrealname" placeholder="输入用户名进行搜索用户..." required="required"/>
				<input type="submit" value="搜索" class="searchBtn" />
			</div>
			</form>
			<div class="sort">
				<input type="button" value="按最近登录时间排序" name="sortBtn" class="sortBtn" 
					onclick="javascript:window.location.href='BackstagePageCtrl?str=memberCenter&sort=usort'"/>
			</div>
			<div class="clear"></div>
		</div>
		<div class="box">
			<ul id="lists">
				<!-- li元素创建模块 -->
				<%
					for(String[] user : usersList){
				%>
				<li class="list">
					<div class="headPortrait"><img src="${pageContext.request.contextPath}/img/<%=user[4] %>" alt="头像" style="font-size: 6px;"></div>
					<div class="userName"><%=user[1] %></div>
					<div class="registrationName">@<%=user[2] %></div>
					<div class="loginTime">最近登录时间：<%=user[5] %></div>
					<div class="shutdown">
						<input type="button" value="<%=user[3] %>" class="shutdownBtn" style="background-color:<%=user[6] %>"
							onclick="javascript:window.location.href='BackstagePageCtrl?str=memberCenter&shutdown=shutdown&uid=<%=user[0] %>&ustate=<%=user[3] %>'"/>
					</div>
				</li>
				<%
					}
				%>		
			</ul>
			<div class="noContent">
				<p>o(╥﹏╥) o </p>
				<p>暂无相关内容！</p>
			</div>
			<%
				if("[]".equals(noContent)){
			%>
				<script type="text/javascript">
					document.getElementById("lists").style.cssText = "display:none;";
					document.getElementsByClassName("noContent")[0].style.cssText = "display:block;";
				</script> 
			<% 		
				}else{
			%>
				<script type="text/javascript">
					document.getElementById("lists").style.cssText = "display:block;";
					document.getElementsByClassName("noContent")[0].style.cssText = "display:none;";
				</script> 
			<% 	
				}
			%>
		</div>
		<div class="clear"></div>
		<div class="pagination">
		<%
		if(usersPageCount == 0){
		%>
			<div class="empty"></div>
		<%
		}else if(usersPageCount == 1){
		%>		
			<div class="pages pages1">
				<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=1" class="page page1">1</a>
			</div>
		<%
			}else if(usersPageCount == 2){
		%>
			<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=1" class="prev">上一页</a>
			<div class="pages pages2">
				<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=1" class="page page1">1</a>
				<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=2" class="page page2">2</a>
			</div>
			<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=2" class="next">下一页</a>
		<%
			}else {
				if(usersPageNow != 1){
		%>
					<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=<%=usersPageNow-1 %>" class="prev">上一页</a>
			<%
				}
			%>
					<div class="pages pages3">
			<%
				if(usersPageNow <= usersPageCount - 3 ){
					for(int i = usersPageNow; i < usersPageNow + 12; i++){
			%>
						<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=<%=i %>" class="page"><%=i %></a>
			<%
					}
				}else{
					for(int i = usersPageCount-(3-1); i <= usersPageCount; i++ ){
			%>
						<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=<%=i %>" class="page"><%=i %></a>
			<%
					}
				}
			%>
					</div>
			<%
				if(usersPageNow != usersPageCount){
			%>
					<a href="BackstagePageCtrl?str=memberCenter&usersCurrentPage=<%=usersPageNow+1 %>" class="next">下一页</a>
		<%
				}
			}
		%>
		</div>
	</div>
	<%
		}else{
			response.sendRedirect("./backstageError.jsp");  //重定向到提示无权利访问页面
		}
	%>
  </body>
</html>
