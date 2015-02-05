package com.lnt.lnd.facade;
import javax.ejb.Remote;

@Remote
public interface AuthenticationFacadeRemote 
{
	com.lnt.lnd.entity.Authentication Authenticate(String login_psno,String password);
	String checkRole(int user_no);
	boolean isFirstLogin(int user_no);
	boolean changePassword(String user_no,String cur_password,String new_password );
	
}
