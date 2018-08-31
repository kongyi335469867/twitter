package com.twitter.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twitter.service.BackstageServiceImpl;

/**
 * Servlet implementation class BackstageCtrl
 */
@WebServlet("/BackstagePageCtrl")
public class BackstagePageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int onlineNum;
	private static int visitsNum;
	private static int tweetsNum;
	private static int overallNum;
    public BackstagePageCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("str");
    	if("ajaxRefresh".equals(str)){     /* AJAX实现自动刷新后台主页数据 */
    		onlineNum = BackstageServiceImpl.getBackstageServiceImpl().queryOnline();  //onlineNum 在线人数
    		visitsNum = BackstageServiceImpl.getBackstageServiceImpl().queryVisits();  //visitsNum 今日访问量
    		tweetsNum = BackstageServiceImpl.getBackstageServiceImpl().queryTweets();  //tweetsNum 推文数
    		overallNum = BackstageServiceImpl.getBackstageServiceImpl().queryOverAll();  //overallNum 总人数
    		System.out.println(onlineNum + "-" + visitsNum + "-" + tweetsNum + "-" + overallNum);
			response.getWriter().print(onlineNum + "-" + visitsNum + "-" + tweetsNum + "-" + overallNum);
			
    	}
	}
}
