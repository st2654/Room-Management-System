package com.lnt.lnd.action;

import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lnt.lnd.entity.Authentication;
import com.lnt.lnd.facade.AuthenticationFacadeRemote;

public class ChangePasswordAction implements SessionAware,RequestAware
{
	private String cur_password;
	private String new_password;
	private String con_password;
	private Map session;
	private Map request;
	public String getCur_password() {
		return cur_password;
	}
	public void setCur_password(String cur_password) {
		this.cur_password = cur_password;
	}
	public String getNew_password() {
		return new_password;
	}
	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}
	public String getCon_password() {
		return con_password;
	}
	public void setCon_password(String con_password) {
		this.con_password = con_password;
	}
	
	public String execute()
	{	String user_no=(String)session.get("user_no");
		if(user_no!=null)
		{
		InitialContext ic;
		try {
			ic = new InitialContext();
			AuthenticationFacadeRemote remote=(AuthenticationFacadeRemote)ic.lookup("auth#com.lnt.lnd.facade.AuthenticationFacadeRemote");
			Authentication auth=new Authentication();
			if(remote.changePassword(user_no,cur_password,new_password ))
			{
				request.put("msg", "Password Changed!!");
				
			}
			
			return "SUCCESS";
		
			} catch (NamingException e) 
			{
			
				e.printStackTrace();
				return "ERROR";
			}
				
		
		}
		else
		{
			return "ERROR";
		}	
	}
	@Override
	public void setSession(Map session) {
		this.session=session;
		
	}
	@Override
	public void setRequest(Map request) 
	{
		this.request=request;		
	}
}
