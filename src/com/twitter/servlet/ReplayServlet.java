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

import com.twitter.dao.ReplaysDao;
import com.twitter.bean.Replayall;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/reply.do")
public class ReplayServlet extends HttpServlet {
	private ReplaysDao replysDao = new ReplaysDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String page = request.getParameter("page");
		String tid = request.getParameter("tid");
		List<Replayall> replys = replysDao.getAllReplay(Integer.parseInt(tid), Integer.parseInt(page));
		//当回复为空时，返回空
		if (replys == null) {
			return;
		}
		JSONArray js = new JSONArray();
		for (Replayall reply : replys) {
			Timestamp rtime = reply.getRtime();
			SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日 HH:mm");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
			SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm");
			Calendar cal = Calendar.getInstance();
			int day = cal.get(Calendar.DATE);
			int month = cal.get(Calendar.MONTH) + 1;
			int year = cal.get(Calendar.YEAR);

			String nowyear = year + "-01-01 00:00:00";
			Timestamp yeardate = Timestamp.valueOf(nowyear);

			String nowday = year + "-" + month + "-" + day + " 00:00:00";
			Timestamp date = Timestamp.valueOf(nowday);
			// 此处转换为毫秒数
			long millionSeconds = rtime.getTime();// 毫秒
			long nowSeconds = System.currentTimeMillis();
			long chazhi = nowSeconds - millionSeconds;

			if (chazhi < 60000) {
				reply.setTime("现在");
			} else if (chazhi < 3600000) {
				long n = chazhi / 60000;
				reply.setTime(n + "分钟");
			} else if (rtime.after(date)) {
				reply.setTime(sdf3.format(rtime));
			} else if (rtime.after(yeardate)) {
				reply.setTime(sdf.format(rtime));
			} else {
				reply.setTime(sdf2.format(rtime));
			}

			js.add(getJsonObj(reply.getRid(), reply.getUid(), reply.getTid(), reply.getRcontent(), reply.getTime(),
					reply.getUname(), reply.getUrealname(), reply.getUaite(), reply.getUlogo()));
		}
		response.getWriter().print(js.toString());
	}
//JSONObject-lib包是一个beans,collections,maps,java arrays和xml和JSON互相转换的包。
	public JSONObject getJsonObj(int rid, int uid, int tid, String rcontent, String time, String uname,
			String urealname, String uaite, String ulogo) {
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("rid", rid);
		jsonobj.put("uid", uid);
		jsonobj.put("tid", tid);
		jsonobj.put("rcontent", rcontent);
		jsonobj.put("time", time);
		jsonobj.put("uname", uname);
		jsonobj.put("urealname", urealname);
		jsonobj.put("uaite", uaite);
		jsonobj.put("ulogo", ulogo);
		return jsonobj;
	}
}
