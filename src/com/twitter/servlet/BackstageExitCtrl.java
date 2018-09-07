package com.twitter.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BackstageExitCtrl
 */
@WebServlet("/BackstageExitCtrl")
public class BackstageExitCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackstageExitCtrl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//将session里边用于访问非法用户访问主页的标志位删除
		HttpSession session = request.getSession(true);
		session.removeAttribute("LOGIN");
		session.removeAttribute("ALLOW");
		//session.setMaxInactiveInterval(0);
		request.getRequestDispatcher("/BackstageLoginView").forward(request, response);
	}

}