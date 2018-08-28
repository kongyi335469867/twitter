<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="img/index.ico">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mycss.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/jquery-1.4.4.min.js"></script>
    <script src="js/reveal-it.js"></script>
    <script src="js/jQuery-3.3.2.js"></script>
    
    <script>
    $(document).ready(function(){
        $(".shang").click(function(){
            $("#listlist").slideToggle("slow");
        });
    });
</script>
<style>

</style>
</head>
<body>
<div class="master">
    <div>
        <ul class="navigat">
            <li><span class="glyphicon glyphicon-home"></span><span
                    class="page">主页</span></li>
            <li><span class="glyphicon glyphicon-bell"></span><span
                    class="page">通知</span></li>
            <li><span class="glyphicon glyphicon-comment"></span><span
                    class="page">私信</span></li>
        </ul>
</div>

    <!--那只鸟-->
    <div>
        <img class="logo" src="img/index.ico" title="点击置顶" onclick="Topfun()">
        <!--搜索框-->
        <div id="search">
            <input type="text" class="search" id="search-two"
                    placeholder="搜索teitter用户"><span
                class="glyphicon glyphicon-search sea" id="chaxun"
                style="color:gray;font-size: 15px;margin-top:1px">
        </span>

        <div class="triangle shang" id="souxianshishang"></div>
        <div id="souxianshi"></div>
            <div class="personalphoto" id="personalphoto"
                 style="background-size:31px 31px;background:url(../img/index.png)"></div>
    <div id="listlist">
        <div style="cursor: pointer;" id="self">
            <div id="uname" style="font-weight: bold; color:black;margin-top:5px;margin-left:18px;font-size:20px">用户名</div>
            <div style="color:gray;margin-left:20px;font-size:15px">姓名</div>
    </div>
<hr>
        <div class="listd" style="margin-top: 5px; color: black;background-color: white">
            <div>
                <span class="glyphicon glyphicon-user"style="margin-right: 10px"></span>个人资料
            </div>
            </div>
            <div class="listd">
						<span class="glyphicon glyphicon-list-alt"
                              style="margin-right: 10px"></span>列表
            </div>
            <!--<hr>-->
            <div class="listd">
                <span class="glyphicon glyphicon-share" style="margin-right: 10px"></span>Twitter广告
            </div>
            <div class="listd">
						<span class=" glyphicon glyphicon-stats"
                              style="margin-right: 3px"></span>分析
            </div>
            <!--<hr>-->
            <div class="listd">设置与隐私</div>
            <div class="listd">帮助中心</div>
            <div class="listd">键盘快捷键</div>
            <div class="listd">登出</div>
        </div>
        </div>

        <!--发推-->
            <button id="tweetout" class="button btn btn-info">
                <span class="glyphicon glyphicon-send edit"></span>
                <span class="bian fa">发推</span>
            </button>
        </div>
    <div id="mymodal" class="modal">
        <!--弹窗内容-->
        <div id="popup">
            <div class="title">
                <p data-title="撰写新推文"></p>
                <span class="close">&times;</span>
            </div>
            <form action="" method="post" id="mytweettwo"
                  enctype="multipart/form-data">
                <div class="cont">
                <textarea id="tweet2" class="wen xinxian" name="tuiwen"
                          placeholder="有什么新鲜事？" style="max-height:360px;width:540px"></textarea>
                    <div class="bq bq2"></div>

                    <div class="thing add">
                        <span class="glyphicon glyphicon-camera addThing addx" title="点击选择图片"></span> <span
                            class="glyphicon glyphicon-picture addThing addx" title="没有实现"></span> <span
                            class="glyphicon glyphicon-stats addThing addx" title="没有实现"></span> <span
                            class="glyphicon glyphicon-map-marker addThing addx" title="没有实现"></span>
                        <button class="button but but_lu  btn btn-info" id="submittwo"
                                type="button">
                            <span class="glyphicon glyphicon-send edit_lu"></span>
                        <span
                                class="bian fa_lu">发推</span>
                        </button>
                    </div>
                    
                    <div class="zishu zishu_lu"><i>140</i></div>
                    
			</div>
                </form>
                </div>
        </div>


    </div>
