package com.twitter.service;

import com.twitter.dao.BackstageDaoImpl;

public class BackstageServiceImpl {
	
	/*单例模式*/
	private static BackstageServiceImpl backstageServiceImpl;
	private BackstageServiceImpl(){		
	}
	public static BackstageServiceImpl getBackstageServiceImpl(){
		if(backstageServiceImpl == null){
			backstageServiceImpl = new BackstageServiceImpl();
		}
		return backstageServiceImpl;
	}
	
	/*查询在线人数*/
	public int queryOnline(){
		int onlineNum = BackstageDaoImpl.getBackstageDaoImpl().queryOnline();
		return onlineNum;
	}
	
	/*查询今日访问量*/
	public int queryVisits(){
		int visitsNum = BackstageDaoImpl.getBackstageDaoImpl().queryVisits();
		return visitsNum;
	}
	
	/*查询推文数*/
	public int queryTweets(){
		int tweetsNum = BackstageDaoImpl.getBackstageDaoImpl().queryTweets();
		return tweetsNum;
	}
	
	/*查询总人数*/
	public int queryOverAll(){
		int overAllNum = BackstageDaoImpl.getBackstageDaoImpl().queryOverAll();
		return overAllNum;
	}
	
	
}
