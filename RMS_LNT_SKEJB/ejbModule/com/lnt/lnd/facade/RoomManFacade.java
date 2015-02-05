package com.lnt.lnd.facade;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.lnt.lnd.entity.Authentication;
import com.lnt.lnd.entity.Facility;
import com.lnt.lnd.entity.Room_Master;
import com.lnt.lnd.entity.Room_Type;
import com.lnt.lnd.entity.Room_Facilities;


@Stateless(mappedName = "room")
public class RoomManFacade implements RoomManFacadeRemote 
{
	@PersistenceContext
	EntityManager em;
    public RoomManFacade() 
    {
    	
    }

	@Override
	public int createRoom(Room_Master room) 
	{	 
		Room_Master tempRoom=new Room_Master();
		em.persist(room);
		String jpql="select roomInfo from Room_Master roomInfo where roomInfo.room_name='"+room.getRoom_name()+"' and + roomInfo.location_coordinator_id="+room.getLocation_coordinator_id()+" and roomInfo.creator_id="+room.getCreator_id()+" and roomInfo.creation_time_stamp='"+room.getCreation_time_stamp()+"'" ;
		Query query=em.createQuery(jpql);
		tempRoom=(Room_Master)query.getSingleResult();
		return tempRoom.getRoom_id(); 
	}

	@Override
	public int updateRoom(Room_Master room)
	{	
		Room_Master tempRoom=new Room_Master();
		tempRoom=em.merge(room);
		return tempRoom.getRoom_id();
	}

	@Override
	public Room_Master searchRoom(int room_id) 
	{
		Room_Master room=new Room_Master();
		room=em.find(Room_Master.class, room_id);
		return room;
		
	}

	@Override
	public int deleteRoom(int room_id,int update_id,Date update_time_stamp,String Remarks) 
	{	
		Room_Master room=new Room_Master();
		room=em.find(Room_Master.class, room_id);
		room.setDel_flag(true);
		
		em.merge(room);
		
		
		return 0;
	}

	@Override
	public String searchRoomTypeName(int room_type_id) 
	{	Room_Type roomType=new Room_Type();
		roomType=em.find(Room_Type.class, room_type_id);
		return roomType.getRoom_type_name();
	}

	@Override
	public List<Facility> getAllFacilities() 
	{
		String jpql="select fac from Facility fac";
		Query query=em.createQuery(jpql);
		List<Facility> facilityList=new ArrayList<Facility>();
		facilityList=query.getResultList();		
		return facilityList;
	}

	@Override
	public List<Room_Type> getAllRoom_Type() 
	{
		String jpql="select roomtype from Room_Type roomtype";
		Query query=em.createQuery(jpql);
		List<Room_Type> roomTypeList=new ArrayList<Room_Type>();
		roomTypeList=query.getResultList();		
		return roomTypeList;
	}

	@Override
	public boolean setRoomFacilities(int room_id, List<Facility> facility) 
	{
		if(facility.size()>0 && facility!=null)
		{		Room_Facilities[] tempRF=new Room_Facilities[facility.size()];
				int i=0;
			for(Facility tempFac:facility)
			{	tempRF[i]=new Room_Facilities();
				tempRF[i].setRoom_id(room_id);
				tempRF[i].setFacility_id(tempFac.getFacility_id());
				/*Here we are using Facility_type as Facility_Desc*/
				tempRF[i].setFacility_desc(tempFac.getFacility_type());
				System.out.println("Room-Facilities"+tempFac.getFacility_id()+" "+tempRF[i].getFacility_desc());
				updateRoomFacilities(tempRF[i]);
				i++;			
			}
			
			return true;
		}
		return false;
	}
	public boolean updateRoomFacilities(Room_Facilities rf)
	{
		try {
			em.merge(rf);
			return true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public int getRoomTypeId(String roomTypeName) 
	{
		String jpql="select roomType from Room_Type roomType where roomType.room_type_name='"+roomTypeName+"'";
		Query query=em.createQuery(jpql);
		Room_Type rt=(Room_Type)query.getSingleResult();		
		return rt.getRoom_type_id();
	}

	@Override
	public int saveRoomType(Room_Type roomType) {
		Room_Type tempRoom=new Room_Type();
		em.persist(tempRoom);
		String jpql="select roomType from Room_Type roomType where roomType.room_type_name='"+roomType.getRoom_type_name()+"'";
		Query query=em.createQuery(jpql);
		tempRoom=(Room_Type)query.getSingleResult();
		return tempRoom.getRoom_type_id();
	}

	@Override
	public List<Room_Master> getAllRooms() 
	{
		String jpql="select roomInfo from Room_Master roomInfo where roomInfo.del_flag=false" ;
		Query query=em.createQuery(jpql);
		List<Room_Master> allRooms=query.getResultList();
		return allRooms;
	}

	@Override
	public String getRoomTypeName(int id) 
	{
		Room_Type rt=(Room_Type)em.find(Room_Type.class, id);		
		return rt.getRoom_type_name();
	}

	@Override
	public List<Facility> getRoomFacility(int room_id) 
	{	
		String jpql="select roomInfo from Room_Facilities roomInfo where roomInfo.room_id="+room_id ;
		Query query=em.createQuery(jpql);
		List<Room_Facilities> roomInfo=query.getResultList();
		List<Facility> facList=new ArrayList<Facility>();
		for(Room_Facilities tempRoomFac:roomInfo)
		{ 
			Facility tempFac=new Facility();
			tempFac.setFacility_id(tempRoomFac.getFacility_id());
			tempFac.setFacility_name(getFacilityname(tempRoomFac.getFacility_id()));
			tempFac.setFacility_type(tempRoomFac.getFacility_desc());
			facList.add(tempFac);
		}
		
		return facList;
	}

	@Override
	public String getFacilityname(int id) 
	{
		Facility fac=em.find(Facility.class,id);
		return fac.getFacility_name();
	}

	@Override
	public String getUsername(int id) 
	{
		Authentication user=em.find(Authentication.class, id);
		return user.getUsername();
	}

	@Override
	public boolean delRoomFacility(int room_id) 
	{	String jpql="delete from Room_Facilities roomInfo where roomInfo.room_id="+room_id ;
		Query query=em.createQuery(jpql);
		query.executeUpdate();
		return true;
	}

	@Override
	public List<Authentication> getLocCoordList() 
	{
		String jpql="select user from Authentication user where user.del_flag=false and user.role_Type='AD'" ;
		Query query=em.createQuery(jpql);
		List<Authentication> user=query.getResultList();
		return user;
	}

}
