package com.lnt.lnd.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Room_Type implements Serializable
{	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int room_type_id;
	private String room_type_name;
	
	public int getRoom_type_id() {
		return room_type_id;
	}
	public void setRoom_type_id(int room_type_id) {
		this.room_type_id = room_type_id;
	}
	public String getRoom_type_name() {
		return room_type_name;
	}
	public void setRoom_type_name(String room_type_name) {
		this.room_type_name = room_type_name;
	}
	
	public String toString()
	{
		return getRoom_type_name();
	}
	
}
