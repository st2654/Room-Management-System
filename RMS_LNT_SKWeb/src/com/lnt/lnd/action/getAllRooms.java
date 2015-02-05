package com.lnt.lnd.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.interceptor.InvocationContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.lnt.lnd.entity.Room_Master;
import com.lnt.lnd.facade.RoomManFacadeRemote;
import com.lnt.lnd.view.ViewRoomDetails;

public class getAllRooms implements ServletRequestAware
{
	private List<Room_Master> roomMaster;
	private List<ViewRoomDetails> viewRoomDetails;
	private HttpServletRequest request;
	
	public List<Room_Master> getRoomMaster() {
		return roomMaster;
	}

	public void setRoomMaster(List<Room_Master> roomMaster) {
		this.roomMaster = roomMaster;
	}

	public List<ViewRoomDetails> getViewRoomDetails() {
		return viewRoomDetails;
	}

	public void setViewRoomDetails(List<ViewRoomDetails> viewRoomDetails) {
		this.viewRoomDetails = viewRoomDetails;
	}

	public String execute() 
	{	InitialContext ic;
		System.out.println("Enter into getAllRooms");
		try {
			ic = new InitialContext();
			RoomManFacadeRemote remote=(RoomManFacadeRemote)ic.lookup("room#com.lnt.lnd.facade.RoomManFacadeRemote");
			setRoomMaster(remote.getAllRooms());
			int i=0;
			List<ViewRoomDetails> tempViewRoomDetails=new ArrayList<ViewRoomDetails>();
			if(getRoomMaster()!=null)
			{ 
			for(Room_Master room:getRoomMaster())
			{	
				ViewRoomDetails tempView=new ViewRoomDetails();
				//System.out.println("3.Got the rooms");
				tempView.setRoom_id(room.getRoom_id());
				//System.out.println("4");
				tempView.setLocationCoordinator(remote.getUsername(room.getLocation_coordinator_id()));
				tempView.setAddress("Gopalgarh");
				System.out.println("5");
				tempView.setBlock("1");
				//System.out.println("6");
				tempView.setCity("Mumbai");
				//System.out.println("7");
				tempView.setFacilities(remote.getRoomFacility(room.getRoom_id()));
				//System.out.println("8");
				tempView.setLocation("Mahape");
				//System.out.println("9");
				tempView.setNo_of_participants(room.getMax_no_of_persons());
				//System.out.println("10");
				tempView.setRemarks(room.getRemarks());
				//System.out.println("11");
				tempView.setRoom_name(room.getRoom_name());
				//System.out.println("12");
				tempView.setRoom_type(remote.getRoomTypeName(room.getRoom_type_id()));
				//System.out.println("13");
				tempView.setSeating_capacity(room.getSeating_capacity());
				//System.out.println("14");
				tempViewRoomDetails.add(tempView);
				
				i++;
				
			}
			setViewRoomDetails(tempViewRoomDetails);
			}
			request.setAttribute("ViewAllRooms", getViewRoomDetails());
			
		} catch (NamingException e) {
			
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
