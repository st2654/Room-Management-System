package com.lnt.lnd.view;

import com.lnt.lnd.entity.Requester_Details;

public class viewAllBookings 
{
	private int Booking_id;
	private Requester_Details reqDetail;
	private String BU;
	private String date;
	private String startTime;
	private String endTime;
	public int getBooking_id() {
		return Booking_id;
	}
	public void setBooking_id(int booking_id) {
		Booking_id = booking_id;
	}
	public Requester_Details getReqDetail() {
		return reqDetail;
	}
	public void setReqDetail(Requester_Details reqDetail) {
		this.reqDetail = reqDetail;
	}
	public String getBU() {
		return BU;
	}
	public void setBU(String bU) {
		BU = bU;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
}
