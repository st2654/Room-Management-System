package com.lnt.lnd.facade;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.lnt.lnd.entity.CityLocation;
import com.lnt.lnd.entity.RGSuperAdmin;

/**
 * Session Bean implementation class BookedHistory
 */

@Stateless(mappedName="bookedHistory")
public class BookedHistory implements BookedHistoryRemote {
	@PersistenceContext
	EntityManager em;
    /**
     * Default constructor. 
     */
    public BookedHistory() {
        // TODO Auto-generated constructor stub
    }
  	
    	public List<RGSuperAdmin> createBUType(String buName,String startTime,String endTime)
    	{
    	// user jpql 	
    		
    		Query q = em.createQuery("select c from RGSuperAdmin c where c.bu_name=?1 ");
    		q.setParameter(1, buName);
    		
    		List<RGSuperAdmin> i = new ArrayList<RGSuperAdmin>();
    	      
    		i=(List<RGSuperAdmin>) q.getResultList();
    		
    		return i;
    	}
    	public List<RGSuperAdmin> bookedProgramHistory(String programType)
    	{
    	// user jpql 	
    		
    		Query q = em.createQuery("select c from RGSuperAdmin c where c.training_purpose=?1 ");
    		q.setParameter(1, programType);
    		
    		List<RGSuperAdmin> i = new ArrayList<RGSuperAdmin>();
    	      
    		i=(List<RGSuperAdmin>) q.getResultList();
    		
    		return i;
    	}

    }



