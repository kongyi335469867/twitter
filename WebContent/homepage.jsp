<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>首页显示</title>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/BasicStyle.css"><!--后台页面基本样式-->
	<link rel="stylesheet" type="text/css" href="css/homepage.css" /><!--后台首页显示页面样式-->
	<script type="text/javascript" src="js/homepage.js"></script><!--控制首页内容js-->
	<script type="text/javascript" src="js/highcharts.js"></script><!--控制图表js-->
</head>
<body class="bd">
	<!--%
		String allow = (String)session.getAttribute("ALLOW");
		if("allow".equals(allow)){
	%-->
	<div id="box">
		<!--欢迎语-->
		<div id="welcome">
			<div id="username">您好，</div>
			<div id="welcomeToBackstage">欢迎登录推特后台！</div>
		</div>
		<!--时间显示-->
		<div id="time">
			<div id="date">
				<div id="week"></div>
				<div id="today">
					<span id="year" style="font-size: 23px;"></span><span id="month"></span>
				</div>
			</div>
			<div id="hour">
				<div id="hourtime">
					<span id="hours"></span>:<span id="min"></span>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<!--统计数据-->
		<script type="text/javascript">
			var onlineNum = 0;  /*在线人数*/
			$(function() {
				$(document).ready(function() {
					Highcharts.setOptions({
						global:{
							useUTC : false
						}
					});
					var chart;
					$('#message').highcharts({
						chart:{
							type: 'spline',
							animation: Highcharts.svg,                
							marginRight: 10,
							events: {
								load: function() {
									var series = this.series[0];
									setInterval(function() {
										var x = (new Date()).getTime(),         
											y = onlineNum * 1;
										series.addPoint([ x, y ], true, true);
									}, 1000);
								}
							}
						},
						title:{ text: '实时在线人数' },
						xAxis:{
							type: 'datetime',
							tickPixelInterval: 100
						},
						yAxis:{
							title:{
								text: '在线人数'
							},
							plotLines:[ {
								value: 0,
								width: 1,
								color: '#808080'
							} ]
						},
						tooltip:{
							formatter: function() {
								return '<b>' + this.series.name + '</b><br/>' +
									Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
									Highcharts.numberFormat(this.y, 2);
							}
						},
						legend: { enabled: false },
						exporting: { enabled : false },
						series: [ {
							name: '即时在线人数',
							data: (function() {
								var data = [],
									time = (new Date()).getTime(),
									i;
								for (i = -19; i <= 0; i++) {
									data.push({
										x : time + i * 1000,
										y : onlineNum * 1
									});
								}
								return data;
							})()
						} ]
					});
				});
			});
			/* AJAX自动刷新获取数据 */
			function ajaxRefresh(){
				$.ajax({
					url:'BackstagePageCtrl?str=ajaxRefresh',
					type:'POST',
					async:true,  /*默认本身异步，false为同步请求*/
					success:function(response){
						var str = response.split("-");
						$(".counter:eq(0)").html(str[0]);
						$(".counter:eq(1)").html(str[1]);
						$(".counter:eq(2)").html(str[2]);
						$(".counter:eq(3)").html(str[3]);
						onlineNum = str[0];
					},
					error:function(responce){
						console.log("提示：ajax获取数据出错误了！");
					}
				});
			}
			
			window.setInterval(function(){
				ajaxRefresh();
			}, 2000);   
		</script>
		<div id="detail">
			<div class="card" style="background: dodgerblue">
				<div class="word online">在线人数：</div>
				<span class="icon online_icon"><i class="iconfont">&#xe64b;</i></span>
				<span class="counter" id="onlineNum">0</span>
			</div>
			<div class="card" style="background: #ea6f5a">
				<div class="word page_view">今日访问量：</div>
				<span class="icon page_view_icon"><i class="iconfont">&#xe5bf;</i></span>
				<span class="counter" id="visitsNum">0</span>
			</div>
			<div class="card" style="background: mediumpurple ">
				<div class="word tweets">推文数：</div>
				<span class="icon tweets_icon"><i class="iconfont">&#xe64c;</i></span>
				<span class="counter" id="tweetsNum">0</span>
			</div>
			<div class="card" style="background: coral">
				<div class="word overall">总人数：</div>
				<span class="icon overall_icon"><i class="iconfont">&#xe63c;</i></span>
				<span class="counter" id="overallNum">0</span>
			</div>
		</div>
		<!--实时在线人数图表位处-->
		<div id="message"></div>
	</div>
	<!--%
		}else{
			response.sendRedirect("backstageError.jsp");  //重定向到提示无权利访问页面
		}
	%-->
</body>
</html>
