package com.lnt.lnd.action;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;


public class LogoutAction implements SessionAware
{
	private Map session;
	private String Msg;
	public String execute()
	{	
		try {	session.put("user_no", null);
				session.put("username", null);
				session.put("roleType", null);
				session. remove("user_no");
				session. remove("username");
				session. remove("roleType");
				session.clear();
				setMsg("Logout successfully");
			/*((org.apache.struts2.dispatcher.SessionMap) session).invalidate();*/
				System.out.println("Called from logout "+session.get("username"));
			
		} catch (Exception e) 
		{
			
			e.printStackTrace();
		}  
		
	
		return "SUCCESS";
	}
	public String getMsg() {
		return Msg;
	}
	public void setMsg(String msg) {
		Msg = msg;
	}
	@Override
	public void setSession(Map session) {
		this.session=session;
		
	}

}
