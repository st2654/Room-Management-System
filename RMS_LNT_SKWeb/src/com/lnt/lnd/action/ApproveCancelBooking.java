package com.lnt.lnd.action;

import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.lnt.lnd.entity.Booking_Details;
import com.lnt.lnd.entity.Booking_Schedule;
import com.lnt.lnd.entity.Requester_Details;
import com.lnt.lnd.entity.View_Booking_Schedule;
import com.lnt.lnd.facade.BookingFacadeRemote;


public class ApproveCancelBooking implements ServletRequestAware 
{
	private List< View_Booking_Schedule >  bookSc;
	private HttpServletRequest request;
	

	
	public List<View_Booking_Schedule> getBookSc() {
		return bookSc;
	}

	public void setBookSc(List<View_Booking_Schedule> bookSc) {
		this.bookSc = bookSc;
	}

	public String execute()
	{
		InitialContext ic;
		System.out.println("Enter into getAllBookings");
		try {
			ic = new InitialContext();
			BookingFacadeRemote remote=(BookingFacadeRemote)ic.lookup("booking#import com.lnt.lnd.facade.BookingFacadeRemote");
			setBookSc(remote.getAllBookingrequest());
			request.setAttribute("booking_schedule", getBookSc());
		
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "SUCCESS";		
	}

	@Override
	public void setServletRequest(HttpServletRequest request) 
	{
		this.request=request;
		
	}
}
