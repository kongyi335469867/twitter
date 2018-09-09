package com.twitter.util;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


import com.twitter.dao.SigninDao;
import com.twitter.dao.UsersDao;
import com.twitter.bean.Users;

public class MySessionListener implements HttpSessionListener {
	private UsersDao usersDao = new UsersDao();
	private SigninDao signinDao = new SigninDao();


	@Override
	public void sessionCreated(HttpSessionEvent event) {

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return;
		}
		ServletContext servletContext = event.getSession().getServletContext();
		servletContext.removeAttribute(((Users) session.getAttribute("user")).getUname());
		Integer onlineNum = (Integer) servletContext.getAttribute("onlineNum");
		if (onlineNum > 0) {
			servletContext.setAttribute("onlineNum", onlineNum - 1);
		}
		Object signinid = session.getAttribute("signinid");

		if (user == null || signinid == null) {
			return;
		}
		int uid = user.getUid();
		Timestamp sdtime = Times.getSystemTime();
		usersDao.updateOnline(0, uid);
		signinDao.updateSignin((Integer) signinid, sdtime);

	}

}
