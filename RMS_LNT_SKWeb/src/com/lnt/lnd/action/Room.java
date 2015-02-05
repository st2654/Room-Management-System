package com.lnt.lnd.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lnt.lnd.entity.Authentication;
import com.lnt.lnd.entity.CityLocation;
import com.lnt.lnd.entity.Facility;
import com.lnt.lnd.entity.Room_Master;
import com.lnt.lnd.entity.Room_Type;
import com.lnt.lnd.facade.CityLocationFacadeRemote;
import com.lnt.lnd.facade.RoomManFacadeRemote;
import com.lnt.lnd.view.ViewRoomDetails;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class Room extends ActionSupport  implements RequestAware,ServletRequestAware,SessionAware
{	private int room_id;
	private String room_name;
	private String room_type;
	private String other_room_type;
	private String city;
	private String other_city;
	private String location;
	private int cityLocationId;
	private String other_location;
	private String  block;
	private String  other_block;
	private String  address;
	private String  other_address;
	private int locationCoordinatorId;
	private String locationCoordinatorName;
	private int seating_capacity;
	private int  no_of_participants;
	private String remarks;
	private List<Facility> facilities;
	private List<Room_Type> roomType;
	private HttpServletRequest request;
	private Map requestMsg;
	private Map session; 
	
	public List<Facility> getFacilities() 
	{
		return facilities;
	}

	public String getOther_city() {
		return other_city;
	}

	public int getCityLocationId() {
		return cityLocationId;
	}

	public void setCityLocationId(int cityLocationId) {
		this.cityLocationId = cityLocationId;
	}

	public void setOther_city(String other_city) {
		this.other_city = other_city;
	}

	public String getOther_location() {
		return other_location;
	}

	public void setOther_location(String other_location) {
		this.other_location = other_location;
	}

	public String getOther_block() {
		return other_block;
	}

	public void setOther_block(String other_block) {
		this.other_block = other_block;
	}

	public String getOther_address() {
		return other_address;
	}

	public void setOther_address(String other_address) {
		this.other_address = other_address;
	}

	public void setFacilities(List<Facility> facilities) {
		this.facilities = facilities;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	

	public String getRoom_type() {
		return room_type;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public int getSeating_capacity() {
		return seating_capacity;
	}

	public void setSeating_capacity(int seating_capacity) {
		this.seating_capacity = seating_capacity;
	}

	public void setNo_of_participants(int no_of_participants) {
		this.no_of_participants = no_of_participants;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getOther_room_type() {
		return other_room_type;
	}

	public void setOther_room_type(String other_room_type) {
		this.other_room_type = other_room_type;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getBlock() {
		return block;
	}

	public void setBlock(String block) {
		this.block = block;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getNo_of_participants() {
		return no_of_participants;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String createRoom()
	{	
			
		InitialContext ic;
		try {System.out.println("Enter into getCreateRoom");
			ic = new InitialContext();
			RoomManFacadeRemote remote=(RoomManFacadeRemote)ic.lookup("room#com.lnt.lnd.facade.RoomManFacadeRemote");
			CityLocationFacadeRemote cityRemote=(CityLocationFacadeRemote)ic.lookup("citylocation#com.lnt.lnd.facade.CityLocationFacadeRemote");
			Room_Master room=new Room_Master();
			CityLocation cityLocation=new CityLocation();
			/*SET VALUES IN ROOM OBJECT*/
			/*SET VALUES IN City Location OBJECT*/
			cityLocation.setCity(getCity());
			cityLocation.setAddress(getAddress());
			cityLocation.setBlock(getBlock());
			cityLocation.setLocation(getLocation());
			/*if(getOther_address()!=null || getOther_block()!=null || getOther_city()!=null || getOther_location()!=null)
			{
				CityLocation otherCityLocation=new CityLocation();
				otherCityLocation.setAddress(address);
				otherCityLocation.setCity(getCity());
				otherCityLocation.setBlock(getBlock());
				otherCityLocation.setLocation(getLocation());
				setCityLocationId(cityRemote.setCityLocation(otherCityLocation));
				room.setCity_location_id(getCityLocationId());
			}
			else
			{
				room.setCity_location_id(cityRemote.getCityLocation(city, location));	
			}*/
			room.setCity_location_id(25);
			room.setDel_flag(false);
			room.setRoom_name(getRoom_name());
			if(room_type.equalsIgnoreCase("Other"))
			{
			Room_Type roomType=new Room_Type();
			roomType.setRoom_type_name(getOther_room_type());
			room.setRoom_type_id(remote.saveRoomType(roomType));	
			}
			else
			{
			room.setRoom_type_id(remote.getRoomTypeId(room_type));
			}
			long time = System.currentTimeMillis();
			Date date=new Date(time) ;
			room.setCreation_time_stamp(date);
			room.setCreator_id((Integer)session.get("user_no"));
			room.setUpdate_id(66);
			room.setLocation_coordinator_id(getLocationCoordinatorId());
			room.setMax_no_of_persons(getNo_of_participants());
			room.setSeating_capacity(getSeating_capacity());
			room.setRemarks(getRemarks());
			setFacilities(remote.getAllFacilities());
			List<Facility> facList=new ArrayList<Facility>();
			
			for(int i=0;i<facilities.size();i++)
			{	Facility fac=new Facility();
				fac=facilities.get(i);
				String facCount=(String)request.getParameter("fac"+fac.getFacility_id());
				if(!(facCount.trim().equals("0") ||  facCount.trim().equals("")))
				{
					fac.setFacility_type(facCount);
					facList.add(fac);
				}
			}
			room_id=remote.createRoom(room);
			System.out.println("RoomId"+room_id);
			
			System.out.println(facilities);
			System.out.println(remote.setRoomFacilities(room_id, facList));
			requestMsg.put("Msg","Room Created Successfully!!");
			/*Close Connection*/
			ic.close();
			return "SUCCESS";
		} catch (NamingException e) {
			
			e.printStackTrace();
			return "ERROR";
		}
	}

	/*EDIT ROOM  */
	
	public String editRoom()
	{	InitialContext ic;
		try {
		ic = new InitialContext();
		RoomManFacadeRemote remote=(RoomManFacadeRemote)ic.lookup("room#com.lnt.lnd.facade.RoomManFacadeRemote");
		System.out.println("-----Into Edit Room-------");
		System.out.println("-->> "+getRoom_id());
		Room_Master room=new Room_Master();
		room=remote.searchRoom(getRoom_id());
		setFacilities(remote.getRoomFacility(room.getRoom_id()));
		setAddress(address);
		setBlock(block);
		setCity(city);
		setLocation(location);
		
		setNo_of_participants(room.getMax_no_of_persons());
		setRemarks(room.getRemarks());
		setRoom_name(room.getRoom_name());
		setRoom_type(remote.getRoomTypeName(room.getRoom_type_id()));
		setSeating_capacity(room.getSeating_capacity());
		setRoomType(remote.getAllRoom_Type());
		Room_Type RT=new Room_Type();
		RT.setRoom_type_id(-1);
		RT.setRoom_type_name("Other");
		getRoomType().add(RT);
		System.out.println("----m here-----");
		setLocationCoordinatorId(room.getLocation_coordinator_id());
		setLocationCoordinatorName(remote.getUsername(getLocationCoordinatorId()));
		request.setAttribute("LOC_id",getLocationCoordinatorId());
		request.setAttribute("facList", remote.getAllFacilities());
		request.setAttribute("currentFacList", getFacilities());
		request.setAttribute("userList",remote.getLocCoordList() );
		}
		catch(NamingException e)
		{
			e.printStackTrace();
		}
		return "SUCCESS";
	}
	
	public int getLocationCoordinatorId() {
		return locationCoordinatorId;
	}

	public void setLocationCoordinatorId(int locationCoordinatorId) {
		this.locationCoordinatorId = locationCoordinatorId;
	}

	public String getLocationCoordinatorName() {
		return locationCoordinatorName;
	}

	public void setLocationCoordinatorName(String locationCoordinatorName) {
		this.locationCoordinatorName = locationCoordinatorName;
	}

	public List<Room_Type> getRoomType() {
		return roomType;
	}

	public void setRoomType(List<Room_Type> roomType) {
		this.roomType = roomType;
	}

	public String deleteRoom()
	{	
		InitialContext ic;
	try {
		ic = new InitialContext();
		RoomManFacadeRemote remote=(RoomManFacadeRemote)ic.lookup("room#com.lnt.lnd.facade.RoomManFacadeRemote");
		System.out.println("-----Into Delete Room-------");
		System.out.println("-->> "+getRoom_id());
		long time = System.currentTimeMillis();
		Date date=new Date(time) ;
		remote.deleteRoom(room_id,(Integer)session.get("user_no") , date, "Deleted");
		requestMsg.put("Msg","Room Deleted Successfully!!");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		return "SUCCESS";
	}
	
	public String updateRoom()
	{
		InitialContext ic;
		try {System.out.println("Enter into getUpdateRoom");
			ic = new InitialContext();
			RoomManFacadeRemote remote=(RoomManFacadeRemote)ic.lookup("room#com.lnt.lnd.facade.RoomManFacadeRemote");
			Room_Master room=new Room_Master();
		
			/*SET VALUES IN ROOM OBJECT*/
			room=remote.searchRoom(getRoom_id());
			room.setCity_location_id(25);
			room.setDel_flag(false);
			room.setRoom_name(getRoom_name());
			if(room_type.equalsIgnoreCase("Other"))
			{
			Room_Type roomType=new Room_Type();
			roomType.setRoom_type_name(getOther_room_type());
			room.setRoom_type_id(remote.saveRoomType(roomType));	
			}
			else
			{
			room.setRoom_type_id(remote.getRoomTypeId(room_type));
			}
			long time = System.currentTimeMillis();
			Date date=new Date(time) ;
			room.setUpdate_time_stamp(date);
			room.setUpdate_id((Integer)session.get("user_no"));
			//room.setLocation_coordinator_id(10);
			room.setMax_no_of_persons(getNo_of_participants());
			room.setSeating_capacity(getSeating_capacity());
			room.setRemarks(getRemarks());
			setFacilities(remote.getAllFacilities());
			List<Facility> facList=new ArrayList<Facility>();
			
			for(int i=0;i<facilities.size();i++)
			{	Facility fac=new Facility();
				fac=facilities.get(i);
				String facCount=(String)request.getParameter("fac"+fac.getFacility_id());
				if(!(facCount.trim().equals("0") ||  facCount.trim().equals("")))
				{
					fac.setFacility_type(facCount);
					facList.add(fac);
				}
			}
			remote.delRoomFacility(room.getRoom_id());
			remote.updateRoom(room);
			System.out.println(remote.setRoomFacilities(getRoom_id(), facList));
			requestMsg.put("Msg","Room Details updated Successfully!!");
			/*Close Connection*/
			ic.close();
			return "SUCCESS";
		} catch (NamingException e) {
			
			e.printStackTrace();
			requestMsg.put("Msg","Error Updating Room!!");
			return "ERROR";
		}
		
		
	}
	
	@Override
	public void setRequest(Map request) 
	{
		this.requestMsg=request;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) 
	{
		this.request=request;
		
	}

	@Override
	public void setSession(Map session) 
	{
		this.session=session;		
	}
	
	
	
	
}
