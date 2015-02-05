package com.lnt.lnd.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.SendMail;
import com.lnt.lnd.entity.Booking_Details;
import com.lnt.lnd.entity.Booking_Schedule;
import com.lnt.lnd.entity.Requester_Details;
import com.lnt.lnd.entity.View_Booking_Schedule;
import com.lnt.lnd.facade.BookingFacadeRemote;
import com.lnt.lnd.facade.CityLocationFacadeRemote;

public class BookingAction implements ServletRequestAware
{

	private int booking_id;
	private String booking_remarks;
	private String date;
	private String city;
	private String roomType;
	private String startTime;
	// private String startTimeBooking;
	private String endTime;
	// private String endTimeBooking;
	private String roomName;
	private String mb;
	private String checkBox1;
	private String location;
	private List lstAvailability;
	private int noOfParticipants;
	private String endDate;
	private String program_type;
	private String training_purpose;
	private List< View_Booking_Schedule >  bookSc;
	private HttpServletRequest request;

	/*
	 * public String getStartTimeBooking() { return startTimeBooking; }
	 * 
	 * public void setStartTimeBooking(String startTimeBooking) {
	 * this.startTimeBooking = startTimeBooking; }
	 * 
	 * public String getEndTimeBooking() { return endTimeBooking; }
	 * 
	 * public void setEndTimeBooking(String endTimeBooking) {
	 * this.endTimeBooking = endTimeBooking; }
	 */

	public String getTraining_purpose() {
		return "JAVA";
	}

	public void setTraining_purpose(String training_purpose) {
		this.training_purpose = "JAVA";
	}

	private String bu_type;
	private String email;
	private String mobile;
	private String name;
	private String ps_no;

	public String getPs_no() {
		return ps_no;
	}

	public void setPs_no(String ps_no) {
		this.ps_no = ps_no;
	}

	public String getBooking_remarks() {
		return booking_remarks;
	}

