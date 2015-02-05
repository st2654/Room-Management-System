package com.lnt.lnd.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class View_Booking_Schedule implements Serializable
{	
	private int schedule_id;
	@Id
	private int booking_id;
	private String requester_psno;
	private String requester_name;
	private String requester_bu_id;
	private Date booked_for_date;
	private Date start_time;
	private Date end_time;
	private String requester_email;
	
	public String getRequester_email() {
		return requester_email;
	}
	public void setRequester_email(String requester_email) {
		this.requester_email = requester_email;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String getRequester_psno() {
		return requester_psno;
	}
	public void setRequester_psno(String requester_psno) {
		this.requester_psno = requester_psno;
	}
	public String getRequester_name() {
		return requester_name;
	}
	public void setRequester_name(String requester_name) {
		this.requester_name = requester_name;
	}
	public String getRequester_bu_id() {
		return requester_bu_id;
	}
	public void setRequester_bu_id(String requester_bu_id) {
		this.requester_bu_id = requester_bu_id;
	}
	public Date getBooked_for_date() {
		return booked_for_date;
	}
	public void setBooked_for_date(Date booked_for_date) {
		this.booked_for_date = booked_for_date;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	
	
}
