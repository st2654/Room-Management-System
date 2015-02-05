package com.lnt.lnd.facade;

import java.sql.Date;
import java.util.List;

import javax.ejb.Remote;

import com.lnt.lnd.entity.Booking_Details;
import com.lnt.lnd.entity.Booking_Schedule;
import com.lnt.lnd.entity.Requester_Details;
import com.lnt.lnd.entity.View_Booking_Schedule;

@Remote
public interface BookingFacadeRemote {
	List checkAvailability(String roomType, String city, String location,
			int noOfParticipants, String startDate, String endDate,
			String startTime, String endTime);

	boolean cancelBooking(int booking_id);

	Booking_Details book(int requester_ps_no);

	boolean addRequsterDetails(Requester_Details rd);

	boolean addBookingSchedule(int booking_id,String startDate,String endDate,String startTime,String endTime,String booking_status);

	boolean addBookingDetails(String ps_no,String program_type,String training_purpose,
							String roomName,String startDate,String endDate,int noOfParticipants,
							String fullBookingStatus,int bookingUserId,Date bookingDate,
							String bookingRemarks);

	Requester_Details getRequesterDetails(String requester_psno);

	Booking_Details getBookingDetails(int bookingId);

	int getBookingId(int noOfParticipants,String requester_psno,String startDate,String endDate);

	List<Booking_Schedule> getBookingScheduleDetails();
			
	int getScheduleId();
	
	List <View_Booking_Schedule> getAllBookingrequest();
	
	boolean approveBooking(int booking_id);

}
