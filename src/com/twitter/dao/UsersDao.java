package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.bean.Signin;
import com.twitter.bean.Users;
import com.twitter.util.DBUtil;
@SuppressWarnings("unchecked")
public class UsersDao {
	public int getDayUp(String time) {
		String sql = "select * from signin where DATE_FORMAT(stime,'%Y-%m-%d')=? ";
		
		List<Signin> result = DBUtil.query(Signin.class, sql, time);
		return result.size();
	}

	public int getUserNum() {
		return DBUtil.queryUserNum();
	}

	public  Users checkLogin(String username, String password) {
		String sql = "select uid, uname,  urealname, uaite, ustate, utime, uonline   from users where (uname=? and upwd=?) or (uaite=? and upwd=?)  limit 1";
		List<Users> list = DBUtil.query(Users.class, sql, username, password, username, password);
		System.out.println(password);
		if (list.size() > 0) {
			return list.get(0);
		}
		
		return null;
				
	}
	
	
	public Users findById(int uid) {
		String sql = "select uid, uname,  urealname, uaite, ustate, utime, uonline   from users where uid=?  limit 1";
		List<Users> list = DBUtil.query(Users.class, sql, uid);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;

	}

	public boolean checkUsername(String username) {
		String sql = "select uid, uname,  urealname, uaite, ustate, utime   from users where uname=?  limit 1";
		List<Users> list = DBUtil.query(Users.class, sql, username);
		if (list.size() > 0) {
			return true;
		}
		return false;
	}
	//添加用户
	public int addUser(String username, String password, String urealname, String aite, Timestamp utime) {
		String sql = "insert into users(uname, upwd, urealname, uaite,utime) values(?,?,?,?,?)";
		int n = DBUtil.update(sql, username, password, urealname, aite, utime);
		return n;
	}
	//检查登陆名是否符合
	public boolean checkUaite(String uaite) {
		String sql = "select uid, uname,  urealname, uaite, ustate, utime ,uonline  from users where uaite=?  limit 1";
		List<Users> list = DBUtil.query(Users.class, sql, uaite);
		if (list.size() > 0) {
			return true;
		}
		return false;
	}

	public int updateOnline(int uonline, int uid) {  //通过uid更新用户表user，是否在线uonline的值，0不在线，1在线
		String sql = "update users set uonline=? where uid=?";
		int n = DBUtil.update(sql, uonline, uid);
		return n;
	}

	public int updateState(String uid, String state) {
		String sql = "update users set ustate=? where uid=?";
		int n = DBUtil.update(sql, state, uid);
		return n;
	}
	
	public static void main(String[] args) {
		UsersDao u = new UsersDao();
		Users user = u.checkLogin("min", "123");
		System.out.println(user);
	}
}