<button class="btn btn-info" id="alterbg">点击修改背景图</button>
<form action="" method="post" id="updatebg"
      enctype="multipart/form-data">
    <input id="uppic" type="file" accept="image/*" name="picpath" />
</form>
添加修改图片
    <div id="bg">
        <img src="#"style="width: 1349px"height="300px">
    </div>


<!--设置中间推文关注者那部分-->
<div id="bodytwo">
    <div id="bigphoto">
        <img id="bigbigtouxiang" style="width:200px; height: 200px"
             src="" />
    </div>

    <div id="body">
        <!--中间关注者部分-->
        <div id="littleloader">
            <ul id="secondloader">
                <li>
                    <div>推文</div>
                    <div class="datadetail" id="tweetnum">${info.utweet}</div>
                </li>
                <li>
                    <div>正在关注</div>
                    <div class="datadetail">${info.ufollow}</div>
                </li>
                <li>
                    <div>关注者</div>
                    <div class="datadetail">${info.ufans}</div>
                </li>
            </ul>
            <div>
                <div class="big-link" data-reveal-id="gaiziliao"
                     data-animation="fade">
                    <button class="btn btn-default" id="editdata">编辑个人资料</button>
                </div>
            </div>

            <div id="gaiziliao" class="reveal-modal"
                 style="position:fixed;top:100px;left: 625px; border: 1px solid gold">
                <div class="close-reveal-modal" id="close-reveal"></div>
                <div style="background-color: #337ab7;font-size: 18px;
						color:white;font-weight: bold;position: relative;
						left: -40px;top:-30px;border-top-left-radius:5px;text-align: center;width: 620px;padding-top: 20px;
						padding-bottom: 20px;border-top-right-radius: 5px;">修改个人资料</div>
                <div style="margin-bottom: 20px;">
                    <span style="margin-right: 2px;">真实姓名：</span><input class="txt" type="text" id="name" /><span class="check"></span>
                </div>
                <div style="margin-bottom: 30px;">
                    <span>用户名：</span>
                    <span style="z-index:2;padding:1px 3px;height: 28px;line-height: 28px;font-size: 18px;"></span>
                    <input class="txt" type="text" style="margin-left: 0px" id="txt" /><span
                        class="check"></span>
                </div>
                <div id="date" style="margin-top: 20px;">

                    <form  style="margin-top: 20px;" name="date">
                        <span>出生日期：</span>
                        <select name="year" onchange="selectYear(this.value)">
                            <option value="">选择 年</option>
                        </select>
                        <select name="month" onchange="selectMonth(this.value)">
                            <option value="">选择 月</option>
                        </select>
                        <select name="day">
                            <option value="">选择 日</option>
                        </select>
                    </form>


                <div style="color:black;padding-top: 30px;">简介：</div>
					<textarea
                            style="width:540px;margin:10px 0;border-radius: 5px;border:1px solid rgb(164, 217, 249) ;padding:5px"
                            placeholder="介绍你自己..." id="shangchuanabout"></textarea>
                <div style="margin-left: 420px;margin-top: 15px;">
                    <button class="btn btn-info" id="baocunxiugai"
                            onclick="baocunxiugai()">保存</button>
                    <button class="btn btn-default" id="quxiaoxiugai"
                            onclick="guanbixiugai()">取消</button>
                </div>
            </div>
        </div>

        <div id="classdetail">
            <div id="firstclass">
                <div id="rname">${user.urealname }</div>
                <div id="aitename">@${user.uaite }</div>
                <div id="infos">
                    <ul>
				<c:if test="${info.uabout != null }">
					<li class="info">${info.uabout }</li>
								<br>
								<br>
							</c:if>
                    

                        <li class="info"><span
                                class="glyphicon glyphicon-map-marker"></span>中华人民共和国</li>
                        <li class="info" style="margin-left: 1.5px;"><span
                                class="glyphicon glyphicon-calendar"></span>加入与<fmt:formatDate
								value="${user.utime }" pattern="yyyy年M月" type="both" /></li>
							<c:if test="${info.udate != null }">
								<li class="info"><span class="glyphicon glyphicon-heart"></span>生于
									<fmt:formatDate value="${info.udate }" pattern="yyyy年M月d日"
				           		type="both" /></li>
							</c:if>
                    </ul>
                </div>
            </div>
            <div id="secondclass">
                <div class="recommendtwo">
                    <ul id="loaderto">
                        <li>推文</li>
                        <li>推文与回复</li>
                    </ul>
                </div>
                <div id="content"></div>
                <div id="jiazai">
                    <img src="img/loader.gif" />
                </div>
                <div id="back" style="margin-bottom: 30px;margin-top: 1px">
                    <img src="img/index.ico" onclick="Topfun()" /><br> <span
                        style="margin-left:256px;">返回顶层↑</span>
                </div>
            </div>
				<div id="shanchukuang">
					<div
						style="color:black;font-size: 16px;margin-bottom: 10px;margin-top: 18px">确认删除该推文？</div>
					<div>
						<input type="hidden" />
						<button id="querenshan" class="btn btn-info" style="width: 80px">确认</button>
						<button id="quxiaoshan" class="btn btn-default "
							style="width: 80px">取消</button>
					</div>
				</div>
            <div id="thirdclass">
