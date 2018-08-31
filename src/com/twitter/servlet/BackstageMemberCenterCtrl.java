package com.twitter.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BackstageMemberCenterCtrl
 */
@WebServlet("/BackstageMemberCenterCtrl")
public class BackstageMemberCenterCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BackstageMemberCenterCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
