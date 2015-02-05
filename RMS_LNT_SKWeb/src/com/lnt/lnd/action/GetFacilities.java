package com.lnt.lnd.action;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.struts2.interceptor.RequestAware;

import com.lnt.lnd.entity.Authentication;
import com.lnt.lnd.entity.Facility;
import com.lnt.lnd.entity.Room_Type;
import com.lnt.lnd.facade.RoomManFacadeRemote;

public class GetFacilities implements RequestAware
{
	private List<Facility> facilities;
	private List<Room_Type> roomType;
	private List<Authentication> locCoordList;
	private Map request;
		
	public List<Authentication> getLocCoordList() {
		return locCoordList;
	}

	public void setLocCoordList(List<Authentication> locCoordList) {
		this.locCoordList = locCoordList;
	}

	public Collection<Room_Type> getRoomType() {
		return roomType;
	}

	public void setRoomType(List<Room_Type> roomType) {
		this.roomType = roomType;
	}

	public List<Facility> getFacilities() 
	{
		return facilities;
	}

	public void setFacilities(List<Facility> facilities) {
		this.facilities = facilities;
	}
	
	public String execute()
	{
		InitialContext ic;
		try {System.out.println("Enter into getFacilities");
			ic = new InitialContext();
			RoomManFacadeRemote remote=(RoomManFacadeRemote)ic.lookup("room#com.lnt.lnd.facade.RoomManFacadeRemote");
			setFacilities(remote.getAllFacilities());
			setRoomType(remote.getAllRoom_Type());
			setLocCoordList(remote.getLocCoordList());
			ic.close();
			Room_Type otherRoom=new Room_Type();
			otherRoom.setRoom_type_id(-1);
			otherRoom.setRoom_type_name("Other");
			roomType.add(otherRoom);
			setRoomType(roomType);
			request.put("facList",getFacilities() );
			request.put("userList",getLocCoordList() );
			System.out.println(getFacilities());
		} catch (NamingException e) {
			
			e.printStackTrace();
		}
		return "SUCCESS";
	}

	@Override
	public void setRequest(Map request) 
	{
		this.request=request;
		
	}
	
}
