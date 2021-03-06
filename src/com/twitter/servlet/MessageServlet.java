package com.twitter.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.dao.MessageDao;
import com.twitter.bean.Messageall;
import com.twitter.bean.Users;
import com.twitter.bean.Usersall;
import com.twitter.util.Times;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/message.do")
public class MessageServlet extends HttpServlet {
	static MessageDao messageDao = new MessageDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String method = request.getParameter("method");
		if ("liebiao".equals(method)) {
			toGetLieBiao(request, response);
		}
		if ("msg".equals(method)) {
			toGetMsg(request, response);
		}
		if ("addmsg".equals(method)) {
			toAddMsg(request, response);
		}
		if ("shuaxin".equals(method)) {
			toShuaxinMsg(request, response);
		}
		if ("hasnew".equals(method)) {
			toHasNew(request, response);
		}

		if ("addfriend".equals(method)) {
			toAddFriend(request, response);
		}
		if ("del".equals(method)) {
			toDel(request, response);
		}
		if ("m".equals(method)) {
			request.getRequestDispatcher("message.jsp").forward(request, response);
		}
	}
//删除好友或者信息
	private void toDel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int fuid = user.getUid();
		String suid = request.getParameter("uid");
		messageDao.delFriend(fuid, suid);
		response.getWriter().print("success");
	}
//添加好友
	//setExcludes()这个方法，简单的说，这个就是过滤掉不需要的属性，
	
	private void toAddFriend(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int fuid = user.getUid();
		List<Usersall> usersalls = messageDao.addFriend(fuid);
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "upwd" });
		JSONArray array = JSONArray.fromObject(usersalls, config);
		response.getWriter().print(array.toString());
	}
//发送新消息
	private void toHasNew(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		
		
		
		try {
			Users user = (Users) session.getAttribute("user");
			if(user != null) {
				int fuid = user.getUid();
				int n = messageDao.hasNew(fuid);
				response.getWriter().print(n);
				//System.out.println("MessageServlet发送新消息用户id:"+fuid);
				//System.out.println("MessageServlet发送新消息条数"+n);
			}
			
		}catch(NullPointerException e){
			e.printStackTrace();
			//System.out.println("MessageServlet发送新消息用户id为Null");
		}
	}
//刷新
	private void toShuaxinMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String suid = request.getParameter("uid");
		String mid = request.getParameter("mid");
		HttpSession session = request.getSession();
		
		
		try {
			
			Users user = (Users) session.getAttribute("user");
			//System.out.println("NotificationServlet获取session的user值:"+user);
			if(user != null) {
				int fuid = user.getUid();
				List<Messageall> list = messageDao.shuaXin(fuid, mid, suid);
				if (list != null) {
					messageDao.toRead(fuid, suid);
					JsonConfig config = new JsonConfig();
					config.setExcludes(new String[] { "mtime" });
					JSONArray jsonArray = JSONArray.fromObject(list, config);
					response.getWriter().print(jsonArray.toString());
				}
			 }
		}catch(NullPointerException e){
			e.printStackTrace();
			System.out.println("NotificationServlet获取未读信息用户id为Null");
		}
	}
//添加消息
	private void toAddMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String mcontent = request.getParameter("mcontent");
		String suid = request.getParameter("uid");
		if (mcontent == null || "".equals(mcontent.trim())) {
			return;
		}
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int fuid = user.getUid();
		Timestamp mtime = Times.getSystemTime();
		int n = messageDao.addMsg(fuid, Integer.parseInt(suid), mcontent, mtime, 0);
		if (n > 0) {
			response.getWriter().print("ok");
		}
	}
//获取消息
	private void toGetMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String suid = request.getParameter("uid");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int fuid = user.getUid();
		List<Messageall> list = messageDao.findByTwoId(suid, fuid);
		if (list != null) {
			messageDao.toRead(fuid, suid);
			JsonConfig config = new JsonConfig();
			config.setExcludes(new String[] { "mtime" });
			JSONArray jsonArray = JSONArray.fromObject(list, config);
			response.getWriter().print(jsonArray.toString());
		}
	}
	//获取列表信息，并且按照发送以及接收信息的时间排序

	private void toGetLieBiao(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		
		try {
			Users user = (Users) session.getAttribute("user");
			if(user != null) {
				int uid = user.getUid();
				
				List<Messageall> listF = messageDao.findById(uid, 1);
				List<Messageall> listS = messageDao.findById(uid, 2);
				int num = 0;

				int fSize = listF.size();
				int sSize = listS.size();

				if (fSize != 0 && sSize == 0) {
					listS = listF;
				} else {
					if (fSize < sSize) {
						for (int i = 0; i < fSize; i++) {
							num = 0;
							for (int j = 0; j < sSize; j++) {
								if (listF.get(i).getSuid() != listS.get(j).getFuid()) {
									num++;
								}
								if (listF.get(i).getSuid() == listS.get(j).getFuid()) {
									if (listS.get(j).getMtime().before(listF.get(i).getMtime())) {
										listS.set(j, listF.get(i));
									}
								}
								if (num == sSize) {
									listS.add(listF.get(i));
								}
							}
						}
					} else {
						for (int i = 0; i < sSize; i++) {
							num = 0;
							for (int j = 0; j < fSize; j++) {
								if (listS.get(i).getFuid() != listF.get(j).getSuid()) {
									num++;
								}
								if (listS.get(i).getFuid() == listF.get(j).getSuid()) {
									if (listF.get(j).getMtime().before(listS.get(i).getMtime())) {
										listF.set(j, listS.get(i));
									}
								}
								if (num == fSize) {
									listF.add(listS.get(i));
								}
							}
						}
						listS = listF;
					}
				}
				Collections.sort(listS, (o1, o2) -> {
					return o2.getMtime().compareTo(o1.getMtime());
				});

				for (Messageall messageall : listS) {
					formatDate(messageall, messageall.getMtime());
				}
				JsonConfig config = new JsonConfig();
				config.setExcludes(new String[] { "mtime" });
				JSONArray jsonArray = JSONArray.fromObject(listS, config);
				response.getWriter().print(jsonArray.toString());
				//System.out.println("MessageServlet发送新消息用户id:"+fuid);
				//System.out.println("MessageServlet发送新消息条数"+n);
			}
			
		}catch(NullPointerException e){
			e.printStackTrace();
			//System.out.println("MessageServlet发送新消息用户id为Null");
		}
		// List<Messageall> listT = new ArrayList<Messageall>();
		
	}

	public void formatDate(Messageall messageall, Timestamp ttime) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy-MM-dd");

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);

		String nowyear = year + "-01-01 00:00:00";
		Timestamp yeardate = Timestamp.valueOf(nowyear);

		if (ttime.after(yeardate)) {
			messageall.setTime(sdf.format(ttime));
		} else {
			messageall.setTime(sdf2.format(ttime));
		}
	}

}
