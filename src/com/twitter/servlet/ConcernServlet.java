package com.twitter.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.dao.ConcernDao;
import com.twitter.dao.NotificationDao;
import com.twitter.dao.UsersinfoDao;
import com.twitter.pojo.Users;
import com.twitter.pojo.Usersinfo;
import com.twitter.util.Times;

/**
 * Servlet implementation class ConcernServlet
 */
@WebServlet("/concern.do")
public class ConcernServlet extends HttpServlet {
	private ConcernDao concernDao = new ConcernDao();
	private UsersinfoDao usersinfoDao = new UsersinfoDao();
	private NotificationDao notificationDao = new NotificationDao();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getParameter("method");
		String suid = req.getParameter("suid");
		HttpSession session = req.getSession();
		Users user = (Users) session.getAttribute("user");
		//初始化
		int n = 0;
		int uid = user.getUid();
		
		
		///是否关注
		int mode = concernDao.hasFollow(Integer.parseInt(suid), uid);
		Timestamp ctime = Times.getSystemTime();
		if ("add".equals(method)) {
			if (mode > 0) {
				//1代表关注状态，若是为0代表未关注状态，ustate
				int m = concernDao.updateFollow(suid, uid, 1);
			}
				//添加关注addFollow(uid, suid, mode, ctime);
			n = concernDao.addFollow(uid, suid, mode, ctime);
			if (n > 0) {
				notificationDao.addNotify(uid, 1, 0, 0, 0, 0, Integer.parseInt(suid), 0, 0, null, ctime, 0);
			//addFansNum表示的是用户关注者数，当state=1的时候，用户关者数+1；
				usersinfoDao.addFansNum(Integer.parseInt(suid), 1);
				//addFollowNum代表的是用户正在关注数，当state=1的时候，正在关注者+1；
				usersinfoDao.addFollowNum(uid, 1);
			}
			Usersinfo info = usersinfoDao.getInfos(uid);
			session.setAttribute("info", info);
		}
		//取消关注
		if ("del".equals(method)) {
			if (mode > 0) {
				//当已经关注的时候，也就是ustate>0的时候，将ustate变为0为未关注状态
				int m = concernDao.updateFollow(suid, uid, 0);
			}
			n = concernDao.delFollow(uid, suid);
			if (n > 0) {
				//addFansNum表示的是用户关注者数，当state=0的时候，用户关者数-1；
				usersinfoDao.addFansNum(Integer.parseInt(suid), 0);
				//addFollowNum代表的是用户正在关注数，当state=0的时候，正在关注者-1；
				usersinfoDao.addFollowNum(uid, 0);
			}
			Usersinfo info = usersinfoDao.getInfos(uid);
			session.setAttribute("info", info);
		}
		if (n > 0) {
			resp.getWriter().print("1");
		} else {
			resp.getWriter().print("0");
		}
	}
}
