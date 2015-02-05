package com.lnt.lnd.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.TableGenerator;

@Entity
public class Room_Master implements Serializable 
{	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int room_id;
	private String room_name;
	private int room_type_id;
	private int city_location_id;
	private int location_coordinator_id;
	private int creator_id;
	private Date creation_time_stamp;
	private int update_id;
	private Date update_time_stamp;
	private boolean del_flag;
	private String remarks;
	private int seating_capacity;
	private int max_no_of_persons;
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
	public int getRoom_type_id() {
		return room_type_id;
	}
	public void setRoom_type_id(int room_type_id) {
		this.room_type_id = room_type_id;
	}
	public int getCity_location_id() {
		return city_location_id;
	}
	public void setCity_location_id(int city_location_id) {
		this.city_location_id = city_location_id;
	}
	public int getLocation_coordinator_id() {
		return location_coordinator_id;
	}
	public void setLocation_coordinator_id(int location_coordinator_id) {
		this.location_coordinator_id = location_coordinator_id;
	}
	public int getCreator_id() {
		return creator_id;
	}
	public void setCreator_id(int creator_id) {
		this.creator_id = creator_id;
	}
	public Date getCreation_time_stamp() {
		return creation_time_stamp;
	}
	public void setCreation_time_stamp(Date creation_time_stamp) {
		this.creation_time_stamp = creation_time_stamp;
	}
	public int getUpdate_id() {
		return update_id;
	}
	public void setUpdate_id(int update_id) {
		this.update_id = update_id;
	}
	public Date getUpdate_time_stamp() {
		return update_time_stamp;
	}
	public void setUpdate_time_stamp(Date update_time_stamp) {
		this.update_time_stamp = update_time_stamp;
	}
	public boolean isDel_flag() {
		return del_flag;
	}
	public void setDel_flag(boolean del_flag) {
		this.del_flag = del_flag;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getSeating_capacity() {
		return seating_capacity;
	}
	public void setSeating_capacity(int seating_capacity) {
		this.seating_capacity = seating_capacity;
	}
	public int getMax_no_of_persons() {
		return max_no_of_persons;
	}
	public void setMax_no_of_persons(int max_no_of_persons) {
		this.max_no_of_persons = max_no_of_persons;
	}

}