<!--//推荐关注-->
                <div id="recommend">
                    <div class="concern" style="color:black">
                        推荐关注<span style="font-size:13px;font-weight: normal;">
                        <a style="cursor: pointer;" id="shuaxintj">刷新</a>
							</span>
                    </div>
                    <div id="addtuijian"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script >

//推特
// 获取弹窗
var modal = document.getElementById('mymodal');
// 打开弹窗的按钮对象
var btn = document.getElementById("tweetout");
// 获取 <span> 元素，用于关闭弹窗
var span = document.querySelector('.close');
// 点击按钮打开弹窗
btn.onclick = function() {
    modal.style.display = "block";
}
// 点击 <span> (x), 关闭弹窗
span.onclick = function() {
    modal.style.display = "none";
}
// 在用户点击其他地方时，关闭弹窗
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

    function dateStart()
    {
        //月份对应天数
        MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        //给年下拉框赋内容
        var y  = new Date().getFullYear();
        for (var i = (y-50); i < (y+50); i++) //以今年为准，前50年，后50年
            document.date.year.options.add(new Option(" "+ i +" 年", i));
        //给月下拉框赋内容
        for (var i = 1; i < 13; i++)
            document.date.month.options.add(new Option(" " + i + " 月", i));
        document.date.year.value = y;
        document.date.month.value = new Date().getMonth() + 1;
        var n = MonHead[new Date().getMonth()];
        if (  new Date().getMonth() ==1 && IsPinYear(yearvalue)  )
            n++;
        writeDay(n); //赋日期下拉框
        document.date.day.value = new Date().getDate();
    }
    if(document.attachEvent)
        window.attachEvent("onload", dateStart);
    else
        window.addEventListener('load', dateStart, false);
    function selectYear(str) //年发生变化时日期发生变化(主要是判断闰平年)
    {
        var monthvalue = document.date.month.options[document.date.month.selectedIndex].value;
        if (monthvalue == "")
        {
            var e = document.date.day;
            optionsClear(e);
            return;
        }
        var n = MonHead[monthvalue - 1];
        if (  monthvalue ==2 && IsPinYear(str)  )
            n++;
        writeDay(n);
    }
    function selectMonth(str)   //月发生变化时日期联动
    {
        var yearvalue = document.date.year.options[document.date.year.selectedIndex].value;
        if (yearvalue == "")
        {
            var e = document.date.day;
            optionsClear(e);
            return;
        }
        var n = MonHead[str - 1];
        if (  str ==2 && IsPinYear(yearvalue)  )
            n++;
        writeDay(n);
    }
    function writeDay(n)   //据条件写日期的下拉框
    {
        var e = document.date.day; optionsClear(e);
        for (var i=1; i<(n+1); i++)
            e.options.add(new Option(" "+ i + " 日", i));
    }
    function IsPinYear(year)//判断是否闰平年
    {
        return(  0 == year%4 && ( year%100 !=0 || year%400 == 0 )  );
    }

    
    
