package com.twitter.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.twitter.util.BackstageDBUtil;

public class BackstageDaoImpl {
	/*单例模式*/
	private static BackstageDaoImpl backstageDaoImpl;
	private BackstageDaoImpl(){
		
	}
	public static BackstageDaoImpl getBackstageDaoImpl(){
		if(backstageDaoImpl == null){
			backstageDaoImpl = new BackstageDaoImpl();
		}
		return backstageDaoImpl;
	}
	
	/*查询在线人数*/
	public int queryOnline(){
		int onlineNum = 0;
		String sql = "select count(uid) from users where uonline = 1";
		Object[] os = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				onlineNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return onlineNum;
	}
	/*查询今日访问量*/
	public int queryVisits(){
		int visitsNum = 0;
		String sql = "select count(uid) from signin where DATE(stime) = CURDATE() ";
		Object[] os = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				visitsNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return visitsNum;
	}
	/*查询推文数*/
	public int queryTweets(){
		int tweetsNum = 0;
		String sql = "select count(tid) from tweets";
		Object[] os = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				tweetsNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tweetsNum;
	}
	/*查询总人数*/
	public int queryOverAll(){
		int overAllNum = 0;
		String sql = "select count(uid) from users";
		Object[] os = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				overAllNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return overAllNum;
	}
	
	
}
