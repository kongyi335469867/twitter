package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.bean.Replayall;
import com.twitter.util.DBUtil;

public class ReplaysDao {
	//增加一条回复信息
	public int addReplay(int tid, String neirong, int uid, Timestamp rtime) {
		String sql = "insert into replys(uid,tid,rcontent,rtime) values(?,?,?,?)";
		int n = DBUtil.update(sql,uid,tid,neirong,rtime);
		return n;
	}
	
	//查询回复信息
	public List<Replayall> getAllReplay(int tid,int page){
		String sql = "select rid,uid,tid,rcontent,rtime,uname,urealname,ulogo,uaite from replyall where tid=? order by rtime desc limit ?,6";
		@SuppressWarnings("unchecked")
		List<Replayall> list = DBUtil.query(Replayall.class, sql, tid,page);
		if(list.size()>0) {
			return list;
		}
		
		return null;
	}
}
