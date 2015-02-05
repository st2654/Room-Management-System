package com.lnt.lnd.entity;
import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


import org.eclipse.persistence.*;
import org.eclipse.persistence.annotations.*;


@NamedStoredProcedureQueries({
@NamedStoredProcedureQuery(
name="checkAvailability",  
	    procedureName="checkAvailability",  
	    returnsResultSet=true,  
	    parameters={  
	        @StoredProcedureParameter(queryParameter="param1",name="room_type_name",direction=Direction.IN,type=String.class),  
	        @StoredProcedureParameter(queryParameter="param2",name="city",direction=Direction.IN,type=String.class),  
	        @StoredProcedureParameter(queryParameter="param3",name="location",direction=Direction.IN,type=String.class),  
	        @StoredProcedureParameter(queryParameter="param4",name="no_of_participants",direction=Direction.IN,type=Integer.class),
	        @StoredProcedureParameter(queryParameter="param5",name="start_date",direction=Direction.IN,type=String.class),
	        @StoredProcedureParameter(queryParameter="param6",name="end_date",direction=Direction.IN,type=String.class),
	        @StoredProcedureParameter(queryParameter="param7",name="start_time",direction=Direction.IN,type=String.class),
	        @StoredProcedureParameter(queryParameter="param8",name="end_time",direction=Direction.IN,type=String.class)
		}),
@NamedStoredProcedureQuery(
		name="addBooking_Details",
		procedureName="addBooking_Details",
		returnsResultSet=false,
		parameters={
				@StoredProcedureParameter(queryParameter="param1",name="requester_psno",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param2",name="program_type_name",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param3",name="training_purpose",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param4",name="room_name",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param5",name="start_date",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param6",name="end_date",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param7",name="no_of_participants",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param8",name="full_booking_status",direction=Direction.IN,type=String.class),
				@StoredProcedureParameter(queryParameter="param9",name="booking_user_id",direction=Direction.IN,type=Integer.class),
				@StoredProcedureParameter(queryParameter="param10",name="booking_date",direction=Direction.IN,type=Date.class),
				@StoredProcedureParameter(queryParameter="param11",name="booking_remarks",direction=Direction.IN,type=String.class)
				
		})

		
})


	        @Entity
public class Booking_Details implements Serializable 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int booking_id;
	private String requester_psno;
	private String program_type_id;
	private String training_purpose;
	private String start_date;
	private String end_date;
	private int no_of_participants;
	private String full_booking_status;
	private int booking_user_id;
	private String booking_date;
	private String booking_remarks;
	
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
	public String getProgram_type_id() {
		return program_type_id;
	}
	public void setProgram_type_id(String program_type_id) {
		this.program_type_id = program_type_id;
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
	public int getNo_of_participants() {
		return no_of_participants;
	}
	public void setNo_of_participants(int no_of_participants) {
		this.no_of_participants = no_of_participants;
	}
	public String getFull_booking_status() {
		return full_booking_status;
	}
	public void setFull_booking_status(String full_booking_status) {
		this.full_booking_status = full_booking_status;
	}
	public int getBooking_user_id() {
		return booking_user_id;
	}
	public void setBooking_user_id(int booking_user_id) {
		this.booking_user_id = booking_user_id;
	}
	public String getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}
	public String getBooking_remarks() {
		return booking_remarks;
	}
	public void setBooking_remarks(String booking_remarks) {
		this.booking_remarks = booking_remarks;
	}
	
	
	

}
