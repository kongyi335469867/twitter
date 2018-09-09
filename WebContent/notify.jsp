<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <c:if test="${user == null }">
            <jsp:forward page="index.jsp"></jsp:forward>
        </c:if>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src=".js/jquery.animate-colors-min.js"></script>
    <script src=".js/easydialog.min.js"></script>
    <script src="js/autosize.min.js"></script>
    <script src="js/popup.js"></script>
    <style type="text/css">
        body{
            width: 1349px;
            background-color: rgba(230,236,240,1.00);
            font-size: 14px;
            height: 680px;

        }
        #loader{
            width: 100%;
            height: 46px;
            /*border: 1px solid red;*/
            background-color: white;
            position: fixed;
            z-index: 99;
            /*margin-top: -45px;*/
        }

        *{
            margin: 0;
            padding: 0;
        }
        #daohang{
            width: 300px;
            height: 38px;
            margin-left: 80px;
            margin-top: 5px;
            /*border: 1px solid red;*/
        }
        ol , ul{
            margin-top: 0;
            margin-bottom: 10px;
        }
        #daohang li{
            width: 80px;
            height: 42px;
            padding: 0 15px;
            line-height: 43px;
            cursor: pointer;
            font-size: 15px;
            /*border: 1px solid red;*/
            float: left;
        }
        li{
            list-style: none;

        }
        .glyphicon{
            position: relative;
            top: 1px;
            display: inline-block;
            font-style: normal;
            font-weight: 400;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
        }
        .bian{
            /*margin-left: 5px;*/
            position: relative;
            top: -1px;
        }
        .glyphicon-home:before{
            content: "\e021";
        }
        .glyphicon-bell:before{
            content:"\e123";
        }
        .glyphicon-comment:before{
            content: "\e111";
        }
        .tishidian{
            position: fixed;
            width: 6px;
            height: 6px;
            border-radius: 50px;
            top: 12px;
            margin-left: -10px;
            display: none;
        }
        #logo{
            background-color: rgba(255,255,255,1.00);
            height: 23px;
            width: 23px;
            position: fixed;
            top: 12px;
            left: 650px;
            cursor: pointer;
        }
        img{
            vertical-align: middle;
            border: 0;
        }
        #search{
            width: 300px;
            height: 30px;margin-left: 870px;
            margin-top: -45px;
        }
        .search{
            width: 220px;
            height: 30px;
            border: 1px solid rgba(203,203,203,1.00);
            border-radius: 25px;
            background-color: rgba(245,248,250,1.00);
            padding-right: 30px;
            padding-left: 15px;
            line-height: 30px;
            font-size: 12px;
        }
        button , input , select ,textarea{
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }
        .sea{
            width: 16px;
            height: 16px;
            cursor: pointer;
            float: left;
            position: relative;
            top: 7px;
            left:210px;
            background-color: rgba(245,248,250,1.00);
        }
        #souxianshishang{
            position: fixed;
            left: 905px;
            z-index: 99;
            margin-top: 1px;
            display: none;
        }
        .shang{
            border: 10px solid transparent;
            border-bottom-color: white;
            border-top-width: 0;
            filter: drop-shadow(.5px -.5px .5px lightslategray);
        }
        .triangle{
            display: inline-block;
            width: 0;
            height: 0;
            line-height: 0;
            z-index: 10;
        }
        #souxianshi{
            width: 330px;
            height: auto;
            background-color: white;
            box-shadow: 0 0 1.5px #657786;
            position: fixed;
            top: 49px;
            left: 885px;
            border-radius: 3px;
            display: none;
        }
        #touxiang{
            border-radius: 25px;
            position: absolute;
            right: 193px;
            top: 7px;
        }
        .touxiang{
            width: 32px;
            height: 32px;
            border: 1px solid white;
            cursor: pointer;
        }

        #list{
            width: 120px;
            height: 270px;
            z-index: auto;
            display: none;
        }

        .ss{
            position: fixed;
            top: 41px;right: 200px;
            z-index: 6;


        }

        #listlist{
            width: 180px;
            height: 360px;
            position: fixed;
            top: 51px;
            right: 185px;
            border-radius: 3px;
            box-shadow: 0 0 2.5px lightslategrey;
            z-index: auto;
            background-color: white;

        }
        .listd{
            padding: 4px 0 3px 20px;
            font-size: 15px;
            margin: 5px 0;
            cursor: pointer;
        }
        hr{
            margin:0;
        }
        .glyphicon-user:before{
            content: "\e008";
        }
        .glyphicon-list-alt:before{
            content: "\e032";
        }
        .button{
            position: absolute;
            width: 81px;
            height: 32px;
            border: none;
            color: white;
            border-radius: 3px;
            box-shadow: 0 1px 0 #ccc;
            right: 90px;
            top: 7px;.
        }
        .btn{
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            touch-action: manipulation;
            cursor: pointer;
            user-select: none;
            background-image: none;
        }
        .btn-info{
            color: #FFF;
            background-color: #5bc0dc;
            border-color: #46b8da;
        }
        .edit{
            font-size: 23px;
            position: relative;
            top: -1px;
            left: -4px;
        }
        .glyphicon-send:before{
            content: "\e171";
        }
        :after , :before{
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }
        .fa{
            font-size: 15px;
            position: relative;
            top: -6px;
            left: -2px;
        }
        #popup{
            display: none;
            opacity: 0;
            position: absolute;
            z-index: 99;
            top: 80px;
            width: 600px;
            height: auto;
            box-shadow: 0 5px 15px rgba(0,0,0,0.5);
            border-radius: 10px;
        }
        #popup .title{
            position: absolute;
            width: 100%;
            height: 45px;
            background-color: white;
            cursor: move;
            border-radius: 5px 5px 0 0;
            margin-bottom: -10px;
        }
        #popup .title p{
            padding-left: 14px;
            line-height: 55px;
            text-align: center;
            font-size: 17px;
        }

        #popup .title span:hover{
            color: black;
        }
        #popup .title span{
            position: absolute;
            top: 12px;
            right: 20px;
            width: 30px;
            height: 30px;
            color: gray;
            opacity: 2;
            font-size: 21px;
            cursor: pointer;
            text-align: center;
            border-radius: 5px;
        }
        #popup .cont{
            width: 100%;
            height: auto;
            background-color: rgba(232,245,251,1);
            min-height: 245px;
        }
        .ttt{
            position: relative;
            top: 55px;
            left: 20px;
            width: 560px;
            color: powderblue;
        }
        .tweet{
            height: auto;
            border-right: 5px;
            background-color: white;
            float: left;
        }
        .wen{
            width: 480px;
            border-radius:5px;
            border: 0 solid gray;
            z-index: 0;
            margin: 10px 0 10px 10px;
            height: 80px;
        }
        textarea{
            resize: none;
            overflow: auto;
            width: 100%;
            min-height: 80px;
            border-style: hidden;
        }
        .add{
            position: relative;
            top:20px;
            left: 20px;
        }
        .thing{
            width: 350px;
            height: 30px;
            position: relative;
            z-index: 7;

        }
        .addx{
            position: relative;
            top: 90px;
        }
        .addThing{
            width: 40px;
            height: 40px;
            font-size: 24px;
            cursor: pointer;
            padding: 8px;
            margin-right: 2px;
            position: relative;
            top: 50px;
        }
        .glyphicon-camera:before{
            content: "\e046";
        }
        .glyphicon-picture:before{
            content: "\e060";
        }
        .glyphicon-stats:before{
            content:"\e185";
        }
        .glyphicon-share:before {
            content: "\e066";
        }
        .glyphicon-map-marker:before{
            content: "\e062";
        }
        .btn.disabled, .btn[disabled], fieldset[disabled] .btn {
            cursor: not-allowed;
            filter: alpha(opacity=65);
            -webkit-box-shadow: none;
            box-shadow: none;
            opacity: .65;
        }
        button[disabled] ,html input[disabled]{
            cursor: default;
        }
        .but_lu{
            position: relative;
            left: 290px;
            top: 80px;
        }
        .but{
            width: 80px;
            height: 40px;
            position: relative;
            /*left: 235px;*/
            top: 45px;
        }
        .glyphicon-send:before{
            content: "\e171";
        }
        .zishu_lu{
            position: relative;
            left: 455px;
            top: 55px;
            color: #657786;
        }
        .zishu{
            position: relative;
            left: 445px;
            top: 80px;
            color: #657786;
            width: 50px;
            height: 30px;
            font-size: 16px;
            font-style: oblique;
        }
        #mask_shadow {
            display: none;
            opacity: 0;
            position: fixed;
            z-index: 98;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .9);
        }
    </style>
    <style type="text/css">


        *{
            margin: 0;
            padding: 0;
        }
        #body{
            width: 1180px;
            height: auto;
            margin: 60px 80px 40px;
            float: left;
        }
        #tuijian{
            width: 280px;
            height: 280px;
            background-color: white;
            box-shadow: 0 0 0.5px #e6ecf0;
            margin-left: 10px;
        }
        .guanzhu{
            font-size: 20px;
            position: absolute;
            top: 70px;
            left: 105px;
        }
        a{
            text-decoration: none;
            color: #337ab7;
            background-color: transparent;
        }

        #second{
            width: 590px;
            height: auto;
            position: absolute;
            left: 380px;
        }
        #content{
            width: 590px;
            height: 599px;
            position: absolute;
            top: -290px;
            /*border: 1px solid red;*/
        }
        #quanbu{
            width: 590px;
            height: 50px;
            background-color: white;
        }
        ul{
            margin-top: 0;
            margin-bottom: 10px;
        }
        li{
            list-style: none;
        }
        #quanbu li{
            float: left;
            height: 50px;
            line-height: 50px;
            font-size: 18px;
            font-weight: bold;
            margin-left: 20px;
            margin-right: 20px;
            cursor: pointer;
        }
        .notifications{
            width: 590px;
            height: 477px;
            background-color: white;
            margin-top: 1px;
            font-size: 16px;
        }
        a{
            text-decoration: none;
        }
        .event{
            margin: 0;

        }
        #back{
            width: 590px;
            height: 60px;
            background-color: white;
            box-shadow: 0 0 0.5px #e6ecf0;
            cursor: pointer;
            margin-top: 1px;
        }
        #back img{
            margin-left: 276px;
            margin-top: 20px;
            height: 24px;
            width: 24px;
        }
        img{
            vertical-align: middle;
            border: 0;
        }

        #third{
            width: 240px;
            height: auto;
            position: absolute;
            left: 980px;
        }
        #link{
            width: 280px;
            height: 100px;
            background-color: white;
            position: absolute;
            top: -280px;
            box-shadow: 0 0 .5px #e6ecf0;
        }
        #lianjie{
            width: 270px;
            height: 60px;
            margin: 20px 10px;
            float: left;
        }
        #lianjie li{
            float: left;
            margin-right: 9px;
            font-size: 13px;
            cursor: pointer;
            height: 20px;
            letter-spacing:.3px;
            color: gray;
        }
        #lianjie .lianjie:hover{
           color: rgb(29,161,241);
           text-decoration: underline;
        }

    </style>
