package com.lnt.lnd.action;

import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;

import com.lnt.lnd.facade.CityLocationFacadeRemote;

public class ListingAction {

	private List lstList1;
	private String city;
	private String location;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List getLstList1() {
		return lstList1;
	}

	public void setLstList1(List lstList1) {
		this.lstList1 = lstList1;
	}

	public String execute() {
		{
			try {
				lstList1 = new ArrayList<String>();
				InitialContext ic = new InitialContext();

				CityLocationFacadeRemote remote = (CityLocationFacadeRemote) ic
						.lookup("citylocation#com.lnt.lnd.facade.CityLocationFacadeRemote");
				lstList1 = (List) remote.getcity();
				lstList1.add("Other");
				System.out.println("this is called");
				return "SUCCESS";
			} catch (Exception e) {
				return "SUCCESS";// TODO: handle exception
			}

		}
	}

}
