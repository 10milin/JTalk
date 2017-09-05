package com.jtalk.core;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import com.jtalk.dto.MemberDTO;

public class LoginManager implements HttpSessionBindingListener{
	private static LoginManager loginManager = null;
	private static Hashtable loginUsers;
	
	public LoginManager() {
		if(loginUsers == null) {
			loginUsers = new Hashtable();
		}
		loginManager = this;
	}
	
	public static synchronized LoginManager getInstance() {
		if(loginManager == null) {
			loginManager = new LoginManager();
		}
		return loginManager;
	}
	
		
	public boolean isUsing(String userID) {
		return loginUsers.containsValue(userID);
	}
	
	public void removeSession(String userID) {
		Enumeration e = loginUsers.keys();
		HttpSession session = null;
		
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			if(loginUsers.get(session).equals(userID)) {
				session.invalidate();
			}
		}
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent arg0) {
		MemberDTO member = (MemberDTO)arg0.getSession().getAttribute("member");
		synchronized(loginUsers) {
			loginUsers.put(arg0.getSession(), member.getEmail());
		}
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		synchronized(loginUsers) {
			loginUsers.remove(arg0.getSession());
		}
	}
}