</head>
<body>
<div id="loader">
    <div>
        <ul id="daohang">
            <li style="color: rgb(102,107,117);">
                <sapn class="glyphicon glyphicon-home">

                </sapn>
                <sapn class="bian">主页</sapn>
                <div class="tishidian"></div>
            </li>
            <li style="border-bottom: 5px solid rgb(29,161,241);color: rgb(29,161,241);">
            <span class="glyphicon glyphicon-bell">

            </span>
                <span class="bian">通知</span>
                <div class="tishidian"></div>
            </li>
            <li style="color: rgb(102,107,117);">
            <span class="glyphicon glyphicon-comment">

            </span>
                <span class="bian">私信</span>
                <div class="tishidian"></div>
            </li>
        </ul>
    </div>

    <div>
        <img id="logo" src="img/index.ico" data-original-title title>
        <div id="search">
            <input type="text" class="search" id="search_two" placeholder="搜索twitter用户">
            <span class="glyphicon glyphicon-search sea" id="chaxun" style="color:#657786;font-size: 15px;margin-top: 1px;"></span>
        </div>
        <div class="triangle shang" id="souxianshishang"></div>
        <div id="souxianshi"></div>

        <div class="touxiang" id="touxiang" style="background: url(img/header.jpg) 0 0 / 31px 31px;" data-original-title title>
        </div>

        <div id="list">
            <div class="triangle shang ss"></div>
            <div id="listlist">
                <div style="cursor: pointer" id="self">
                    <div id="uname" style="font-weight: bold;color: black;margin-top: 5px;margin-left: 18px;font-size: 20px;">Orange</div>
                    <div style="color: gray;margin-left: 20px;font-size: 15px;" id="aitevalue">@OrangeLove</div>
                </div>
                <hr>
                <div class="listd" style="margin-top: 10px">
                    <div>
                        <span class="glyphicon glyphicon-user" style="margin-right: 10px"></span>
                        个人资料
                    </div>
                </div>
                <div class="listd">
                    <div>
                        <span class="glyphicon glyphicon-list-alt" style="margin-right: 10px"></span>
                        列表
                    </div>
                </div>
                <hr>
                <div class="listd">
                    <div>
                        <span class="glyphicon glyphicon-share" style="margin-right: 10px"></span>
                        Twitter广告
                    </div>
                </div>
                <div class="listd">
                    <div>
                        <span class="glyphicon glyphicon-stats" style="margin-right: 10px"></span>
                        分析
                    </div>
                </div>
                <hr>
                <div class="listd">设置与隐私</div>
                <div class="listd">帮助中心</div>
                <div class="listd" id="kuaijiejian">键盘快捷键</div>
	            <div class="listd">登出</div>
            </div>
        </div>
				



        <button id="fatui" class="button btn btn-info" style="background-color: rgb(29,161,241);">
    <span class="glyphicon glyphicon-send edit">
    </span>
            <span class="bian fa">发推</span>
        </button>
    </div>
    <div id="popup" style="left: 373.5px;">
        <div class="title">
            <p style="color: black;font-weight: bold" data-original-title="撰写新推文">撰写新推文</p>
            <span class="guanguanguan">×</span>
        </div>
        <form action="" method="post" id="mytweettwo" enctype="multipart/form-data">
            <div class="cont" style="height: 200px;">
                <div class="tweet ttt" id="tuiwen2" style="box-shadow: rgb(164,217,249) 0px 0px 1px;border: 2px solid rgb(164,217,249);">
                    <textarea id="tweet2" class="wen xinxian" name="tuiwen" placeholder="有什么新鲜事？" style="max-height: 300px;border: 0 solid lightsalmon; color: rgb(29,161,241);overflow: hidden;word-wrap: break-word;width: 540px;height: 0;" autofocus="autofocus" data-autosize-on="true"></textarea>
                    <div class="bq bq2"></div>
                </div>
                <div class="thing add">
                    <span class="glyphicon glyphicon-camera addThing addx" id="addpictwo" style="color: rgb(29,161,241);" data-original-title title></span>
                    <span class="glyphicon glyphicon-picture addThing addx" style="color: rgb(29,161,241);"data-original-title title></span>
                    <span class="glyphicon glyphicon-stats addThing addx" style="color: rgb(29,161,241);" data-original-title title></span>
                    <span class="glyphicon glyphicon-map-marker addThing addx" style="color: rgb(29,161,241);" data-original-title title></span>
                    <button class="button but but_lu btn btn-info" id="submittwo" type="button" disabled="disabled" style="background-color: rgb(29,161,241);">
                        <span class="glyphicon glyphicon-send edit_lu"></span>
                        <span class="bian fa_lu">发推</span>
                    </button>
                </div>
                <div class="zishu zishu_lu">140</div>
            </div>
        </form>
    </div>
    <div id="mask_shadow" style="opacity: 0;display: none;"></div>

