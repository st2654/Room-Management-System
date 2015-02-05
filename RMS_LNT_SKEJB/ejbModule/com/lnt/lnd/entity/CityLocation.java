package com.lnt.lnd.entity;

import java.io.Serializable;


import javax.persistence.*;

@Entity
@Table(name="City_Location_Details")
public class CityLocation implements Serializable 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int city_location_id;
	private String city;
	private String location;
	private String block;
	private String address;
public String getCity() {
	return city;
}
public int getCity_location_id() {
	return city_location_id;
}
public void setCity_location_id(int city_location_id) {
	this.city_location_id = city_location_id;
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

}
