<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>关于</title>
    <link rel="stylesheet" type="text/css" href="css/BasicStyle.css"><!--后台页面基本样式-->
    <link rel="stylesheet" type="text/css" href="css/aboutBackstage.css"><!--后台关于页面样式-->
  </head>
  <body class="bd">
  	<!--%
		String allow = (String)session.getAttribute("ALLOW");
		if("allow".equals(allow)){
	%-->
	<div class="container">
		<div class="header">
		</div>
		<div class="contentBox">
			<div class="box">
				<div class="updateInf">修改管理员信息 > ></div>
				<hr/>
				<form action="#" method="post">
				<table border="0" width="100%" height="auto" cellspacing="0" style="border: #ccc">
					<tr class="title">
						<th>管理员登录名:</th>
						<th>原密码:</th>
						<th>修改密码:</th>
						<th>确认密码:</th>
						<th>操作:</th>
					</tr>
					<tr class="updateContent">
						<td><input type="text" class="adminName" name="adminName" placeholder="请输入管理员登录修改名..." required="required"/></td>
						<td><input type="password" class="oldPW" name="oldPW" placeholder="请输入原密码..." required="required"/></td>
						<td><input type="password" class="newPW" name="newPW" placeholder="请输入新密码..." required="required"/></td>
						<td><input type="password" class="confirmPW" name="confirmPW" placeholder="请输入确认密码..." required="required" /></td>
						<td><input type="submit" value="提&nbsp;交"></td>
					</tr>
					<tr class="tips">
						<td><div class="tipAdminName"><!--管理员登录名错误！--></div></td>
						<td><div class="tipOldPW"><!--原密码输入错误！--></div></td>
						<td><div class="tipNewPW"><!--新密码不符合规则！--></div></td>
						<td><div class="tipConfirmPW"><!--确认密码与密码不匹配！--></div></td>
						<td><div class="tipSubmit"><!--提交失败！--></div></td>
					</tr>
				</table>
				</form>
			</div>
			<div class="noContent">
			没有相关内容！
			</div>
		</div>
	</div>
	<!--%
		}else{
			response.sendRedirect("backstageError.jsp");  //重定向到提示无权利访问页面
		}
	%-->	
  </body>
</html>