</div>
<!--发推文-->
<script>
    $(document).ready(function(){
        $("#fatui").click(function(){
            $("#popup").css({"opacity":"1","display":"block","z-index":"999"});
            $("#mask_shadow").css({"opacity":"1","display":"block","z-index":"100"});
        });
    });
    $(document).ready(function(){
        $(".guanguanguan").click(function(){
            $("#popup").css({"opacity":"0","display":"none","z-index":"0"});
            $("#mask_shadow").css({"opacity":"0","display":"none","z-index":"0"});
        }) ;
    });
</script>

<!--头像栏隐藏-->
<script>
    $(document).ready(function(){
        $("#touxiang").click(function () {
            $("#list").toggle();
        });
    });


</script>
    <div id="body">
        <div id="tuijian">
            <div class="guanzhu" style="color: black">
                推荐关注
                <span style="font-size: 13px;font-weight: normal">
                    <strong>·</strong>
                    <a style="cursor: pointer;" id="shuaxin">刷新</a>
                </span>
            </div>
            <div id="addtuijian" style="padding-top: 50px"></div>
        </div>
        <!--刷新推荐关注页面-->
            <script>
                $(document).ready(function(){
                    fresh();

                   function fresh(){
                      $("#tuijian").load(location.href+" #autore");

                    }
                },8000);

            </script>



        <div id="second">
            <div id="content">
                <div id="quanbu">
                    <ul>
                        <li>全部</li>
                        <li style="color: rgba(29,161,241,1.00)">提及</li>
                    </ul>
                </div>
                <div id="notify">
      
		            <!-- 查询通知     -->    
					<script>
						function chaxuntongzhi(){
							//page是通知的数量
							page = $(".notifications").length;
							if(page > 0){
								page += 1;
							}
							$.ajax({
								url: '/twitter/notify.do?method=all&page='+page,
								type: 'POST',
								success: function(response , status){
									if(response == 'none' && $(".notifications").length <1){
										var html = '<div class="notifications"><div style="margin-left: 60px;padding-bottom: 30px;padding-top: 30px">'
											+'  <div style="font-size: 28px;font-weight: bold;color: black;width: 480px">看看大家是何时关注、提及你，收藏及转推你的推文的。</div>'
											+' <div style="font-size: 15px;padding-top: 5px;color: #657786;width: 470px">从喜欢到转推等等等等，一切有关你的推文和关注者的活动都会在此发生。</div></div>'
											+' <div style="height: 290px;width: 480px;margin-left: 60px;padding-bottom: 10px;"><img src="img/concern.png" class="concern"  style="width: 30px;height: 30px;float: left;margin-left: 5px;margin-top: 15px;border-radius:20px" >'
											+'<div style="width: 410px;height: 70px;margin-left: 50px;padding-top: 10px; "><div style="font-size: 15px;color:black;"><a href="#" class="event"><b>关注者</b></a></div>'
											+'<div style="font-size: 12px;padding-top: 2px;color: #657786;">有新的关注者了？恭喜你！你会在此选项卡里面看到详情。</div></div>'
											+' <img class="like" src="img/like.png" style="width: 30px;height: 30px;float: left;margin-left: 5px;margin-top: 20px;border-radius:20px" ><div style="width: 410px;height: 70px;margin-left: 50px;padding-top: 10px;">'
											+'<div style="font-size: 15px;color:black;  "><a href="#" class="event"><b>喜欢</b></a></div><div style="font-size: 12px;padding-top: 2px;color: #657786;">当有人在你的推文点按了心形图标时，这就意味着他们觉得这条推文很赞（甚至喜爱它）。</div></div>'
											+' <img class="transfer" src="img/transfer.jpg" style="width: 30px;height: 30px;float: left;margin-left: 5px;margin-top: 25px;border-radius:20px" ><div style="width: 410px;height: 70px;margin-left: 50px;padding-top: 20px ">'
											+'<div style="font-size: 15px;color:black; "><a href="#" class="event"><b>转推</b></a></div><div style="font-size: 12px;padding-top: 2px;color: #657786;">有人分享你的推文时，你应当知道，所以，你将收到通知。</div></div>'
											+' <img class="reply" src="img/reply.jpg" style="width: 30px;height: 30px;float: left;margin-left: 5px;margin-top: 25px;border-radius:20px" ><div style="width: 410px;height: 70px;margin-left: 50px;padding-top: 20px">'
											+'<div style="font-size: 15px;color:black  "><a href="#" class="event"><b>回复</b></a></div><div style="font-size: 12px;padding-top: 2px;color: #657786;">当有人想对你的推文畅所欲言时，回复将显示在这里。</div></div></div>';
										$("#notify").append(html);
										return;
									}
									var notification = $.parseJSON(response);
									var html = addNotify(notification);
									
									$("#notify").append(html);
									notifyJS();
								}			
							});						
						}
						//显示通知信息
						var twitter = '${pageContext.request.contextPath}';
						function addNotify(notification){
							var html = ""
							for(var i=0;i<notification.length;i++){
								//有人关注你通知
								if(notification[i].ntype == 1){
									html += '<div class="notifications"><div	style="margin-left: 55px;padding-top: 20px;height: 26px;line-height: 26px">	<span class=" glyphicon glyphicon-user"'
										+ '	style="color:rgba(29, 161, 242, 1);font-size: 16px;margin-right: 10px"></span><img style="width: 31px;height: 31px;border-radius: 50px;background-color: white;margin-top: -10px"'
										+ ' src="' + twitter + '/img/' + notification[i].usersall.uname + '/' + notification[i].usersall.ulogo + '" /></div><div style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">'
										+ '<span class="guanzhurenming" style="font-weight: bold;margin-right: 5px;cursor: pointer;"	onclick=chakanwho(this)>'
										+ notification[i].usersall.urealname + '</span> <input type="hidden" class="uuid" value="'
										+ notification[i].usersall.uid + '" />关注了你<span style="margin: 0px 5px;color:#657786">·</span><span'
										+ ' class="guanzhudetime" style="color:#657786">' + notification[i].time + '</span></div></div>';
								}
								//有人点赞推文通知
								if (notification[i].ntype == 2) {
									if (notification[i].utweets.tcontent == null || notification[i].utweets.tcontent == "") {
										continue;
									}
									html += '<div class="notifications"><div style="margin-left: 55px;padding-top: 10px;height: 26px;line-height: 26px">'
									+ '<span class=" glyphicon glyphicon-heart"	style="color:rgba(224, 36, 94, 1);font-size: 16px;margin-right: 15px;"></span><span class="guanzhurenming"'
									+ '	 style="font-size:16px;font-weight: bold;margin-right: 5px;cursor: pointer;"	onclick=chakanwho(this)>'
									+ notification[i].usersall.urealname + '</span> <input type="hidden"	class="uuid" value="'
									+ notification[i].nuid + '" />喜欢了你的推文<span	style="margin: 0px 5px;color:#657786">·</span><span'
									+ ' class="dianzandetime" style="color:#657786">' + notification[i].time + '</span></div><div style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">'
									+ '<div class="dianzantweet"><div class="dianzantweetname" onclick=chakanwho(this)>' + notification[i].utweets.urealname + '</div><input type="hidden" class="uuid" value="'
									+ notification[i].utweets.uid + '" /><div class="dianzantweetaite">@' + notification[i].utweets.uaite + '</div><div class="dianzantweetneirong">'
									+ notification[i].utweets.tcontent;
									if (notification[i].utweets.tpic != null) {
										html += '<a style="margin-left:10px;" target="view_window" href="' + twitter + '/img/' + notification[i].utweets.uname + '/' + notification[i].utweets.tpic + '">图片</a>';
									}
									html += '</div></div></div></div>';
								}
								//有人转发推文通知
								if (notification[i].ntype == 3) {
									if (notification[i].utweets.tcontent == null || notification[i].utweets.tcontent == "") {
										continue;
									}
									html += '<div class="notifications"><div	style="margin-left: 55px;padding-top: 20px;height: 26px;line-height: 26px"><span class=" glyphicon glyphicon-retweet" style="color:rgba(23, 191, 99, 1);font-size: 16px;margin-right: 10px"></span>'
									+ '<img style="width: 31px;height: 31px;border-radius: 50px;background-color: white;margin-top: -10px" src="'
									+ twitter + '/img/' + notification[i].utweets.uname + '/' + notification[i].utweets.ulogo + '" />	</div><div style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">'
									+ '<span class="guanzhurenming" style="font-weight: bold;margin-right: 5px;cursor: pointer;" onclick=chakanwho(this)>'
									+ notification[i].utweets.urealname + '</span> <input type="hidden" class="uuid" value="'
									+ notification[i].utweets.uid + '" />转发了你的推文<span	style="margin: 0px 5px;color:#657786">·</span><span class="guanzhudetime" style="color:#657786">'
									+ notification[i].time + '</span><div class="dianzantweetneirong" style="margin-left: 0px;max-width:480px">'
									+ notification[i].utweets.tcontent + '</div><div class="dianzantweet" style="margin-top: 10px;"><div class="dianzantweetname" onclick=chakanwho(this)>'
									+ notification[i].utweetstwo.urealname + '</div><input type="hidden" class="uuid" value="'
									+ notification[i].utweetstwo.uid + '" /><div class="dianzantweetaite">@'
									+ notification[i].utweetstwo.uaite + '</div><div class="dianzantweetneirong">'
									+ notification[i].utweetstwo.tcontent;
									if (notification[i].utweetstwo.tpic != null) {
										html += '<a style="margin-left:10px;" target="view_window" href="' + twitter + '/img/' + notification[i].utweetstwo.uname + '/' + notification[i].utweetstwo.tpic + '">图片</a>';
									}
									html += '</div></div></div></div>';
								}
								//有人回复推文通知
								if (notification[i].ntype == 4) {
									if (notification[i].utweets.tcontent == null || notification[i].utweets.tcontent == "") {
										continue;
									}
									html += '<div class="notifications"><div	style="margin-left: 55px;padding-top: 20px;height: 26px;line-height: 26px"><span class=" glyphicon glyphicon-share-alt" style="color:rgb(29, 161, 242);font-size: 16px;margin-right: 10px"></span>'
									+ '<img style="width: 31px;height: 31px;border-radius: 50px;background-color: white;margin-top: -10px" src="'
									+ twitter + '/img/' + notification[i].usersall.uname + '/' + notification[i].usersall.ulogo + '" />	</div><div style="margin-left: 85px;margin-top: 20px;color: black;padding-bottom: 20px">'
									+ '<span class="guanzhurenming" style="font-weight: bold;margin-right: 5px;cursor: pointer;" onclick=chakanwho(this)>'
									+ notification[i].usersall.urealname + '</span> <input type="hidden" class="uuid" value="'
									+ notification[i].usersall.uid + '" />回复了你的推文<span	style="margin: 0px 5px;color:#657786">·</span><span class="guanzhudetime" style="color:#657786">'
									+ notification[i].time + '</span><div class="dianzantweetneirong" style="margin-left: 0px;max-width:480px">'
									+ notification[i].nrcontent + '</div><div class="dianzantweet" style="margin-top: 10px;"><div class="dianzantweetname" onclick=chakanwho(this)>'
									+ notification[i].utweets.urealname + '</div><input type="hidden" class="uuid" value="'
									+ notification[i].utweets.uid + '" /><div class="dianzantweetaite">@'
									+ notification[i].utweets.uaite + '</div><div class="dianzantweetneirong">'
									+ notification[i].utweets.tcontent;
									if (notification[i].utweets.tpic != null) {
										html += '<a style="margin-left:10px;" target="view_window" href="' + twitter + '/img/' + notification[i].utweets.uname + '/' + notification[i].utweets.tpic + '">图片</a>';
									}
									html += '</div></div></div></div>';
								}							
							}
							return html;
						}			
					</script>



                </div>
            	
            	<div id="jiazai">
					<img src="img/loader.gif" />
				</div>
				<div id="back" style="display: block">
					<img src="img/index.ico" />
				</div>	
            
            </div>
        </div>
        
        <div id="third">
            <div id="link">
                <ul id="lianjie">
                    <li class="lianjie">©2018Twitter</li>
                    <li class="lianjie">关于</li>
                    <li class="lianjie">帮助中心</li>
                    <li class="lianjie">博客</li>
                    <li class="lianjie">状态</li>
                    <li class="lianjie">工作机会</li>
                    <li class="lianjie">条款</li>
                    <li class="lianjie">隐私政策</li>
                    <li class="lianjie">Cookies</li>
                    <li class="lianjie">广告信息</li>
                    <li class="lianjie">商标</li>
                    <li class="lianjie">广告</li>
                    <li class="lianjie">企业</li>
                    <li class="lianjie">开发者</li>

                </ul>
            </div>
        </div>
    </div>

