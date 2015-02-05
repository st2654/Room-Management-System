package com.lnt.lnd.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.lnt.lnd.entity.Facility;

public class ViewRoomDetails 
{
	private int room_id;
	private String room_name;
	private String room_type;
	private String locationCoordinator;
	public String getLocationCoordinator() {
		return locationCoordinator;
	}
	public void setLocationCoordinator(String locationCoordinator) {
		this.locationCoordinator = locationCoordinator;
	}
	private String city;
	private String location;
	private String  block;
	private String  address;
	private int seating_capacity;
	private int  no_of_participants;
	private String remarks;
	private List<Facility> facilities;
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
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
	public String getBlock() {
		return block;
	}
	public void setBlock(String block) {
		this.block = block;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSeating_capacity() {
		return seating_capacity;
	}
	public void setSeating_capacity(int seating_capacity) {
		this.seating_capacity = seating_capacity;
	}
	public int getNo_of_participants() {
		return no_of_participants;
	}
	public void setNo_of_participants(int no_of_participants) {
		this.no_of_participants = no_of_participants;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public List<Facility> getFacilities() {
		return facilities;
	}
	public void setFacilities(List<Facility> facilities) {
		this.facilities = facilities;
	}
	
	
	
		
}
