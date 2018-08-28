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
        #nav{
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
        #nav li{
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
        <ul id="nav">
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
        <div id="second">
            <div id="content">
                <div id="quanbu">
                    <ul>
                        <li>全部</li>
                        <li style="color: rgba(29,161,241,1.00)">提及</li>
                    </ul>
                </div>
                <div id="notify">
                    <div class="notifications">
                        <div style="margin-left: 60px;padding-bottom: 30px;padding-top: 30px">
                            <div style="font-size: 28px;font-weight: bold;color: black;width: 480px">看看大家是何时关注、提及你，收藏及转推你的推文的。</div>
                            <div style="font-size: 15px;padding-top: 5px;color: #657786;width: 470px">从喜欢到转推等等等等，一切有关你的推文和关注者的活动都会在此发生。</div>
                        </div>
                        <div style="height: 290px;width: 480px;margin-left: 60px;padding-bottom: 10px;">
                            <img src="img/concern.png" class="concern"  style="width: 30px;height: 30px;float: left;margin-left: 5px;margin-top: 15px;border-radius:20px" >
                            <div style="width: 410px;height: 70px;margin-left: 50px;padding-top: 10px; ">
                                <div style="font-size: 15px;color:black;"><a href="#" class="event"><b>关注者</b></a></div>
                                <div style="font-size: 12px;padding-top: 2px;color: #657786;">有新的关注者了？恭喜你！你会在此选项卡里面看到详情。</div>
                            </div>
                            <img class="like" src="img/like.png" style="width: 30px;height: 30px;float: left;margin-left: 5px;margin-top: 20px;border-radius:20px" >
                            <div style="width: 410px;height: 70px;margin-left: 50px;padding-top: 10px;">
                                <div style="font-size: 15px;color:black;  "><a href="#" class="event"><b>喜欢</b></a></div>
                                <div style="font-size: 12px;padding-top: 2px;color: #657786;">当有人在你的推文点按了心形图标时，这就意味着他们觉得这条推文很赞（甚至喜爱它）。</div>
                            </div>
                            <img class="transfer" src="img/transfer.jpg" style="width: 30px;height: 30px;float: left;margin-left: 5px;margin-top: 25px;border-radius:20px" >
                            <div style="width: 410px;height: 70px;margin-left: 50px;padding-top: 20px ">
                                <div style="font-size: 15px;color:black; "><a href="#" class="event"><b>转推</b></a></div>
                                <div style="font-size: 12px;padding-top: 2px;color: #657786;">有人分享你的推文时，你应当知道，所以，你将收到通知。</div>
                            </div>
                            <img class="reply" src="img/reply.jpg" style="width: 30px;height: 30px;float: left;margin-left: 5px;margin-top: 25px;border-radius:20px" >
                            <div style="width: 410px;height: 70px;margin-left: 50px;padding-top: 20px">
                                <div style="font-size: 15px;color:black  "><a href="#" class="event"><b>回复</b></a></div>
                                <div style="font-size: 12px;padding-top: 2px;color: #657786;">当有人想对你的推文畅所欲言时，回复将显示在这里。</div>
                            </div>
                        </div>
                        <div id="back" style="display: block">
                            <img src="img/index.ico">
                        </div>
                    </div>
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

</body>
</html>