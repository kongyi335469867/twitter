package com.twitter.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.dao.BackstageDaoImpl;

@WebServlet("/BackstageExitCtrl")
public class BackstageExitCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BackstageExitCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String adminId = request.getParameter("adminId");  //管理员id
		int aid = Integer.parseInt(adminId);
		java.sql.Timestamp aditime = (java.sql.Timestamp)session.getAttribute("ADITIME");  //管理员登入时间
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp adotime = new java.sql.Timestamp(date.getTime());  //管理员登出时间
		
		BackstageDaoImpl.getBackstageDaoImpl().addAdminTime(aid, aditime, adotime);  //将管理员登入登出记录写至数据库表adlogin
		
		System.out.println("----------------------------------------");
		System.out.println("--------- 管理员账号已经退出登录！--------");
		System.out.println("----------------------------------------");
		
		//移除session标志位
		session.removeAttribute("ALLOW");   //移除：仅允许管理员成功登录后访问其他子页面
		session.removeAttribute("LOGIN_ALLOW");  
		session.removeAttribute("ADMIN_DB");   //移除：管理员信息
		session.removeAttribute("ADITIME");  //移除：登入时间
		session.invalidate();
		//session.setMaxInactiveInterval(0);
		
		response.sendRedirect("./backstageLogin.jsp");
	}

}