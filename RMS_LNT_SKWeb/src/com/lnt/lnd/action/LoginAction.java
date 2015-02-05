package com.lnt.lnd.action;

import java.security.MessageDigest;
import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lnt.lnd.entity.Authentication;
import com.lnt.lnd.facade.AuthenticationFacadeRemote;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements RequestAware,SessionAware
{
	private String username;
	private String password;
	private Authentication auth;
	private String tabpage;
	private Map request;
	private Map session;
	
	public void setAuth(Authentication auth) {
		this.auth = auth;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEncryptedPassword(String password)
    {
    	byte[] unencodedPassword = password.getBytes();
		MessageDigest md = null;
		try {
		md = MessageDigest.getInstance("MD5");
		} 
		catch (Exception e) {}
		md.reset();
		md.update(unencodedPassword);
		byte[] encodedPassword = md.digest();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < encodedPassword.length; i++) {
		if (((int) encodedPassword[i] & 0xff) < 0x10) {buf.append("0");	}
		buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
		}
		String encryptedPassword=buf.toString();
		return encryptedPassword;
		
	}
	public String execute()
	{
		try {
			InitialContext ic=new InitialContext();
			AuthenticationFacadeRemote remote=(AuthenticationFacadeRemote)ic.lookup("auth#com.lnt.lnd.facade.AuthenticationFacadeRemote");
			Authentication auth=new Authentication();
			this.password=getEncryptedPassword(getPassword());
			auth=remote.Authenticate(this.username, this.password);
			ic.close();/*IC CLOSED*/
			if(auth==null)
			{	addActionError("Incorrect username or password");
				return "ERROR";
			}
			else
			{	setAuth(auth);
				if(auth.getRole_Type().equals("SA"))
				{
					setTabpage("SA_tabs.jsp");
				}else if(auth.getRole_Type().equals("AD"))
				{
					setTabpage("AD_tabs.jsp");
				}else if(auth.getRole_Type().equals("PU"))
				{
					setTabpage("PU_tabs.jsp");
					
				}				
				else
				{
					return "ERROR";
				}
								
				session.put("user_no", auth.getUser_no());
				session.put("roleType",auth.getRole_Type() );
				session.put("username",auth.getUsername() );
				/*this below code for Checking First Login is not functioning*/
				/*if(auth.isFirst_login()==false)
				{
					return "changePassword";
				}*/
				
						
			}	
		} catch (NamingException e) {
			
			e.printStackTrace();
			return "ERROR";
		}
		
		return "SUCCESS";
	}
	public Map getRequest() {
		return request;
	}
	public String getTabpage() {
		return tabpage;
	}
	public void setTabpage(String tabpage) {
		this.tabpage = tabpage;
	}
	public Authentication getAuth() {
		return auth;
	}
	public String checkRole()
	{
		return auth.getRole_Type();
	}
	@Override
	public void setRequest(Map request) 
	{
		this.request=request;		
	}
	
	
}
