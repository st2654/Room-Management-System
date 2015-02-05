package com.lnt.lnd.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Room_Facilities implements Serializable 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int room_facility_id;
	private int room_id;
	private int facility_id;
	private String facility_desc;
	public int getRoom_id() {
		return facility_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getFacility_id() {
		return facility_id;
	}
	public void setFacility_id(int facility_id) {
		this.facility_id = facility_id;
	}
	public String getFacility_desc() {
		return facility_desc;
	}
	public void setFacility_desc(String facility_desc) {
		this.facility_desc = facility_desc;
	}
	
	
}
