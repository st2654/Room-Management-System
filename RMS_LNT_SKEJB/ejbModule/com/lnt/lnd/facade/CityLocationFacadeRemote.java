package com.lnt.lnd.facade;
import java.util.List;

import javax.ejb.Remote;

import com.lnt.lnd.entity.CityLocation;

@Remote
public interface CityLocationFacadeRemote 
{
//public String setCityLocation(	String city,String location,String block,String address);
public int getCityLocation(	String city,String location);
public int setCityLocation(CityLocation cl);
public CityLocation getCityLocationDetails(int cid);
public List getcity();
public List getLocation(String city);
/*int getLocationCoordinatorID(int CityId);*/
}