<script>
	$("#kuaijiejian").click(function(){
		alert("按T编辑新推文，\n\n按Ctrl+Enter发推文");
	});
	//当同时按下CTRL键和Enter键时
	$("#tweet2").keyup(function(){
		if(event.ctrlKey && event.keyCode == 13){
			//判断是否有输入字符或语句
			if($(this).val().trim() >0){
				$("#submittwo").click();
			}else{
				$("#tongzhi").html("推文内容为空！").fadeIn(300).delay(500).fadeOut(300);
			}
		}
	});
	
	$(document).keyup(function(event){
		switch (event.keyCode) {
			//按T：84
			case 84:
				$("#fatui").click();
				return;
			//按ESC：27
			case 27:
				$("#guanguanguan").click();
				return;
		}	
	});
	
	var touxiang = "${pageContext.request.contextPath}/img/${user.uname }/${info.ulogo}";
	var twitter = ' ${pageContext.request.contextPath}';
	$(".tuijian_touxiang").css("background", "url('" + touxiang + "')");
	$(".tuijian_touxiang").css("backgroundSize", "50px 50px");
	var one = "1";
	var zero = "0";
	var tuiwenshu = 0;
	//关注别人出现的按钮效果
	function guanzhuta(button) {
		var uid = $(button).parent().next().next().next().next().val();
		if ($(button).html() == '关注') {
			updateFollow(uid, "add");
			$(button).css("backgroundColor", color);
			$(button).html("正在关注");
			$(button).css("color", "white");
			$(button).css("border", "0px solid red");
			return;
		}
		if ($(button).html() == '取消关注') {
			updateFollow(uid, "del");
			$(button).css("backgroundColor", "white");
			$(button).html("关注");
			$(button).css("color", color);
			$(button).css("border", "1px solid " + color);
			return;
		}
	}
	
	function updateFollow(uid, method) {
		$.ajax({
			type : "POST",
			url : "concern.do?method=" + method + "&suid=" + uid,
			async : false,
			success : function(data) {
				//Ok
			}
		});
	}
	var color = "${info.ucolor}";
	var touxiang = "${pageContext.request.contextPath}/img/${user.uname}/${info.ulogo}";
	var bg = "${pageContext.request.contextPath}/img/${user.uname}/${info.ubg}";
	
	$(".touxiang").css({"background":"url("+touxiang+")","backgroundSize":"31px 31px"});
	$("#user_tou_xiang").css("backgroundSize","80px 80px");
	if($("#user_tou_xiang img").css("display")=="inline"){
		$("#user_tou_xiang").css("background",color);
	}
	
	$(".button").css("background",color);
	$("#daohang li:eq(1)").css("borderBottom","5px solid" + color);
	$("#daohang li:eq(1)").css("color",color);
	$(".wen").css("border","0px solid lightsalmon");
	$(".wen").css("color",color);
	$(".tweet").css("border","2px solid rgb(164,217,249)");
	
	//搜索语句
	$(".search").on({
		//获得焦点
		focus:function(){
			$(".search").css("background","rgba(255,255,255,1.00)");
			$(".sear").css("background","rgba(255,255,255,1.00)");
			$("#chaxun").css("backgroundColor","white");
		},
		//失去焦点
		blur:function(){
			$(".search").css("background","rgba(245,248,250,1.00)");
			$(".sear").css("background","rgba(245,248,250,1.00)");
			$("#chaxun").css("backgroundColor","rgba(245,248,250,1.00)");
		}
	});
	
	//图表样式
	$("#logo").click(function(e){
		e.preventDefault();
		$(document.documentElement).animate({
			scrollTop:0						
		},500);
	});
	//导航的li标签样式 通知
	$("#daohang li").on({
		mouseover:function(){
			$(this).css({"borderBottom":"5px solid "+color,"color":color});
		},
		mouseout:function(){
			$(this).css({"borderBottom":"","color":"rgba(102,107,117,1.00)"});
			$("#daohang li:eq(1)").css("borderBottom","5px solid "+ color);
			$("#daohang li:eq(1)").css("color",color);
		}
	});
	
	//0-主页 1-通知 2-聊天,设置点赞跳转页面
	$("#daohang li:eq(0)").click(function(){
		location = "main.jsp";
	});
	
	$("#daohang li:eq(1)").click(function(){
		location = "notify.jsp";
	});
	
	$("#daohang li:eq(2)").click(function(){
		window.open("message.jsp");
	});

	$(".button").on({
		mouseover:function(){
			$(this).css("backgroundColor","rgb(0,109,191,1.00)");
		},
		mouseout:function(){
			$(this).css("backgroundColor","rgba(29,161,241,1.00)");
		}
	});
	//点击头像实现渐入渐出
	$("#touxiang").click(function(){
		$("#list").fadeToggle(10);
	});
	
	$(document).click(function(e){
		e=window.event || e; //兼容IE7
		obj = $(e.srcElement || e.target);
		if($(obj).is("#touxiang")|| ((e.pageX>=970&&e.pageX<=1165)&&(e.pageY>=50&&e.pageY<=401))){
			
		}else{
			$("#list").fadeOut(10);
		}
	})
	
	$("#lianjie li").on({
		mouseover:function(){
			$(this).css("color",color);
			$(this).css("borderBottom","1px solid "+ color);
		},
		mouseout:function(){
			$(this).css("color","gray");
			$(this).css("borderBottom","0px solid "+ color);
		}		
	});
	
	$(".listd").on({
		mouseover:function(){
			$(this).css("backgroundColor", color);
			$(this).css("color", "white");
		},
		mouseout:function(){
			$(this).css("backgroundColor", "white");
			$(this).css("color", "black");
		}
	});
	//第一个：个人资料
	$(".listd:first").click(function() {
		location = "selfdetail.jsp";
	});

	$("#self").click(function() {
		location = "selfdetail.jsp";
	});
	//最后一个：退出
	$(".listd:last").click(function() {
		location = "user.do?method=exit";
	});
	
	//推文的样式
	$(".wen").on({
		focus:function(){
			if($(this).trim().val() == "" || $(this).val() == null){
			$(".wen").css("color","black");
			$(".but").attr("disable","true");
			}else{
				$(".but").removeAttr("disabled");
			}
			$(".tweet").css("border","1px solid " + color);
		},
		blur : function() {
			if ($(this).val() == "" || $(this).val() == null) {
				$(".wen").css("color", color);
				$(".but").attr("disabled", "true");
			} else {
				$(".but").removeAttr("disabled");
			}
			$(".tweet").css("border", "2px solid rgb(164, 217, 249)");
		}
	});
	//将推文设置为自动尺寸
	autosize(document.querySelectorAll('textarea'));
	
	if($(".wen").val() == ""){
		$(".but").attr("disabled","true");
	}
	$("#tuiwen2").bind('input oninput',function(){
		$(".cont").css("height", $(this).height() + 100 + "px");
	});
	$(".cont").css("height","200px");
	$$(".wen").bind('input oninput',function(){
		var zishu = 140 - $(this).val().length;
		$(".zishu").html(zishu);
		
		if(zishu < 0){
			$(".zishu").css("color","lightcoral");
			$(".zishu").css("fontWeight","bold");
			$(".wen").css("color","lightcoral");
			$(".but").css("disable","true");
		}else{
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
			if($(this).val() =="" || $(this).val().length > 140){
				$(".but").attr("disabled","true");'
			}else{
				$(".but").removeAttr("disabled");
			}
		}
	});
	
	$(".but").click(function(){
		$("#logo").attr("src","img/spinner-rosetta-blue-26x26.gif");
	});
	//搜索
	$("#search_two").bind('input propertychange ',function(){
		if ($(this).val().trim() != "") {
			$(this).css("color", "black");
		} else {
			$(this).css("color", "#657786");
		}
	});
	
	var dtNum = "${info.utweet}" *1;
	function tijiao(formData){
		$.ajax({
			type:"POST",
			url:"tweettwo.do?method=newt",
			data:formData,
			async:false,
			cache:false,
			contentType:false,
			processData:false,
			error:function(request){
				alert("Connection error");
			},
			success :function(data){
				$("#logo").attr("src","img/index.ico");
				$("#tweet1").val("");
				$("#pics").fadeOut();
				$("#picha").fadeOut();
				$("#ts1").fadeOut();
				$("#pic").val("");
				$(".zishu").html(140);
				$("#tweet2").val("");
				if($(".meiyou").css("display") == "block"){
					$("#content").html("");
				}
				dtNum += 1 ;
				$(".dt:eq(0)").html(dtNum);
				var tweets = $.parseJSON(data);
				var html = addTweet(tweets);
				$("#content").prepend(html);
				$("#tongzhi").html("发布推文成功！").fadeIn(300).delay(2000).fadeOut(300);
				tweetsJs();				
			}
		});
	}
	
	$("#subminttwo").click(function(){
		var url = '/twitter/tweettwo.do?method=getnewtweets&td=down&nowid=' + $(".tuiern:eq(0)").find(".idid").val();
		$.ajax({
			url : url,
			type : 'POST',
			success : function(response , status){
				if(response.length > 1){
					var tweets = $.parseJSON(response);
					var html = addTweet(tweets);
					$("#content").prepend(html);
					tweetsJs();
					$("#tixing").fadeOut();
					window.document.title = "Twitter";
					$(".glyphicon-home").css("color","#655786");					
				}
				var formData = new FormData($("#mytweettwo")[0]);
				tijiao(formData);
			},
			error : function(XMLHttpRequest , textStatus , errorThrown){
				alert(errorThrown);
			}
		});	
	});
	
	$(function(){
		$('#popup').popup({
			ifDrag : true,
			dragLimit : true
		});
	});
	//查询点击效果
	$("#chaxun").on({
		click : function(){
			$("#logo").attr("src","img/spinner-rosetta-blue-26x26.gif");
			var word = $(".search").val();
			location = "search.jsp?word=" + word;
		}
	});	