//点击其他地方消失
    function optionsClear(e)
    {
        e.options.length = 1;
    }
    $("#editdata").on("click",function(e){
        var $wx=$(".reveal-modal"),_winW=$(window).width(),_winH=$(window).height(),_winScrollT=$(window).scrollTop(),_winScrollL=$(window).scrollLeft();
        $wx.css({"display":"block"});
        e.stopPropagation();
        $wx.on("click",function(e){
            e.stopPropagation();
        });
        $("body").one("click",function(e){
            $(".reveal-modal").css("display","none");
        });
    });

    $(document).ready(function(){
        $("#quxiaoxiugai").click(function(){
            $(".reveal-modal").hide();
        });
        $("#editdata").click(function(){
            $(".reveal-modal").show();
        });

        $(".glyphicon-user").click(function(){
           $(".reveal-modal").show();
        });
    });

    $(document).ready(function(){
        $("#quxiaoxiugai").click(function(){
            $(".reveal-modal").hide();
        });
        $("#tweetout").click(function(){
            $("#popup").show();
        });

        $(".glyphicon-user").click(function(){
            $(".reveal-modal").show();
        });
    });
    
    //导航
    	$("#navigat li").on({
		mouseover : function() {
			$(this).css("borderBottom", "5px solid " + color);
			$(this).css("color", color);
		},
		mouseout : function() {
			$(this).css("borderBottom", "");
			$(this).css("color", "rgba(102,107,117,1.00)");
		}
	});
	$("#navigat li:eq(0)").on({
		click : function() {
			location = "main.jsp";
		}
	});
	$("#navigat li:eq(1)").click(function() {
		location = "notify.jsp";
	});
	$("#navigat li:eq(2)").click(function() {
		window.open("message.jsp");
	});
	$(".button").on({
		mouseover : function() {
			$(this).css("backgroundColor", "rgb(0, 109, 191 ,1.00)");
		},
		mouseout : function() {
			$(this).css("backgroundColor", " rgba(29, 161, 241, 1.00)");
		}
	});
	
	
	 $(document).click(function(e) {
	        e = window.event || e; // 兼容IE7
	        obj = $(e.srcElement || e.target);
	        if ($(obj).is("#touxiang") || ((e.pageX >= 1035 && e.pageX <= 1165) && (e.pageY >= 50 && e.pageY <= 311))) {

	        } else {
	            $("#list").fadeOut(10);
	        }
	    });
	    $("#secondloader li:eq(0)").css("borderBottom", "4px solid " + color);
	    $("#secondloader li:eq(0)").find(".datadetail").css("color", color);
	    $("#secondloader li").on({
	        mouseover : function() {
	            $(this).css("borderBottom", "4px solid " + color);
	            $(this).find(".datadetail").css("color", color);
	        },
	        mouseout : function() {
	            $(this).css("borderBottom", "0px solid " + color);
	            $(this).find(".datadetail").css("color", "#657786");
	            $("#secondloader li:eq(0)").css("borderBottom", "4px solid " + color);
	            $("#secondloader li:eq(0)").find(".datadetail").css("color", color);
	        }
	    });
	    $("#secondloader li:eq(1)").on({
	        click : function() {
	            location = "search.jsp?word=&fw=1";
	        }
	    });
	    $("#secondloader li:eq(2)").on({
	        click : function() {
	            location = "search.jsp?word=&fw=2";
	        }
	    });
	    $("#editdata").on({
	        mouseover : function() {
	            $(this).css("backgroundColor", color);
	            $(this).css("color", "white");
	        },
	        mouseout : function() {
	            $(this).css("backgroundColor", "white");
	            $(this).css("color", "#657786");
	        },
	        click : function() {

	            $(".check:eq(0)").html("");
	            $(".check:eq(1)").html("");
	            $(".txt:eq(0)").val("${user.urealname}");
	            $(".txt:eq(1)").val("${user.uaite}");
	            $("#shangchuanabout").val("${info.uabout}");
	            var brithday = "${info.udate }";
	            var str1 = brithday.split(" ");
	            var str2 = str1[0].split("-");
	            /* $("#year option[value='" + str2[0].trim() + "年']").attr("selected", true);
	             $("#month option[value='" + str2[1].trim() + "月']").attr("selected", true);
	             $("#days option[value='" + str2[2].trim() + "日']").attr("selected", true); */
	            $("#year option:selected").html(str2[0].trim() + "年")
	            $("#month option:selected").html(str2[1].trim() + "月")
	            $("#days option:selected").html(str2[2].trim() + "日")
	            checkname();
	            $(".txt:eq(0)").focus();
	        }
	    });

	    
	    $(".listd").on({
	        mouseover : function() {
	            $(this).css("backgroundColor", color);
	            $(this).css("color", "white");
	        },
	        mouseout : function() {
	            $(this).css("backgroundColor", "white");
	            $(this).css("color", "black");
	        }
	    });

	    $(".listd:first").click(function() {
	        window.reload();
	    });

	    $(".listd:last").click(function() {
	        location = "user.do?method=exit";
	    });
