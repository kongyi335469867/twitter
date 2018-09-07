package com.twitter.servlet;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class Listener implements ServletRequestListener{

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {
		System.out.println("监听器销毁");
	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		System.out.println("监听器创建完成");
	}

}
