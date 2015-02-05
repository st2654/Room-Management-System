package com.lnt.lnd.action;

import java.rmi.Remote;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.identity.IntIdentity;
import javax.naming.InitialContext;


import com.lnt.lnd.facade.CityLocationFacadeRemote;
import com.lnt.lnd.facade.UserManagementRemote;
import com.opensymphony.xwork2.ActionSupport;

public class DetailAction extends ActionSupport {
	private String city;
	private List lstList = null;
	private List lstList1 = null;
	private List lstList2 = null;
	
	public String execute() throws Exception {

		if (getCity() != null && !getCity().equals("")) {
			populateDetail(getCity());
			return "SUCCESS";
		} else {
			return "SUCCESS";
		}
	}

	private void populateDetail(String id) {
		lstList2 = new ArrayList();
		lstList = new ArrayList();
		lstList1 = new ArrayList();

		try {
			InitialContext ic = new InitialContext();
			
			CityLocationFacadeRemote remote=(CityLocationFacadeRemote)ic.lookup("citylocation#com.lnt.lnd.facade.CityLocationFacadeRemote");
			lstList2=remote.getcity();
			for(Object o11 :lstList2)
			{
				System.out.println("city :"+(String)o11);
			}
			for (Object o : lstList2) {
				if (id.equalsIgnoreCase((String) o)) {
					
						lstList=remote.getLocation((String) o);
						for(Object o1 :lstList)
						{
							System.out.println("city :"+(String)o +"Location" +(String)o1);
						}
						// lstList1.add(s2);
					
				}
				
				
			}
			}
		catch (Exception e) {
			// TODO: handle exception
		}
			
		
	}


	public List getLstList() {
		return lstList;
	}

	public void setLstList(List lstList) {
		this.lstList = lstList;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
}