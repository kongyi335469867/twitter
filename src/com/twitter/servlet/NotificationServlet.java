package com.twitter.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.dao.ForwardsDao;
import com.twitter.dao.NotificationDao;
import com.twitter.dao.TweetsDao;
import com.twitter.dao.UsersinfoDao;
import com.twitter.bean.Notification;
import com.twitter.bean.Users;
import com.twitter.bean.Usersall;
import com.twitter.bean.Utweets;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/notify.do")
public class NotificationServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private NotificationDao notificationDao = new NotificationDao();
	private UsersinfoDao usersinfoDao = new UsersinfoDao();
	private TweetsDao tweetsDao = new TweetsDao();
	private ForwardsDao forwardsDao = new ForwardsDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String method = request.getParameter("method");
		//判断已读状态
		if ("all".equals(method)) {
			toGetAllNotify(request, response);
		}
		//判断未读状态
		if ("noread".equals(method)) {
			toGetNoRead(request, response);
		}
	}
//获取未读的通知
	private void toGetNoRead(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		try {
			
			Users user = (Users) session.getAttribute("user");
			System.out.println("NotificationServlet获取session的user值:"+user);
			if(user != null) {
				int uid = user.getUid();
				//未读信息的条数
				int n = notificationDao.getNoRead(uid);
				response.getWriter().print(n);
				System.out.println("NotificationServlet获取未读信息用户id:"+uid);
				System.out.println("NotificationServlet获取未读信息条数:"+n);
			}
			
		}catch(NullPointerException e){
			e.printStackTrace();
			System.out.println("NotificationServlet获取未读信息用户id为Null");
		}
	}
