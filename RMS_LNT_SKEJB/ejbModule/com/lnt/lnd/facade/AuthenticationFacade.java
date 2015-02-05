package com.lnt.lnd.facade;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.lnt.lnd.entity.Authentication;

@Stateless(mappedName = "auth")
public class AuthenticationFacade implements AuthenticationFacadeRemote 
{
	@PersistenceContext
    EntityManager em;
    public AuthenticationFacade() 
    {
       
    }

	@Override
	public com.lnt.lnd.entity.Authentication Authenticate(String login_psno,String password) 
	{
		String jpql="select auth from Authentication auth where auth.login_psno='"+login_psno+"' and auth.password='"+password+"'";
		Query query= em.createQuery(jpql);
		try{
		Authentication auth= (Authentication)query.getSingleResult();
		if(auth!=null)
		{
			return auth;
			
		}
		else 
		{
			return null;
		}
		}
		catch(Exception e)
		{
			return null;
		}
		
		
	}

	@Override
	public String checkRole(int user_no) 
	{
		String jpql="select auth.role_Type from Authentication auth where auth.user_no='"+user_no+"'";
		Query query= em.createQuery(jpql);
		return query.getParameter(1, com.lnt.lnd.entity.Authentication.class).toString();
	}

	@Override
	public boolean isFirstLogin(int user_no) 
	{
		String jpql="select auth.role_Type from Authentication auth where auth.user_no='"+user_no+"'";
		Query query= em.createQuery(jpql);
		return false;
	}

	@Override
	public boolean changePassword(String user_no, String cur_password,String new_password) 
	{		String jpql="select auth from Authentication auth where auth.user_no='"+user_no+"' and auth.password='"+cur_password+"'"; 
			Query query= em.createQuery(jpql);
			Authentication auth=(Authentication)query.getSingleResult();
			if(auth!=null)
			{
				auth.setPassword(new_password);
				
				try {
					em.merge(auth);
					return true;
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
			}
		return false;
	}

}
