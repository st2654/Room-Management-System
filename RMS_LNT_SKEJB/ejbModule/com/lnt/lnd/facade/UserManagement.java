package com.lnt.lnd.facade;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Session Bean implementation class UserManagement
 */
@Stateless(mappedName = "user")

public class UserManagement implements UserManagementRemote {
@PersistenceContext
EntityManager em;
    /**
     * Default constructor. 
     */
    public UserManagement() {
        // TODO Auto-generated constructor stub
    }
    @Override
	public void createUser(com.lnt.lnd.entity.UserManagement u) {
		// TODO Auto-generated method stub
		em.persist(u);
	}

	

	@Override
	public void editUser(com.lnt.lnd.entity.UserManagement u) {
		// TODO Auto-generated method stub
		em.merge(u);
        
	}

	@Override
	public int deleteUser(String psno) {
		Query q = em.createQuery("update UserManagement u SET del_flag=true where u.login_psno=?1");
		q.setParameter(1, psno);
	q.executeUpdate();
		return 0;
		// TODO Auto-generated method stub
		
		
	}

	@Override
	public void blockUser(String psno) {
		// TODO Auto-generated method stub
		Query q = em.createQuery("update UserManagement u SET blocked_flag=true where u.login_psno=?1");
		q.setParameter(1, psno);
	q.executeUpdate();
	}

	@Override
	public void unblockUser(String psno) {
		// TODO Auto-generated method stub
		Query q = em.createQuery("update UserManagement u SET blocked_flag=false where u.login_psno=?1");
		q.setParameter(1, psno);
	q.executeUpdate();
	}

	@Override
	public com.lnt.lnd.entity.UserManagement searchuser(String psno) {
		// TODO Auto-generated method stub
		List<com.lnt.lnd.entity.UserManagement> i = new ArrayList<com.lnt.lnd.entity.UserManagement>();
	      com.lnt.lnd.entity.UserManagement u = new com.lnt.lnd.entity.UserManagement();
		
		Query q = em.createQuery("select u from UserManagement u where u.login_psno=?1");
		q.setParameter(1, psno);
		i=(List<com.lnt.lnd.entity.UserManagement>) q.getResultList();
		u=i.get(0);
	
		return u;

	}
	

	

}
