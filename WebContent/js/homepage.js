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

/*js形式窗口加载*/
window.onload = function() {
	getTime();
}
window.setInterval("getTime()", 1000);