</script>
<script>

$(".addThing").on({
    mouseover : function() {
        $(this).css("color", "#657786");
    },
    mouseout : function() {
        $(this).css("color", color);

    }
});



$(".wen").bind('input oninput', function() {
    var zishu = 140 - $(this).val().length;
    $(".zishu").html(zishu);

    if (zishu < 0) {
        $(".zishu").css("color", "lightcoral");
        $(".zishu").css("fontWeight", "bold");
        $(".wen").css("color", "lightcoral");
        $(".but").attr("disabled", "true");
    } else {
        $(".zishu").css("color", "#657786");
        $(".zishu").css("fontWeight", "");
        $(".wen").css("color", "black");
        $(".but").removeAttr("disabled");
        if ($(this).val() == "") {
            $(".but").attr("disabled", "true");
        } else {
            $(".but").removeAttr("disabled");
        }
    }
});
$(".wen").on({
    blur:function(){
        if ($(this).val() == "" || $(this).val().length>140) {
            $(".but").attr("disabled", "true");
        } else {
            $(".but").removeAttr("disabled");
        }
    }
});


//加载的
var mytwitter  =' ${pageContext.request.contextPath}';
	var number = ${info.utweet}+"";
	var one = "1";
	var zero = "0";
	var page = 0;
	var jian = 125;
	$(window).scroll(function(event) {
		$("#bodytwo").css("height","100%;");
		var winPos = $(window).scrollTop();
		if(winPos >= 400){
			$("#bg").hide();
		}else{
			$("#bg").show();
		}
		if(winPos > 0){
			$("#bg").css("filter","blur("+(winPos/50)+"px)");

		}else{
			$("#bg").css("filter","blur(0px)");

		}
		var viewH = $(this).height();
		var contentH = $("#content").get(0).scrollHeight;
		if (/* winPos == contentH-jian  */$(document).scrollTop() + $(window).height()  > $(document).height()) {
			 	jian = 114;
				page += 20;
				if ($(document).scrollTop() > 400 && $(".tuiwen").length>1) {
					$("#jiazai").show();
					jiaZai();
					if( page >= $("#tweetnum").html().trim()){
						$("#jiazai img").fadeOut();
						$("#back").fadeIn();
						jiaZai();
					}
				}
			} 
	});
	
	function jiaZai() {
		if( $("#back").css("display") == "none"){
			$('#jiazai img').fadeIn();
			var url = '/mytwitter/tweettwo.do?method=gettweets&num=one&pagenum='+page;
			$.ajax({
				url : url,
				type : 'POST',
				success : function(response, status) {
					$("#jiazai img").fadeOut();
					var tweets =$.parseJSON( response.substring(response.indexOf("["), response.length) );
					var html = addTweet(tweets);
					$("#content").append(html);
					tweetsJs();
				}
			});
		}else{
				$("#jiazai").html("<p style='color:#657786;margin-left:245px'>没有更多了哦！</p>")
				$("#jiazai img").fadeOut();
		}
	};

</script>
<script src="js/popup.js"></script>
</body>
</html>