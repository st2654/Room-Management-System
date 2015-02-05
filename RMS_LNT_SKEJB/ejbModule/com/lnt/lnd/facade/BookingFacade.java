package com.lnt.lnd.facade;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.Parameter;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.lnt.lnd.entity.Booking_Details;
import com.lnt.lnd.entity.Booking_Schedule;
import com.lnt.lnd.entity.Requester_Details;
import com.lnt.lnd.entity.View_Booking_Schedule;

@Stateless(mappedName = "booking")
public class BookingFacade implements BookingFacadeRemote {
	private List lstAvailability = null;
	@PersistenceContext
	EntityManager em;

	public BookingFacade() {

	}

	@Override
	public List checkAvailability(String roomType, String city,
			String location, int noOfParticipants, String startDate,
			String endDate, String startTime, String endTime) {

		Query q = em.createNamedQuery("checkAvailability");
		q.setParameter("param1", roomType);
		q.setParameter("param2", city);
		q.setParameter("param3", location);
		q.setParameter("param4", noOfParticipants);
		q.setParameter("param5", startDate);
		q.setParameter("param6", endDate);
		q.setParameter("param7", startTime);
		q.setParameter("param8", endTime);

		lstAvailability = q.getResultList();

		return lstAvailability;
	}

	@Override
	public Booking_Details book(int requester_ps_no) {

		return null;
	}

	
	@Override
	public boolean addRequsterDetails(Requester_Details rd) {
		em.persist(rd);
		return true;
	}

	public Requester_Details getRequesterDetails(String requester_psno) {
		Requester_Details rd = new Requester_Details();
		List<Requester_Details> i = new ArrayList<Requester_Details>();

		Query q = em.createQuery("select r from Requester_Details r where r.requester_psno=?1");
		q.setParameter(1, requester_psno);
		i = (List<Requester_Details>) q.getResultList();
		rd = i.get(0);

		return rd;
	}

	@Override
	public boolean addBookingDetails(String ps_no, String program_type,
			String training_purpose, String roomName, String startDate,
			String endDate, int noOfParticipants, String fullBookingStatus,
			int bookingUserId, Date bookingDate, String bookingRemarks) {
		/* em.persist(bd); */

		Query q = em.createNamedQuery("addBooking_Details");
		q.setParameter("param1", ps_no);
		q.setParameter("param2", program_type);
		q.setParameter("param3", training_purpose);
		q.setParameter("param4", roomName);
		q.setParameter("param5", startDate);
		q.setParameter("param6", endDate);
		q.setParameter("param7", noOfParticipants);
		q.setParameter("param8", fullBookingStatus);
		q.setParameter("param9", bookingUserId);
		q.setParameter("param10", bookingDate);
		q.setParameter("param11", bookingRemarks);

		q.executeUpdate();

		return true;
	}

	public Booking_Details getBookingDetails(int bookingId) {
		Booking_Details bd = new Booking_Details();
		List<Booking_Details> i = new ArrayList<Booking_Details>();

		Query q = em
				.createQuery("select bd from Booking_Details bd where bd.booking_id=?1");
		q.setParameter(1, bookingId);
		i = (List<Booking_Details>) q.getResultList();
		bd = i.get(0);
		return bd;
	}

	public int getBookingId(int noOfParticipants,String requester_psno,String startDate,String endDate) {
		Booking_Details bd = new Booking_Details();
		List<Booking_Details> i = new ArrayList<Booking_Details>();

		Query q = em.createQuery("select bd from Booking_Details bd where bd.no_of_participants=?1 " +
				"and bd.requester_psno=?2 and bd.start_date=?3 and bd.end_date=?4");
		q.setParameter(1,noOfParticipants);
		q.setParameter(2,requester_psno);
		q.setParameter(3,startDate);
		q.setParameter(4,endDate);
		
		i = (List<Booking_Details>) q.getResultList();
		bd= i.get(0);
		return(bd.getBooking_id());
	}

	@Override
	public boolean addBookingSchedule(int booking_id, String startDate,
			String endDate, String startTime, String endTime,
			String booking_status) {
		
		System.out.println("Booking Schedule Called");
		Query q = em.createNamedQuery("addBooking_Schedule");
		System.out.println("addBookingSchedule found");
		q.setParameter("param1", booking_id);
		q.setParameter("param2", startDate);
		q.setParameter("param3", endDate);
		q.setParameter("param4", startTime);
		q.setParameter("param5", endTime);
		q.setParameter("param6", booking_status);
		

		q.executeUpdate();

		// em.persist(bs);
		return true;
	}

	public List<Booking_Schedule> getBookingScheduleDetails() 
	{
		Booking_Schedule bs = new Booking_Schedule();
		List<Booking_Schedule> i = new ArrayList<Booking_Schedule>();

		Query q = em
				.createQuery("select bs from Booking_Details bs where bs.booking_status=?1");
		q.setParameter(1, "TENTATIVE");
		i = q.getResultList();
		//bs = i.get(0);
		return i;
	}

	public int getScheduleId() {
		List<Booking_Schedule> i = new ArrayList<Booking_Schedule>();

		Query q = em.createQuery("select bs from Booking_Details bs");
		i = (List<Booking_Schedule>) q.getResultList();

		return (i.size());
	}

	@Override
	public List<View_Booking_Schedule> getAllBookingrequest() 
	{
		List<View_Booking_Schedule> i = new ArrayList<View_Booking_Schedule>();

		Query q = em.createQuery("select bs from View_Booking_Schedule bs");
		i =  q.getResultList();
	
		return i;
	}

	@Override
	public boolean approveBooking(int booking_id) 
	{
		Booking_Details bookDetails=new Booking_Details();
		bookDetails=em.find(Booking_Details.class, booking_id);
		bookDetails.setFull_booking_status("CONFIRMED");
		em.merge(bookDetails);
		Query q = em.createQuery("select bs from Booking_Schedule bs where bs.booking_id="+bookDetails.getBooking_id());
		Booking_Schedule BookSc1=(Booking_Schedule)q.getSingleResult();
		Booking_Schedule BookSc2=em.find(Booking_Schedule.class,BookSc1.getSchedule_id());
		BookSc2.setBooking_status("CONFIRMED");
		em.merge(BookSc2);
		return true;
	}
	
	@Override
	public boolean cancelBooking(int booking_id) 
	{
		Booking_Details bookDetails=new Booking_Details();
		bookDetails=em.find(Booking_Details.class, booking_id);
		bookDetails.setFull_booking_status("CANCELLED");
		em.merge(bookDetails);
		Query q = em.createQuery("select bs from Booking_Schedule bs where bs.booking_id="+bookDetails.getBooking_id());
		Booking_Schedule BookSc1=(Booking_Schedule)q.getSingleResult();
		Booking_Schedule BookSc2=em.find(Booking_Schedule.class,BookSc1.getSchedule_id());
		BookSc2.setBooking_status("CANCELLED");
		em.merge(BookSc2);
		return true;
	}

	

}
