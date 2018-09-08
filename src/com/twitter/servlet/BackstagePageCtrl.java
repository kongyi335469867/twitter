package com.twitter.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twitter.dao.BackstageDaoImpl;

@WebServlet("/BackstagePageCtrl")
public class BackstagePageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int uPageSize = 12;  /* “用户中心”页面大小 */
	private int uCurrentPage = 1;  /* “用户中心”当前页码 */
	private int tPageSize = 6;  /* “用户中心”页面大小 */
	private int tCurrentPage = 1;  /* “用户中心”当前页码 */
    public BackstagePageCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession(true);
		String option = request.getParameter("str");  //接收后台主页面的页面跳转操作
		
		String memberCenterSearch = request.getParameter("usearchUrealname");  //接收“用户中心”页面的搜索输入
		String memberCenterSearchState = request.getParameter("usearch");  //进行搜索
		String memberCenterSortState = request.getParameter("usort");  //进行排序
		String usersCurrentPage = request.getParameter("usersCurrentPage");  //接收“用户中心”页面当前页码
		String shutdownState = request.getParameter("shutdown"); //接收“用户中心”准备执行修改用户账号状态
		String Ustate = request.getParameter("ustate");  //接收“用户中心”页面修改用户账号的当前状态
		String Uid = request.getParameter("uid");  //接收“用户中心”页面修改用户账号的用户id
		
		String tweetsCenterSearch = request.getParameter("tsearchUrealname");  //接收“推文中心”页面的搜索输入
		String tweetsCenterSearchState = request.getParameter("tsearch");  //进行搜索
		String tweetsCurrentPage = request.getParameter("tweetsCurrentPage");  //接收“推文中心”页面当前页码
		String deleteTid = request.getParameter("deleteTid");  //接收“推文中心”页面的删除推文id
		
		/*主页*/
    	if("ajaxRefresh".equals(option)){     /* AJAX实现自动刷新后台主页数据 */
    		int onlineNum = BackstageDaoImpl.getBackstageDaoImpl().queryOnline();  //onlineNum 在线人数
    		int visitsNum = BackstageDaoImpl.getBackstageDaoImpl().queryVisits();  //visitsNum 今日访问量
    		int tweetsNum = BackstageDaoImpl.getBackstageDaoImpl().queryTweets();  //tweetsNum 推文数
    		int overallNum = BackstageDaoImpl.getBackstageDaoImpl().queryOverAll();  //overallNum 总人数
    		System.out.println(" > > ctrl层 主页页面实时监测在线数据：" + onlineNum + "-" + visitsNum + "-" + tweetsNum + "-" + overallNum);
			response.getWriter().print(onlineNum + "-" + visitsNum + "-" + tweetsNum + "-" + overallNum);
    	}
    	
    	/*用户中心*/
    	if("memberCenter".equals(option)){
    		List<String[]> usersList;
    		/* 修改用户账号的解封状态 */
    		if("shutdown".equals(shutdownState)){
    			if("停封".equals(Ustate)){
    				Ustate = "0";
    			}else if("解封".equals(Ustate)){
    				Ustate = "1";
    			}
    			boolean updateResult = BackstageDaoImpl.getBackstageDaoImpl().updateUstate(Ustate, Uid);
    			if(updateResult){   //账号本身停封状态，页面点击后将其修改为解封状态显示，故返回状态ustate要为0
    				updateResult = true;
    			}else {
    				updateResult = false;
    			}
        	}
    		/* “用户中心”页面的分页功能 */
        	if(usersCurrentPage != null){
        		uCurrentPage = Integer.parseInt(usersCurrentPage);
        	}
        	/* 根据用户真实名查询用户 */
    		if("usearch".equals(memberCenterSearchState)){  
    			usersList = BackstageDaoImpl.getBackstageDaoImpl().queryUserall(memberCenterSearch);
    			if("[]".equals(String.valueOf(usersList))){  //当搜索暂无此内容时，做出相关提示
    				request.setAttribute("U_NOCONTENT", String.valueOf(usersList));
	    		}
    		}else if("usort".equals(memberCenterSortState)){   //按最近登录时间排序用户
    			usersList = BackstageDaoImpl.getBackstageDaoImpl().queryUserSort(uCurrentPage, uPageSize);
    		}else {    //正常全部内容显示
    			usersList = BackstageDaoImpl.getBackstageDaoImpl().getUsersallListForCurrentPage(uCurrentPage, uPageSize);
    		}
        	for(String[] user : usersList){
        		if( "1".equals(user[3])){
        			user[3] = "停封";
        			user[6] = "#D9534F";  //偏红色
        		}else if("0".equals(user[3])){
        			user[3] = "解封";
        			user[6] = "#5BC0DE";  //偏蓝色
        		}
        	}
        	request.setAttribute("USERS_LIST", usersList);   /*用户信息*/
        	request.setAttribute("USERS_CURRENT_PAGE", uCurrentPage);   /*当前页面数*/
        	request.setAttribute("USERS_PAGE_COUNT", BackstageDaoImpl.getBackstageDaoImpl().usersPageCount);  /*页码总数*/
    		request.getRequestDispatcher("memberCenter.jsp").forward(request, response);
    	}
    	
    	/*推文中心*/
    	if("tweetCenter".equals(option)){
    		List<String[]> tweetsList;
    		int deleteResult = -1;
    		if(deleteTid != null){
    			/*删除推文操作*/
    			boolean result = BackstageDaoImpl.getBackstageDaoImpl().deleteTweet(deleteTid);
    			if(result){
    				deleteResult = 1;
    			}else{
    				deleteResult = 0;
    			}
    		}
    		/* “推文中心” 页面的分页功能*/
        	if(tweetsCurrentPage != null){
        		tCurrentPage = Integer.parseInt(tweetsCurrentPage);
        	}
    		/* 根据用户真实名查询该用户推文 */
    		if("tsearch".equals(tweetsCenterSearchState)){
    			tweetsList = BackstageDaoImpl.getBackstageDaoImpl().getUTweetsListForCurrentPage(tCurrentPage, tPageSize, tweetsCenterSearch);
    			String tweetsListStr = String.valueOf(tweetsList);
    			if("[]".equals(tweetsListStr)){  //当搜索暂无此内容时，做出相关提示
    				request.setAttribute("T_NOCONTENT", tweetsListStr);
	    		}
    		}else{  //默认查询所有推文内容且分页显示
    			tweetsList = BackstageDaoImpl.getBackstageDaoImpl().getUTweetsListForCurrentPage(tCurrentPage, tPageSize);
    		}
        	request.setAttribute("TWEETS_LIST", tweetsList);   /*推文信息*/
        	request.setAttribute("TWEETS_CURRENT_PAGE", tCurrentPage);  /*当前页面数*/
        	System.out.println("推文中心页面-当前页码：" + tCurrentPage);
        	request.setAttribute("TWEETS_PAGE_COUNT", BackstageDaoImpl.getBackstageDaoImpl().tweetsPageCount);  /*页码总数*/
        	System.out.println("推文中心页面-总页码：" + BackstageDaoImpl.getBackstageDaoImpl().tweetsPageCount);
        	request.setAttribute("DELETE_RESULT", String.valueOf(deleteResult));   /*删除结果*/
    		request.getRequestDispatcher("tweetCenter.jsp").forward(request,response);
    	}
    	//AJAX实现“推文中心”推文内容的批量删除
    	if("ajaxDeleteBatches".equals(option)){  
    		String tidsInfo = request.getParameter("tids"); 
    		String[] tidsArr = tidsInfo.split(",");
    		Integer[] deleteResult = new Integer[tidsArr.length];
    		if(tidsInfo != null){
    			for(int i = 0; i < tidsArr.length; i++){
        			boolean result = BackstageDaoImpl.getBackstageDaoImpl().deleteTweet(tidsArr[i]);
        			if(result){
        				deleteResult[i] = 1;
        			}else{
        				deleteResult[i] = 0;
        			}
        		}
    			response.getWriter().print(deleteResult);
    		}
    	}
    	
    	/* “关于”页面*/
    	if("aboutBackstage".equals(option)){
    		request.getRequestDispatcher("aboutBackstage.jsp").forward(request, response);
    	}
    	if("updateAdminInfo".equals(option)){
    		String aid = request.getParameter("aid");  //管理员
    		String updateAdminName = request.getParameter("adminName");  //管理员修改名
    		String updateOldPW = request.getParameter("oldPW");  //旧密码
    		String updateNewPW = request.getParameter("newPW");  //新密码
    		String updateConfirmPW = request.getParameter("confirmPW");  //确认密码
    		boolean updateNameResult = BackstageDaoImpl.getBackstageDaoImpl().queryAdminName(updateAdminName);  //查询管理员名是否存在
    		boolean adminPW = BackstageDaoImpl.getBackstageDaoImpl().queryAdminPW(Integer.parseInt(aid), updateOldPW);  //查询旧密码是否匹配管理员密码
    		if(updateNewPW.equals(updateConfirmPW)){  //新密码与确认密码相同，允许修改
    			if(updateNameResult){  //管理员修改名允许修改
        			if(adminPW){  //旧密码与管理员密码匹配，允许修改
    					Boolean result = BackstageDaoImpl.getBackstageDaoImpl().updateAdmin(Integer.parseInt(aid), updateAdminName, updateNewPW);
    					request.setAttribute("UPDATE_RESULT", String.valueOf(result));   /*删除结果返回提示*/
    					request.getRequestDispatcher("aboutBackstage.jsp").forward(request, response);
        			}else{  //旧密码与管理员密码不匹配，不允许修改操作
        				request.setAttribute("ERROLDPW", "oldPWBlock");   /*旧密码与管理员密码不匹配，返回提示*/
            			request.getRequestDispatcher("aboutBackstage.jsp").forward(request, response);
        			}
        		}else{   //管理员修改名已存在，不允许修改
        			request.setAttribute("ERRNAME", "nameBlock");   /*管理员存在不支持修改此名，返回提示*/
        			request.getRequestDispatcher("aboutBackstage.jsp").forward(request, response);
        		}
    		}else{   //新密码与确认密码不相同，不允许修改
				request.setAttribute("ERRNEWPW", "newPWBlock");   /*确认密码不同，返回提示*/
    			request.getRequestDispatcher("aboutBackstage.jsp").forward(request, response);
    		}
    	}
	}
}
