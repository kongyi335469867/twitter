<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE HTML>
<html lang="en">
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>推文中心</title>
    <link rel="stylesheet" type="text/css" href="css/BasicStyle.css"><!--后台页面基本样式-->
    <link rel="stylesheet" type="text/css" href="css/tweetCenter.css"><!--后台推文中心页面样式-->
  </head>
  <body class="bd">
  	<%
  		List<String[]> tweetsList = (List<String[]>)request.getAttribute("TWEETS_LIST");  /*推文内容*/
  		int tweetsPageCount = (Integer)request.getAttribute("TWEETS_PAGE_COUNT");   /*推文总数*/
  		int tweetsPageNow = (Integer)request.getAttribute("TWEETS_CURRENT_PAGE");  /*当前页面*/
  		String deleteResult = (String)request.getAttribute("DELETE_RESULT");  /*推文删除结果*/
  		String noContent = (String)request.getAttribute("T_NOCONTENT"); //暂无推文相关内容提示

  		String allow = (String)session.getAttribute("ALLOW");
		if("allow".equals(allow)){
	%>
	<div class="container">
		<div class="header">
			<form action="BackstagePageCtrl?str=tweetCenter&tsearch=tsearch" method="post">
			<div class="search">
				<input type="text" id="searchBar" name="tsearchUrealname" placeholder="输入用户名进行搜索内容..." />
				<input type="submit" value="搜索" class="searchBtn" />
			</div>
			</form>
			<div class="deleteBatches">
				<input type="button" value="批量删除" id="deleteBatchesBtn" class="deleteBatchesBtn" />
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
					<%
						for(String[] tweet : tweetsList){
					%>
					<tr bgcolor="#F9F9F9" class="row">
						<td><input type="checkbox" name="checkitem" value="<%=tweet[4] %>"></td>
						<td>
							<div class="images"><img src="${pageContext.request.contextPath}/img/<%=tweet[3] %>" alt="头像" style="font-size: 6px;"></div>
							<div class="name">
								<div class="userName"><%=tweet[1] %></div>
								<div class="registrationName">@<%=tweet[2] %></div>
							</div>
							<div class="clear"></div>
						</td>
						<td>
							<div class="publishingContent"><%=tweet[5] %></div>
						</td>
						<td>
							<div class="publishedTime"><%=tweet[6] %></div>
						</td>
						<td><input type="button" value="删除" name="deleteBtn" class="deleteBtn" 
							onclick="javascript:window.location.href='BackstagePageCtrl?str=tweetCenter&deleteTid=<%=tweet[4] %>'"/></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
			<%
				if("1".equals(deleteResult)){
			%>
				<script type="text/javascript">
					alert("删除此条推文成功！"); 
				</script> 
			<%
				}else if("0".equals(deleteResult)){
			%>
				<script type="text/javascript">
					alert("删除此条推文失败！");
				</script> 
			<%
				}
			%>
			<div class="noContent">
				<p>o(╥﹏╥) o </p>
				<p>暂无相关内容！</p>
			</div>
			<%
				if("[]".equals(noContent)){
			%>
				<script type="text/javascript">
					document.getElementsByClassName("box")[0].style.cssText = "display:none;";
					document.getElementsByClassName("noContent")[0].style.cssText = "display:block;";
				</script> 
			<% 		
				}else{
			%>
				<script type="text/javascript">
					document.getElementsByclassName("box")[0].style.cssText = "display:block;";
					document.getElementsByClassName("noContent")[0].style.cssText = "display:none;";
				</script> 
			<% 	
				}
			%>
		</div>
		<div class="pagination">
		<%
		if(tweetsPageCount == 0){
		%>
			<div class="empty"></div>
		<%
		}else if(tweetsPageCount == 1){
		%>		
			<div class="pages pages1">
				<a href="BackstagePageCtrl?tweetsCurrentPage=1" class="page page1">1</a>
			</div>
		<%
			}else if(tweetsPageCount == 2){
		%>
			<a href="BackstagePageCtrl?str=tweetCenter&tweetsCurrentPage=1" class="prev">上一页</a>
			<div class="pages pages2">
				<a href="BackstagePageCtrl?str=tweetCenter&tweetsCurrentPage=1" class="page page1">1</a>
				<a href="BackstagePageCtrl?str=tweetCenter&tweetsCurrentPage=2" class="page page2">2</a>
			</div>
			<a href="BackstagePageCtrl?tweetsCurrentPage=2" class="next">下一页</a>
		<%
			}else {
				if(tweetsPageNow != 1){
		%>
					<a href="BackstagePageCtrl?str=tweetCenter&tweetsCurrentPage=<%=tweetsPageNow-1 %>" class="prev">上一页</a>
			<%
				}
			%>
					<div class="pages pages3">
			<%
				if(tweetsPageNow <= tweetsPageCount - 3 ){
					for(int i = tweetsPageNow; i < tweetsPageNow + 3; i++){
			%>
						<a href="BackstagePageCtrl?str=tweetCenter&tweetsCurrentPage=<%=i %>" class="page"><%=i %></a>
			<%
					}
				}else{
					for(int i = tweetsPageCount-(3-1); i <= tweetsPageCount; i++ ){
			%>
						<a href="BackstagePageCtrl?str=tweetCenter&tweetsCurrentPage=<%=i %>" class="page"><%=i %></a>
			<%
					}
				}
			%>
					</div>
			<%
				if(tweetsPageNow != tweetsPageCount){
			%>
					<a href="BackstagePageCtrl?str=tweetCenter&tweetsCurrentPage=<%=tweetsPageNow+1 %>" class="next">下一页</a>
		<%
				}
			}
		%>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			/*全选或全不选*/
		    $("#checkAll").click(function () {
		        if ($("#checkAll").prop('checked')) {
		            $("#checkAll").prop("checked", true);
		            $("input[name=checkitem]:checkbox").prop("checked", true);
		        } else {
		            $("#checkAll").prop("checked", false);
		            $("input[name=checkitem]:checkbox").prop("checked", false);
		        }
		    });
	
		    //当其中不勾选某一个选项的时候,则去掉全选复选框
		   $(":checkbox[name=checkitem]").click(function () {
		       $("#checkAll").prop('checked',
		           $(":checkbox[name='checkitem']").length == $(":checkbox[name='checkitem']:checked").length);
		   });
		   
		   // 批量选择 
		   $("#deleteBatchesBtn").click(function() { 
		       // 判断是否至少选择一项 
		       var checkedNum = $(":checkbox[name='checkitem']:checked").length; 
		       if(checkedNum == 0){
		           alert("批量删除内容提示：请选择至少一项！"); 
		           return;
		       }else{
		           if(confirm("确定要删除所选项目？")) { 
		               var checkedList = new Array(); 
		               $("input[name='checkitem']:checked").each(function() { 
		                   checkedList.push($(this).val()); 
		               });
		               // alert("checkedList: " + checkedList);
		           }
		            $.ajax({ 
		                type: "POST", 
		                url: "BackstagePageCtrl?str=ajaxDeleteBatches", 
		                data: {'tids':checkedList.toString()}, 
		                success: function(result) { 
		                    ///alert("回调成功:" + result);
		                    $("[name ='checkitem']:checkbox").attr("checked", false); 
		                    window.location.reload(); 
		                } 
		            }); 
		       }
		   });
		});
	</script>
	<%
		}else{
			response.sendRedirect("./backstageError.jsp");  //重定向到提示无权利访问页面
		}
	%>
  </body>
</html>
