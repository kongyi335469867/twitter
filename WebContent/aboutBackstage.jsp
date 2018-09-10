<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.twitter.bean.Admins" %>
<!DOCTYPE HTML>
<html lang="en">
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>关于</title>
    <link rel="stylesheet" type="text/css" href="css/BasicStyle.css"><!--后台页面基本样式-->
    <link rel="stylesheet" type="text/css" href="css/aboutBackstage.css"><!--后台关于页面样式-->
  </head>
  <body class="bd">
  	<%
  		String msgResult = (String)request.getAttribute("UPDATE_RESULT");  //修改管理员信息成功提示
  		String errNewPWmsg = (String)request.getAttribute("ERRNEWPW");  //新密码与确认密码不匹配提示
  		String errNamemsg = (String)request.getAttribute("ERRNAME");  //管理员修改名已存在提示
  		String errOldPWmsg = (String)request.getAttribute("");  //管理员旧密码不匹配提示
  		
		String allow = (String)session.getAttribute("ALLOW");
		Admins adminDB = (Admins)session.getAttribute("ADMIN_DB");   //获取传递的管理员信息
		if("allow".equals(allow)){
	%>
	<div class="container">
		<div class="header">
		</div>
		<div class="contentBox">
			<div class="box">
				<div class="updateInf">修改管理员信息 > ></div>
				<hr/>
				<form action="BackstagePageCtrl?str=updateAdminInfo&aid=<%=adminDB.getAid() %>" method="post" name="updateForm">
				<table border="0" width="100%" height="auto" cellspacing="0" style="border: #ccc">
					<tr class="title">
						<th>管理员登录名:</th>
						<th>原密码:</th>
						<th>新密码(8位以上且含数字和字母):</th>
						<th>确认密码:</th>
						<th>操作:</th>
					</tr>
					<tr class="updateContent">
						<td><input type="text" class="adminName" name="adminName" placeholder="请输入管理员登录修改名..." required="required" onfocus="displayTipAdminName()" /></td>
						<td><input type="password" class="oldPW" name="oldPW" placeholder="请输入原密码..." required="required" onfocus="displayTipOldPW()" /></td>
						<td><input type="password" class="newPW" name="newPW" placeholder="请输入新密码..." required="required" onchange="checkNewPW()" onfocus="displayTipNewPW()" /></td>
						<td><input type="password" class="confirmPW" name="confirmPW" placeholder="请输入确认密码..." required="required" onchange="checkPW()" onfocus="displayTipConfirmPW()" /></td>
						<td><input type="submit" value="提&nbsp;交" ></td>
					</tr>
					<tr class="tips">
						<td><div class="tipAdminName">修改失败，修改名已存在！</div></td>
						<td><div class="tipOldPW">原密码输入错误！</div></td>
						<td><div class="tipNewPW">新密码不符合规则！</div></td>
						<td><div class="tipConfirmPW">确认密码与密码不匹配！</div></td>
						<td><div class="tipSubmit">提交失败！</div></td>
					</tr>
				</table>
				</form>
				<%
					if("true".equals(msgResult)){
				%>
					<script type="text/javascript">
						alert("修改管理员信息成功！"); 
					</script> 
				<%
					}else if("false".equals(msgResult)){
				%>
					<script type="text/javascript">
						alert("修改管理员信息失败！");
					</script> 
				<%
					}
					if("newPWBlock".equals(errNewPWmsg)){   //新密码去确认密码不符合提示
				%>
					<script type="text/javascript">
						document.getElementsByClassName("tipNewPW")[0].style.cssText = "display:block;";
					</script> 
				<%
					}else if("nameBlock".equals(errNamemsg)){  //管理员密码不存在提示
				%>
					<script type="text/javascript">
						document.getElementsByClassName("tipAdminName")[0].style.cssText = "display:block;";
					</script> 
				<%
					}else if("oldPWBlock".equals(errOldPWmsg)){  //旧密码与管理员不匹配提示
				%>
					<script type="text/javascript">
						document.getElementsByClassName("tipOldPW")[0].style.cssText = "display:block;";
					</script> 
				<%
					}
				%>
				<script type="text/javascript">
					/*检查新密码和确认密码的值是否相同*/
					function checkPW(){
						var newPW = document.updateForm.newPW.value;   //获取新密码的值
						var confirmPW = document.updateForm.confirmPW.value;   //获取确认密码的密码值
						var tipConfirmPW = document.getElementsByClassName("tipConfirmPW")[0];
						if(newPW != confirmPW){   //判断两次输入的值是否一致
							tipConfirmPW.style.cssText = "display:block;";
						}else if(newPW == confirmPW){
							tipConfirmPW.style.cssText = "display:none;";
						}
					}
					/*检查新密码是否符合规则*/
					function checkNewPW() {      //必须为字母加数字且长度不小于8位
						var newPW = document.updateForm.newPW.value;
						var tipNewPW = document.getElementsByClassName("tipNewPW")[0];
						var reg = new RegExp(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$/);
					    if(!reg.test(newPW)) {
					    	tipNewPW.style.cssText = "display:block;";
					    	return;
					    }
					}
					/*获取焦点时隐藏提示信息*/
					function displayTipAdminName(){
						document.getElementsByClassName("tipAdminName")[0].style.cssText = "display:none;";
					}
					function displayTipOldPW(){
						document.getElementsByClassName("tipOldPW")[0].style.cssText = "display:none;";
						displayTipNewPW();
					}
					function displayTipNewPW(){
						document.getElementsByClassName("tipNewPW")[0].style.cssText = "display:none;";
						displayTipConfirmPW();
					}
					function displayTipConfirmPW(){
						document.getElementsByClassName("tipConfirmPW")[0].style.cssText = "display:none;";
					}
				</script>
			</div>
			<div class="noContent">
				<p>o(╥﹏╥) o </p>
				<p>暂无相关内容！</p>
			</div>
		</div>
	</div>
	<%
		}else{
			response.sendRedirect("./backstageError.jsp");  //重定向到提示无权利访问页面
		}
	%>	
  </body>
</html>