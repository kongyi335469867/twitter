<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<title>访问出错</title>
	<link rel="stylesheet" type="text/css" href="css/BasicStyle.css">
	<style rel="stylesheet">
		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
		.bd{
			background-color: #f2f2f2;
			position: relative;
		}
		#container{
			position: fixed;
			left: 30px;
			right: 30px;
			top: 30px;
			bottom: 30px;
			height: 500px;
			background-color: #fff;
			border: 1px solid #ccc;
			border-radius: 15px;
		}
		#box{
			text-align: center;
			color: #aaa;
			font-size: 40px;
			margin-top: 12%; 
		}
	</style>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var height = $(document).height()-0px;
			$("#container").css("height",height);
		});
	</script>
</head>
<body class="bd">
	<div id="container">
		<div id="box">
			o(╥﹏╥) o 出错啦！<br/>
			无相关访问权限！<br/>
			请使用正确方式进行登录访问...
		</div>
	</div>
</body>
</html>