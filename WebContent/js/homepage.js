/*获取时间函数*/
function getTime() {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var hour = date.getHours();
	var min = date.getMinutes();
	if (min < 10){ min = "0" + min; }
	var second = date.getSeconds();
	if (second < 10){ second = "0" + second; }
	var weekday = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
	var week = weekday[date.getDay()];

	$("#week").html(week);
	$("#year").html(year);
	$("#month").html(" 年 " + month + "月 " + day + "日");
	$("#hours").html(hour);
	$("#min").html(min + ":" + second);
	if (hour >= 5 && hour < 12)
		$("#username").html("上午好，");
	if (hour >= 12 && hour < 14)
		$("#username").html("中午好，");
	if (hour >= 14 && hour < 19)
		$("#username").html("下午好，");
	if (hour >= 19 || hour < 5)
		$("#username").html("晚上好，");
}
/*实时在线人数函数*/
function online(){
	var onlineNum = 0;
	$(function() {
		$(document).ready(function() {
			Highcharts.setOptions({
				global : {
					useUTC : false
				}
			});
			var chart;
			$('#message').highcharts({
				chart : {
					type : 'spline',
					animation : Highcharts.svg,                
					marginRight : 10,
					events : {
						load : function() {
							var series = this.series[0];
							setInterval(function() {
								var x = (new Date()).getTime(),         
									y = onlineNum * 1;
								series.addPoint([ x, y ], true, true);
							}, 1000);
						}
					}
				},
				title : {
					text : '实时在线人数'
				},
				xAxis : {
					type : 'datetime',
					tickPixelInterval : 100
				},
				yAxis : {
					title : {
						text : '在线人数'
					},
					plotLines : [ {
						value : 0,
						width : 1,
						color : '#808080'
					} ]
				},
				tooltip : {
					formatter : function() {
						return '<b>' + this.series.name + '</b><br/>' +
							Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
							Highcharts.numberFormat(this.y, 2);
					}
				},
				legend : {
					enabled : false
				},
				exporting : {
					enabled : false
				},
				series : [ {
					name : '即时在线人数',
					data : (function() {
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
}
/*窗口加载*/
window.onload = function() {
	getTime();
	online();
}
window.setInterval("getTime()", 1000);