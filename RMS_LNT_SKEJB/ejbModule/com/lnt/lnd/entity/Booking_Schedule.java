package com.lnt.lnd.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.eclipse.persistence.annotations.Direction;
import org.eclipse.persistence.annotations.NamedStoredProcedureQuery;
import org.eclipse.persistence.annotations.StoredProcedureParameter;

@NamedStoredProcedureQuery(
		name="addBooking_Schedule",
		procedureName="addBooking_Schedule",
		returnsResultSet=false,
		parameters={
				@StoredProcedureParameter(queryParameter="param1",name="booking_id",direction=Direction.IN,type=Integer.class),
				@StoredProcedureParameter(queryParameter="param2",name="start_date",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param3",name="end_date",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param4",name="start_time",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param5",name="end_time",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param6",name="booking_status",direction=Direction.IN,type=String.class)
				
		})

@Entity
public class Booking_Schedule implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int schedule_id;
	private int booking_id;
	private String booked_for_date;
	private String start_time;
	private String end_time;
	private String booking_status;
	
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
	public String getBooked_for_date() {
		return booked_for_date;
	}
	public void setBooked_for_date(String booked_for_date) {
		this.booked_for_date = booked_for_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}
	
	
}
