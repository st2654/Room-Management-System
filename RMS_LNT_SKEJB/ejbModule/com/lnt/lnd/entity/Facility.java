package com.lnt.lnd.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



@Entity
public class Facility implements Serializable
{	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int facility_id ;
	private String facility_name ;
	private String facility_type ;
	
	public int getFacility_id() {
		return facility_id;
	}
	public void setFacility_id(int facility_id) {
		this.facility_id = facility_id;
	}
	public String getFacility_name() {
		return facility_name;
	}
	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}
	public String getFacility_type() {
		return facility_type;
	}
	public void setFacility_type(String facility_type) {
		this.facility_type = facility_type;
	}
	
	public String toString()
	{
		return getFacility_name()+"("+getFacility_type() +")";
	}
	
}
