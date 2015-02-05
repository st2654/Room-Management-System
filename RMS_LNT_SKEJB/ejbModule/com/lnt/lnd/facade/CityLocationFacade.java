package com.lnt.lnd.facade;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.*;
import com.lnt.lnd.entity.CityLocation;

/**
 * Session Bean implementation class CityLocationFacade
 */
@Stateless(mappedName="citylocation")
public class CityLocationFacade implements CityLocationFacadeRemote {
@PersistenceContext
EntityManager em;
    /**
     * Default constructor. 
     */
    public CityLocationFacade() {
        // TODO Auto-generated constructor stub
    	
    }

	@Override
	public int setCityLocation(CityLocation cl)
	{
		
		em.persist(cl);
		int i=this.getCityLocation(cl.getCity(), cl.getLocation());
		return i;
		
	}
  


@Override
public int getCityLocation(String city, String location)
{
	try
	{
	int cid=0;
	Query q = em.createQuery("select c.city_location_id from CityLocation c where c.city=?1 and c.location=?2 ");
	q.setParameter(1, city);
	q.setParameter(2, location);
	List<Integer> i = new ArrayList<Integer>();
      
	i=(List<Integer>) q.getResultList();
	for (Integer cityLocation : i) {

			cid=cityLocation;
	}
	return cid;
	}
	catch (Exception e) {return 0;
		// TODO: handle exception	
	}

	// TODO Auto-generated method stub
	
}
public CityLocation getCityLocationDetails(int cid)
{
	
		CityLocation cl = new CityLocation();
	Query q = em.createQuery("select c from CityLocation c where c.city_location_id=?1 ");
	q.setParameter(1, cid);
	
	List<CityLocation> i = new ArrayList<CityLocation>();
      
	i=(List<CityLocation>) q.getResultList();
	cl=i.get(0);
	return cl;
	}

@Override
public List getcity() {
	// TODO Auto-generated method stub
	
	Query q = em.createQuery("select c.city from CityLocation c");
	List<String> i = new ArrayList<String>();     
	i=(List<String>) q.getResultList();
	return i;
}

@Override
public List getLocation(String city) {
	// TODO Auto-generated method stub

	
Query q = em.createQuery("select c.location from CityLocation c where c.city=?1 ");
q.setParameter(1, city);

List<String> i = new ArrayList<String>();
  
i=(List<String>) q.getResultList();
return i;
}
	
	// TODO Auto-generated method stub
	


}