	public void setBooking_remarks(String booking_remarks) {
		this.booking_remarks = booking_remarks;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public String getProgram_type() {
		return program_type;
	}

	public void setProgram_type(String program_type) {
		this.program_type = program_type;
	}

	public String getEndDate() {
		return endDate;
	}

	public List<View_Booking_Schedule> getBookSc() {
		return bookSc;
	}

	public void setBookSc(List<View_Booking_Schedule> bookSc) {
		this.bookSc = bookSc;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setEndDate(String endDate) {
		/*
		 * Date date=new Date(0);
		 * date.setYear(Integer.parseInt(endDate.substring(1,4)));
		 * date.setMinutes(Integer.parseInt(endDate.substring(6,7)));
		 * date.setSeconds(Integer.parseInt(endDate.substring(9,10)));
		 * end_date=date;
		 */
		this.endDate = endDate;
	}

	public int getNoOfParticipants() {
		return noOfParticipants;
	}

	public void setNoOfParticipants(int noOfParticipants) {
		this.noOfParticipants = noOfParticipants;
	}

	public List getLstAvailability() {
		return lstAvailability;
	}

	public void setLstAvailability(List lstAvailability) {
		this.lstAvailability = lstAvailability;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {

		/*
		 * Date date_new=new Date(0);
		 * date_new.setYear(Integer.parseInt(endDate.substring(1,4)));
		 * date_new.setMinutes(Integer.parseInt(endDate.substring(6,7)));
		 * date_new.setSeconds(Integer.parseInt(endDate.substring(9,10)));
		 * this.start_time=date_new;
		 */
		this.date = date;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		if (startTime.length() >=18) {
			this.startTime = startTime.substring(11, 19);
			this.startTime += ".000";
		}
		else
			this.startTime=endTime;
		

	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		if (endTime.length()>=18) {
			this.endTime = endTime.substring(11, 19);
			this.endTime += ".000";
		}
		else
			this.endTime=endTime;
		
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getMb() {
		return mb;
	}

	public void setMb(String mb) {
		this.mb = mb;
	}

	public String getCheckBox1() {
		return checkBox1;
	}

	public void setCheckBox1(String checkBox1) {
		this.checkBox1 = checkBox1;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String bookRoom() {
		endDate = date;
		InitialContext ic;
		Requester_Details rd = new Requester_Details();
		Booking_Details bd = new Booking_Details();
		Booking_Schedule bs = new Booking_Schedule();
		int booking_id;
		System.out.println("book room called");
		try {
			ic = new InitialContext();
			BookingFacadeRemote remote = (BookingFacadeRemote) ic
					.lookup("booking#com.lnt.lnd.facade.BookingFacadeRemote");

			rd.setRequester_bu_id(bu_type);
			rd.setRequester_email(email.toUpperCase());
			rd.setRequester_mobile_no(mobile);
			rd.setRequester_name(name.toUpperCase());
			rd.setRequester_psno(ps_no);
			boolean requester_res = remote.addRequsterDetails(rd);

			System.out.println("Booking Details Started: " + date + " "
					+ noOfParticipants + " " + program_type + " " + ps_no + " "
					+ date);

			
			String fullBookingStatus = "TENTATIVE";
			int bookingUserId = 5;
			Long bookingDate_long = System.currentTimeMillis();
			Date bookingDate = new Date(bookingDate_long);

			boolean booking_details_res = remote.addBookingDetails(ps_no,
					program_type, "JAVA", roomName, date, endDate,
					noOfParticipants, fullBookingStatus, bookingUserId,
					bookingDate, booking_remarks);
			System.out.println("Booking Details ends");

			System.out.println("Booking Schedule Started");
			booking_id = remote.getBookingId(noOfParticipants,ps_no,date,endDate);

			/*
			 * bs.setBooking_id(booking_id); bs.setBooked_for_date(date);
			 * bs.setBooking_status("TENTATIVE"); bs.setEnd_time(endTime);
			 * bs.setStart_time(startTime);
			 */

			System.out.println(startTime + " " + endTime);

			boolean booking_schedule_res = remote.addBookingSchedule(
					booking_id, date, endDate, startTime, endTime, "TENTATIVE");
			System.out.println("Booking Details Ends");
			System.out.println("Booking done");
			request.setAttribute("Msg", "Booking Request Sent");
			return "SUCCESS";
		} catch (NamingException e) {
			e.printStackTrace();
			return "SUCCESS";
		}

	}

	public String getBu_type() {
		return bu_type;
	}

	public void setBu_type(String bu_type) {
		this.bu_type = bu_type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String checkAvailability() {
		try {

			endDate = date;
			lstAvailability = new ArrayList();
			InitialContext ic = new InitialContext();

			BookingFacadeRemote remote = (BookingFacadeRemote) ic
					.lookup("booking#com.lnt.lnd.facade.BookingFacadeRemote");
			lstAvailability = remote.checkAvailability(roomType, city,
					location, noOfParticipants, date, endDate, startTime,
					endTime);

			return "SUCCESS";

		} catch (Exception e) {
			// TODO: handle exception
			return "SUCCESS";
		}
	}
	
	public String getAllTentaiveBookings()
	{
		InitialContext ic;
		System.out.println("Enter into getAllBookings");
		try {
			ic = new InitialContext();
			BookingFacadeRemote remote=(BookingFacadeRemote)ic.lookup("booking#com.lnt.lnd.facade.BookingFacadeRemote");
			setBookSc(remote.getAllBookingrequest());
			request.setAttribute("booking_schedule", getBookSc());
		
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "SUCCESS";		
	}



	public String approveBooking()
	{
		InitialContext ic;
		System.out.println("Enter into approveBooking");
		String message="<hr>Dear "+getName()+",<br>Your Booking("+getBooking_id()+") for "+getDate()+" from "+getStartTime()+" to "+getEndTime()+" is <h3>Confirmed.</h3><hr>";
		System.out.println(message);
		try {
			ic = new InitialContext();
			BookingFacadeRemote remote=(BookingFacadeRemote)ic.lookup("booking#com.lnt.lnd.facade.BookingFacadeRemote");
			remote.approveBooking(getBooking_id());
			String to=getEmail();
			String subject="RMS:Booking Approved";
			request.setAttribute("Msg", "Booking Approved");
			SendMail sendmail=new SendMail();
			sendmail.postMail(to, subject, message);
			
			
		}catch(Exception e)
		{
			
		}
		return "SUCCESS";
	}
	
	public String cancelBooking()
	{
		InitialContext ic;
		System.out.println("Enter into cancelBooking");
		try {
			ic = new InitialContext();
			BookingFacadeRemote remote=(BookingFacadeRemote)ic.lookup("booking#com.lnt.lnd.facade.BookingFacadeRemote");
			remote.cancelBooking(getBooking_id());
			String to=getEmail();
			String subject="RMS:Booking Cancelled";
			String message="<hr>Dear "+getName()+",<br>Your Booking("+getBooking_id()+") for "+getDate()+" from "+getStartTime()+" to "+getEndTime()+" is <h3>Cancelled.</h3><hr>";
			request.setAttribute("Msg", "Booking Cancelled");
			SendMail sendmail=new SendMail();
			sendmail.postMail(to, subject, message);
						
		}catch(Exception e)
		{
			
		}
		return "SUCCESS";
	}
	
	public String proceed() 
	{
		return "SUCCESS";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) 
	{
		this.request=request;		
	}

}
