<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.twitter.bean.Admins" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="img/index.ico" />
    <title>twitter后台中心</title>
    <link rel="stylesheet" type="text/css" href="css/BasicStyle.css"><!--后台页面基本样式-->
    <link rel="stylesheet"  type="text/css" href="css/backstageIndex.css" /><!--后台页面主页样式-->
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/backstageIndex.js"></script>
</head>
<body>
	<%
		String aLogin = (String)session.getAttribute("LOGIN_ALLOW");  //从登录界面正常登录进来才可以访问
		Admins adminDB = (Admins)session.getAttribute("ADMIN_DB");   //获取传递的管理员信息
		if("adminAllow".equals(aLogin)){
			/*设置只能通过后台的backstageIndex.jsp页面来访问子窗口的页面*/
			session.setAttribute("ALLOW", "allow");
	%>
    <div class="layout-admin">
        <!--头部-->
        <header class="layout-header">
            <span class="header-logo"><i class="iconfont" style="color: #55ACEE; font-size: 28px;">&#xe626;</i></span>
            <a class="header-menu-btn" href="javascript:;"><i class="iconfont">&#xe613;</i></a>
            <ul class="header-bar">
                <li class="header-bar-role">
                    <a href="javascript:;">管理员，欢迎您！</a>
                </li>
                <li class="header-bar-nav">
                    <a href="javascript:;"><%=adminDB.getAname() %><i class="iconfont" style="margin-left:5px; font-size: 14px;">&#xe503;</i></a>
                    <ul class="header-dropdown-menu">
                        <!--li><a href="javascript:;">个人信息</a></li-->
                        <li><a href="BackstageExitCtrl?adminId=<%=adminDB.getAid() %>">&nbsp;注&nbsp;&nbsp;销&nbsp;&nbsp;</a></li>
                    </ul>
                </li>
            </ul>
        </header>
       
        <!--侧栏：栏目的跳转-->
        <aside class="layout-side">
            <ul class="side-menu">
                <li class="menu-header menu-item"><i class="iconfont">&#xe613;</i></li>
                <li class="menu-item item_active" title="主页">
                    <a id="homepage" href="homepage.jsp" target="iframe0">
                        <i class="iconfont">&#xe65e;</i>
                        <span class="menu-item-word">主页</span>
                    </a>
                </li>
                <li class="menu-item" title="用户中心">
                    <a id="memberCenter" href="BackstagePageCtrl?str=memberCenter" target="iframe0">
                        <i class="iconfont">&#xe6a3;</i>
                        <span class="menu-item-word">用户中心</span>
                    </a>
                </li>
                <li class="menu-item" title="推文中心">
                    <a id="tweetCenter" href="BackstagePageCtrl?str=tweetCenter" target="iframe0">
                        <i class="iconfont">&#xe61f;</i>
                        <span class="menu-item-word">推文中心</span>
                    </a>
                </li>
                <li class="menu-item" title="关于">
                    <a id="aboutBackstage" href="BackstagePageCtrl?str=aboutBackstage" target="iframe0">
                        <i class="iconfont">&#xe5be;</i>
                        <span class="menu-item-word">关于</span>
                    </a>
                </li>
            </ul>
        </aside>
        <!--节:主页内容，展示用户在线状态等信息-->
        <section class="layout-main">
            <div class="layout-main-tab">
                <!--左箭头图标-->
                <button class="tab-btn btn-left"><i class="iconfont">&#xe628;</i></button>
                <nav class="tab-nav">
                    <div class="tab-nav-content">
                        <a href="javascript:;" class="content-tab active" id="index" >主页<!--i class="iconfont">&#xe62a;</i--></a>
                    </div>
                </nav>
                <!--右箭头图标-->
                <button class="tab-btn btn-right"><i class="iconfont">&#xe629;</i></button>
            </div>
            <div class="layout-main-body">
                <!--子页面窗口显示位处-->
               
                <iframe class="body-iframe" name="iframe0" src="homepage.jsp" width="100%" height="99%" frameborder="0" seamless></iframe>
                <!--seamless规定了<iframe>看上去像是包含文档的一部分（无边框或滚动条）。-->
            </div>
        </section>
        <!--底部-->
        <footer class="layout-footer">Copyright© redis小组</footer>
    </div>
	<%
		}else{
			response.sendRedirect("./backstageError.jsp");  //重定向到提示无权利访问页面
		} 
	%>
</body>
</html>