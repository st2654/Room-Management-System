package com.lnt.lnd.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="SuperAdministratorProgramReports")
public class RGSuperAdmin implements Serializable {
	
	@Id
	private int booking_id;
	private int requestor_psno;
	private String requester_name;
    
	private String city;
    private String location;
    private String room_name;
    private String training_purpose;
    private String start_date;
    private String end_date;
    private String booking_status;
    private String full_booking_status;
    private String bu_name;
    private int no_of_participants;
    private int Expr1;
    
    
    public String getrequester_name() {
		return requester_name;
	}
	public void setrequester_name(String requester_name) {
		this.requester_name = requester_name;
	}
    public int getExpr1() {
		return Expr1;
	}
	public void setExpr1(String expr1) {
		Expr1 = requestor_psno;
	}
	public String getBu_name() {
		return bu_name;
	}
	public void setBu_name(String bu_name) {
		this.bu_name = bu_name;
	}
	public int getNo_of_participants() {
		return no_of_participants;
	}
	public void setNo_of_participants(int no_of_participants) {
		this.no_of_participants = no_of_participants;
	}
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
		
	public int getrequestor_psno() {
		return requestor_psno;
	}
	public void setrequestor_psno(int requester_psno) {
		this.requestor_psno = requester_psno;
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
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	
	public String getTraining_purpose() {
		return training_purpose;
	}
	public void setTraining_purpose(String training_purpose) {
		this.training_purpose = training_purpose;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}
	public String getFull_booking_status() {
		return full_booking_status;
	}
	public void setFull_booking_status(String full_booking_status) {
		this.full_booking_status = full_booking_status;
	}
      

}