//获得所有的通知内容
	private void toGetAllNotify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String page = request.getParameter("page");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		notificationDao.setState(uid);
		List<Notification> notifications = notificationDao.getAll(uid, Integer.parseInt(page));
		if (notifications == null) {
			response.getWriter().print("none");
			return;
		}
		JSONArray js = new JSONArray();
		for (Notification notification : notifications) {
			//关注
			if (notification.getNtype() == 1) {
				int nuid = notification.getNuid();
				Usersall users = usersinfoDao.getInfotwo(nuid);
				notification.setUser(users);
				changeTime(notification, notification.getNtime());
			}
			//点赞
			if (notification.getNtype() == 2) {
				int nliketid = notification.getNliketid();
				Utweets utweets = tweetsDao.getTweetsByTid(nliketid);
				int nuid = notification.getNuid();
				Usersall users = usersinfoDao.getInfotwo(nuid);
				notification.setUser(users);
				notification.setUtweets(utweets);
				changeTime(notification, notification.getNtime());
			}
			//转发
			if (notification.getNtype() == 3) {
				int nretid = notification.getNretid();
				Utweets utweets = tweetsDao.getTweetsByTid(nretid);
				int tid = forwardsDao.getForward(nretid, notification.getNuid()).getTid();
				Utweets utweetone = tweetsDao.getTweetsByTid(tid);
				notification.setUtweets(utweetone);
				notification.setUtweetstwo(utweets);
				changeTime(notification, notification.getNtime());
			}
			//回复
			if (notification.getNtype() == 4) {
				int nhuitid = notification.getNhuitid();
				int nuid = notification.getNuid();
				Utweets utweets = tweetsDao.getTweetsByTid(nhuitid);
				notification.setUtweets(utweets);
				Usersall users = usersinfoDao.getInfotwo(nuid);
				notification.setUser(users);
				changeTime(notification, notification.getNtime());
			}
			js.add(getJsonObj(notification.getNid(), notification.getNuid(), notification.getNtype(),
					notification.getTime(), notification.getUtweets(), notification.getUtweetstwo(),
					notification.getUser(), notification.getNrcontent()));
		}

		response.getWriter().print(js.toString());
	}

	public JSONObject getJsonObj(int nid, int nuid, int ntype, String time, Utweets utweets, Utweets utweetstwo,
			Usersall usersall, String nrcontent) {
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("nid", nid);
		jsonobj.put("nuid", nuid);
		jsonobj.put("ntype", ntype);
		jsonobj.put("time", time);
		//第一条推文不为空和Tpic不为空
		if (utweets != null && utweets.getTpic() != null) {
			jsonobj.put("utweets",
					"{\"uname\":\"" + utweets.getUname() + "\",\"ulogo\":\"" + utweets.getUlogo() + "\",\"uid\":\""
							+ utweets.getUid() + "" + "\",\"urealname\":\"" + utweets.getUrealname() + "\",\"uaite\":\""
							+ utweets.getUaite() + "\",\"tcontent\":\"" + utweets.getTcontent() + "\",\"tpic\":\""
							+ utweets.getTpic() + "\"}");
		} 
		//推文不为空和Tpic为空，缺少tpic	
		else if (utweets != null && utweets.getTpic() == null) {
			jsonobj.put("utweets",
					"{\"uname\":\"" + utweets.getUname() + "\",\"ulogo\":\"" + utweets.getUlogo() + "\",\"uid\":\""
							+ utweets.getUid() + "\",\"urealname\":\"" + utweets.getUrealname() + "\",\"uaite\":\""
							+ utweets.getUaite() + "\",\"tcontent\":\"" + utweets.getTcontent() + "\"}");
		} else {
			jsonobj.put("utweets", utweets + "");
		}
		if (utweetstwo != null && utweetstwo.getTpic() != null) {
			jsonobj.put("utweetstwo", "{\"uname\":\"" + utweetstwo.getUname() + "\",\"ulogo\":\""
					+ utweetstwo.getUlogo() + "\",\"uid\":\"" + utweetstwo.getUid() + "" + "\",\"urealname\":\""
					+ utweetstwo.getUrealname() + "\",\"uaite\":\"" + utweetstwo.getUaite() + "\",\"tcontent\":\""
					+ utweetstwo.getTcontent() + "\",\"tpic\":\"" + utweetstwo.getTpic() + "\"}");
		} else if (utweetstwo != null && utweetstwo.getTpic() == null) {
			jsonobj.put("utweetstwo",
					"{\"uname\":\"" + utweetstwo.getUname() + "\",\"ulogo\":\"" + utweetstwo.getUlogo()
							+ "\",\"uid\":\"" + utweetstwo.getUid() + "\",\"urealname\":\"" + utweetstwo.getUrealname()
							+ "\",\"uaite\":\"" + utweetstwo.getUaite() + "\",\"tcontent\":\""
							+ utweetstwo.getTcontent() + "\"}");
		} else {
			jsonobj.put("utweetstwo", utweetstwo + "");
		}
		jsonobj.put("usersall", usersall);
		jsonobj.put("nrcontent", nrcontent);
		return jsonobj;
	}
//收到通知的时间
	public void changeTime(Notification notification, Timestamp ntime) {

		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日 HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
		SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm");
		//获得Calendar的对象
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		//年月日时分秒
		String nowyear = year + "-01-01 00:00:00";
		Timestamp yeardate = Timestamp.valueOf(nowyear);

		String nowday = year + "-" + month + "-" + day + " 00:00:00";
		Timestamp date = Timestamp.valueOf(nowday);
		// 此处转换为毫秒数
		long millionSeconds = ntime.getTime();// 毫秒
		long nowSeconds = System.currentTimeMillis();
		long chazhi = nowSeconds - millionSeconds;

		if (chazhi < 60000) {
			notification.setTime("现在");
		} else if (chazhi < 3600000) {
			long n = chazhi / 60000;
			notification.setTime(n + "分钟");
			//当此刻的时间大于date的时间，仅显示时分
		} else if (ntime.after(date)) {
			notification.setTime(sdf3.format(ntime));
			//当此刻时间大于昨天的时间时，显示年月日时分秒
		} else if (ntime.after(yeardate)) {
			notification.setTime(sdf.format(ntime));
			//显示月日时分
		} else {
			notification.setTime(sdf2.format(ntime));
		}
	}
}
