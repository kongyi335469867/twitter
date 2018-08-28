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
    <link href="css/bootstrap.css" type="text/css">
    <link href="css/bootstrap.css.map" type="text/css">
    <link href="css/bootstrap.min.css" type="text/css">
    <link href="css/bootstrap.min.css.map" type="text/css">
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
            z-index: 999;
            margin-top: -45px;
        }

        *{
            margin: 0;
            padding: 0;
        }
        #body{
            width: 1349px;
            height: auto;
            margin-top: 45px;
            /*border: 1px solid red;*/
        }
        #littleloader{
            width: 1349px;
            height: 65px;
            position: relative;
        }
        #twoloader{
            background-color: rgba(255,255,255,1.00);
            width: 1349px;
            height: 50px;
            position: relative;
            box-shadow: 0 0 2px grey;

        }
        #first{
            float: left;
            margin-left: 80px;
            height: auto;
        }
        #sousuo{
            width: 265px;
            height: 50px;
            border-radius: 5px;
            background-color: white;
            margin-top: 15px;
        }
        #sousuo input{
            width: 180px;
            height: 30px;
            padding: 5px 10px;
            margin-left: 10px;
            margin-top: 10px;
            background-color: white;
            border-radius: 5px;
        }
        ol,ul{
            margin-top: 0;
            margin-bottom: 10px;
        }
        li{
            list-style: none;
            display: list-item;
        }
        button,input,select,textarea{
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }
        #submit{
            margin-left: 5px;
            border-radius: 5px;
            padding: 1px 15px;
            font-weight: bold;
            background-color: white;


        }
        #xuanze{
            width: 265px;
            min-height: 50px;
            border-radius: 5px;
            background-color: white;
            margin-top: 15px;
        }
        .guanzhu{
            font-size: 18px;
            padding-top: 10px;
            padding-left: 10px;
            margin-bottom: 20px;
        }
        #second{
            width: 980px;
            height: auto;
            position: absolute;
            left: 350px;
        }
        #content{
            height: auto;
        }
        #bucunzai{
            margin-top: 60px;
            margin-left: 60px;
        }
        #nobody{
            font-weight: bold;
            font-size: 25px;
            color: black;
            width: 500px;
            word-wrap: break-word;
            word-break: break-all;
        }
        #cuowu{
            font-size: 15px;
            color: #657786;
            margin-top: 20px;
            display: none;
        }
        #fanwei{
            width: 240px;
            height: 30px;
            font-size: 15px;
            margin-left: 10px;
            margin-bottom: 15px;
            border: 1px solid #657786;
            color: black;

        }
        #weizhi{
            width: 240px;
            height: 30px;
            font-size: 15px;
            margin-left: 10px;
            margin-bottom: 15px;
            border: 1px solid #657786;
            color: black;
        }
    </style>
    <style type="text/css">
        body{
            width: 1349px;
            background-color: rgba(230,236,240,1.00);

            height: 680px;
        }
        #loader{
            width: 100%;
            height: 46px;
            /*border: 1px solid red;*/
            background-color: white;
            position: fixed;
            z-index: 999;
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
            margin-top: 0px;
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
            z-index: 999999;
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

        p{
            margin: 0 0 10px;
        }
        #popup .title span{
            position: absolute;
            top: 12px;
            right: 20px;
            width: 30px;
            height: 30px;
            color: #000;
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
            border-radius: 5px;
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
            border-radius: 5px;
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
            top: 20px;
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
            left: 235px;
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
            <li style="color: rgb(102,107,117);">
            <span class="glyphicon glyphicon-bell"></span>
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
            <input type="text" class="search" id="search_two" placeholder="搜索Twitter用户">
            <span class="glyphicon glyphicon-search sea" id="chaxun" style="color:#657786;font-size: 15px;margin-top: 1px;"></span>
        </div>
        <div class="triangle shang" id="souxianshishang"></div>
        <div id="souxianshi"></div>
        <div class="touxiang" id="touxiang" style="background: url(img/header.jpg) 0 0 / 31px 31px;" data-original-title title></div>
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
        <form action method="post" id="mytweettwo" enctype="multipart/form-data">
            <div class="cont" style="height: 200px;">
                <div class="tweet ttt" id="tuiwen2" style="box-shadow: rgb(164,217,249) 0px 0px 1px;border: 2px solid rgb(164,217,249);">
                    <textarea id="tweet2" class="wen xinxian" name="tuiwen" placeholder="有什么新鲜事？" style="max-height: 300px;border: 0 solid lightsalmon;border-radius: 10px;; color: rgb(29,161,241);overflow: hidden;word-wrap: break-word;width: 540px;height: 0;" autofocus="autofocus" data-autosize-on="true"></textarea>
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
<div id="body">
        <div id="littleloader" style="background-color: rgb(29,161,241);">
            <div id="searchname" style="width: auto;line-height: 65px;margin-left: 95px;font-size: 25px;">
                <input id="message" name="message" type="text"  style="width: 1200px;font-size: 25px;background-color:  rgb(29,161,241);color: white;border: none">
            </div>
        </div>
        <div id="twoloader">
            <ul style="height: 65px">
                <li id="users" style="text-align: center;width: 60px;height: 50px;line-height: 50px;margin-left: 90px;font-size: 15px;font-weight: bold;cursor: pointer;color: rgb(29,161,241);border-bottom: 3px solid rgb(29,161,241)">
                    用户
                </li>
            </ul>
        </div>
        <div id="first">
            <div id="sousuo">
                <input name="input1" id="input1" type="text" placeholder="搜索用户" style="font-size: 14px;border: 1px solid rgb(101,119,134);" oninput="search()">
                <button  id="submit" style="font-size: 14px;width: 60px;height: 30px;color: rgb(29,161,241);border: 1px solid rgb(29,161,241);">
                搜索</button>
            </div>
            <div id="xuanze" style="height: 160px">
                <div class="guanzhu" style="color: black;">
                    搜索筛选
                    <span id="xianshi" style="font-size: 12px;font-weight: normal;cursor: pointer;color: rgb(29,161,241); ">
                        <a> ·隐藏</a>
                    </span>
                </div>
                <div>
                    <select id="fanwei" style="display: block">
                        <option value="all">来自任何人</option>
                        <option value="follow" selected="selected">你关注的人</option>
                        <option value="fans">关注你的人</option>
                    </select>
                </div>
                <div>
                    <select id="weizhi">
                        <option value="loc">全部位置</option>
                        <option value="next">附近位置</option>
                    </select>
                </div>
            </div>
        </div>
        <div id="second">
            <div id="content">
                <div id="bucunzai">
                    <div id="nobody">没有你关注 OR 关注你的人.</div>
                    <div id="cuowu">你输入的词语查不到任何结果。你可能打错了。</div>
                </div>
            </div>
            <div id="elliot">

            </div>
        </div>
    </div>

    <!--搜索-->
    <script>
        function search(){
            $("#submit").click(function(){
                var c = document.getElementById("input1").value;
                document.getElementById("message").value = c;

                document.getElementById("nobody").innerHTML = "没有关于 "+ c + " 的结果";
                $("#cuowu").show();
            });

        }
    </script>

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
<!--头像栏显示隐藏-->
<script>
    $(document).ready(function(){
        $("#touxiang").click(function () {
            $("#list").toggle();
        });
    });


</script>
</body>
</html>