</script>

<script>

	shuaXinTuiJian();
	function shuaXinTuiJian(){
		$.ajax({
			url:'/twitter/user.do?method=shuaxintuijian&suiji=' + Math.random(),
			type : 'POST',
			success : function(response,status){
				var length = response.length;
				var users = $.parseJSON(response.substring(response.indexOf("["),response.length));
				var html = changeTuiJian(users);
				$("#addtuijian").append(html);
				$(".guanzhuta").on({
					mouseover : function() {
						if ($(this).html() == '关注') {
							var yanse = color.substring(0, color.indexOf("1.00"));
							$(this).css("backgroundColor", yanse + "0.1)");
						}
						if ($(this).html() == '正在关注') {
							$(this).html("取消关注");
							$(this).css("backgroundColor", "rgba(172,0,43,1.00)");
						}
					},
					mouseout : function() {
						if ($(this).html() == '关注'){
							$(this).css("backgroundColor", "white");
						}
						if ($(this).html() == '取消关注') {
							$(this).css("backgroundColor", color);
							$(this).html("正在关注");
							$(this).css("color", "white");
							$(this).css("border", "0px solid red");
						}
					}
				});
		
				$(".tuijian_name").on({
					mouseover : function() {
						$(this).css("color", color);
					},
					mouseout : function() {
						$(this).css("color", "black");
					}
				});
			}
		});	
	}
	//刷新推荐
	$("#shuaxintj").on({
		clicl:function(){
			$("#addtuijian").html('');
			shuaXinTuiJian();
		}
	});

	//关注名字按钮
	function guanzhuname(button){
		var uid = $(button).parent().find(".uid").val();
		var name = $(button).html();
		location = "user.do?method=iswho&who="+name+"&id="+uid;
	}
	//改变推荐
	function changeTuiJian(users){
		var html = "";
		for (var i = 0; i < users.length; i++) {
			html += '<div class="tuijian_info"><div class="tuijian_touxiang" style="background: url(' + twitter + '/img/'
				+ users[i].uname + "/" + users[i].ulogo + ');background-size: 50px 50px;"></div><div class="tuijian_name" onclick="guanzhuname(this)">'
				+ users[i].urealname + '</div><div class="tuijian_aite" style="color:#657786">@' + users[i].uaite
				+ '</div><div><button  onclick="guanzhuta(this)" class=" guanzhuta" style="color:${info.ucolor};margin-top:8px;margin-left:8px;border:1px solid ${info.ucolor}">关注</button></div>'
				+ '<input class="uid" type="hidden" value="' + users[i].uid + '"/><input class="uid" type="hidden" value="'
				+ users[i].uid + '"/><input class="uid" type="hidden" value="'
				+ users[i].uid + '"/><input class="uid" type="hidden" value="' + users[i].uid + '"/></div><hr>';
		}

		return html;
	}
	
	$("#search_two").bind("input change",function(){
		
		var name = $(this).val();
		if ($(this).val() == "") {
			$("#souxianshi").hide();
			$("#souxianshishang").hide();
		}
		var url = '/twitter/user.do?method=chayonghu';
		if ($(this).val() != "") {
			$.ajax({
				url : url,
				data : {
					"name" : name
				},
				type : 'POST',
				success : function(response, status) {
					$("#souxianshi").html("");
					$("#souxianshi").show();
					$("#souxianshishang").show();
					if (response == "kong") {
						var html = '<div class="souneirong"><span style="margin-left:20px;font-size:15px;">没有与<b><span style="margin:0 3px;">' + name + '</span></b>相关用户！</span></div>';
						$("#souxianshi").append(html);
						return;
					}
					var length = response.length;
					var users = $.parseJSON(response.substring(response.indexOf("["), response.length));
					var html = "";
					for (var i = 0; i < users.length; i++) {
						html += '<div class="souneirong" onclick="chaxunuser(0,this)"><div class="soutouxiang"><img src="'
							+ twitter + '/img/' + users[i].uname + "/" + users[i].ulogo + '" /></div><div class="soumingzi">'
							+ users[i].urealname + '</div><div class="sousouaite">@' + users[i].uaite + '</div><input class="uid" type="hidden" value="'
							+ users[i].uid + '"/></div>';
					}
					html += '<div class="souneirong" onclick="chaxunuser(1,this)"><span style="margin-left:20px;font-size:15px">搜索与<span style="margin:0 3px"><b>' + name + '</b></span>相关的所有用户</span></div>';
					$("#souxianshi").append(html);
					$(".souneirong").on({
						mouseover : function() {
							$(this).css("backgroundColor", color);
						},
						mouseout : function() {
							$(this).css("backgroundColor", "white");
						}
					});
				}
			});
		}
	});
	
	function chaxunuser(num, user) {
		if (num == 1) {
			var word = $(user).find("b").html();
			location = "search.jsp?word=" + word;
			return;
		}
		var uid = $(user).find(".uid").val();
		var urealname = $(user).find(".soumingzi").html().trim();
		if (uid == ${user.uid}) {
			location = "selfdetail.jsp";
			return;
		}
		location = "user.do?method=iswho&who=" + urealname + "&id=" + uid;
	}

</script>


</body>
</html>