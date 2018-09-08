package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

<<<<<<< HEAD
import com.twitter.pojo.Likes;
import com.twitter.util.DBUtil;

public class LikesDao {
	//加上limit 1，只要找到了对应的一条记录，就不会继续向下扫描了，效率会大大提高。
	public boolean selLike(int uid, int tid) {
		String sql = "select lid,tid,uid,ltime  from likes where uid=? and tid=? limit 1";
		List<Likes> list = DBUtil.query(Likes.class, sql, uid, tid);

		if (list.size() > 0) {
			return true;
		}

		return false;
	}
//点赞
	public int addLikes(int uid, int tid, Timestamp ttime) {
		String sql = "insert into likes(uid, tid, ltime) values(?,?,?)";
		int n = DBUtil.update(sql, uid, tid, ttime);
		return n;
	}
//取消点赞
=======
import com.twitter.bean.Likes;
import com.twitter.util.DBUtil;

public class LikesDao {
	//查询点赞
	public boolean selLike(int uid, int tid) {	
		String sql = "select lid,tid,uid,ltime  from likes where uid=? and tid=? limit 1";
		@SuppressWarnings("unchecked")		
		List<Likes> list = DBUtil.query(Likes.class, sql, uid, tid);
		if (list.size() > 0) {
			return true;
		}

		return false;
	}
	//添加点赞
	public int addLikes(int uid, int tid, Timestamp ttime) {
		String sql = "insert into likes(uid, tid, ltime) values(?,?,?)";
		int n = DBUtil.update(sql, uid, tid, ttime);
		return n;
	}

	//取消点赞
>>>>>>> branch 'master' of https://git.coding.net/JIMMY_MIN/twitter.git
	public int delLikes(int uid, int tid) {
		String sql = "delete from likes where uid=? and tid=?";
		int n = DBUtil.update(sql, uid, tid);
		return n;
	}
}