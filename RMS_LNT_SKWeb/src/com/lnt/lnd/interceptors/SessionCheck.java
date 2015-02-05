package com.lnt.lnd.interceptors;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.opensymphony.xwork2.util.ValueStack;

public class SessionCheck implements Interceptor,RequestAware,SessionAware
{
	private Map session;
	private Map request;
	private String user_no;
	private String roleType;
	private String username;
	@Override
	public void destroy() 
	{	
	}
	@Override
	public void init() 
	{	
	}
	@Override
	public String intercept(ActionInvocation ac) throws Exception 
	{		System.out.println("Session Check Called");
			ActionContext actCon= ac.getInvocationContext();
			session=actCon.getSession();
			ValueStack vs=ac.getStack();
			String s=null;
			String username=(String) vs.findValue("username");
			String password=(String) vs.findValue("password");
			System.out.println(session.get("user_no")+" --  "+session.get("username"));
			try
			{
			if(username!=null && password!=null )
			{	System.out.println("Not Null "+session.get("username"));
			
				if(session.get("user_no")==null && session.get("roleType")==null && session.get("username")==null)
				{
				System.out.println("New Login");
				s=ac.invoke();
				}else if(session.get("user_no")==null || session.get("roleType")==null || session.get("username")==null)
				{
				System.out.println("1 IF 1");		
				request.put("msg", "Session Expired.Login Again");
				s="ERROR";
				}
				else if(session.get("user_no")!=null && session.get("roleType")!=null && session.get("username")!=null)
				{
				System.out.println("1 IF 2");		
				s=ac.invoke();
				}

			}
			else if(username==null && password==null )
			{ System.out.println("in here");
			if(session.get("user_no")==null || session.get("roleType")==null || session.get("username")==null)
				{
				System.out.println("IF 1");		
				request.put("msg", "Session Expired.Login Again");
				s="ERROR";
				}
			else if(session.get("user_no")!=null && session.get("roleType")!=null && session.get("username")!=null) 
			{	System.out.println("IF 2");	
				s= ac.invoke();
			}
			}
			
			
				
			}catch(Exception e)
			{
				System.out.println("Error Occured "+ e);
				s="ERROR";
			}
			return s;
			
			
	}
	@Override
	public void setRequest(Map request) 
	{
		this.request=request;		
	}
	@Override
	public void setSession(Map session)
	{
		this.session=session;		
	}

}
