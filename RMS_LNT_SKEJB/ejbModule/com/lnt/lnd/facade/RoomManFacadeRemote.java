package com.lnt.lnd.facade;
import java.sql.Date;
import java.util.Collection;
import java.util.List;

import javax.ejb.Remote;

import com.lnt.lnd.entity.Authentication;
import com.lnt.lnd.entity.Facility;
import com.lnt.lnd.entity.Room_Master;
import com.lnt.lnd.entity.Room_Type;

@Remote
public interface RoomManFacadeRemote 
{	/*Room CRUD Func*/
	int createRoom(Room_Master room);
	int updateRoom(Room_Master room);
	Room_Master searchRoom(int room_id);
	int deleteRoom(int room_id,int update_id,Date update_time_stamp,String Remarks);
	/*Room CRUD END*/
	String searchRoomTypeName(int room_type_id);
	List<Facility> getAllFacilities();
	List<Room_Type> getAllRoom_Type();
	boolean setRoomFacilities(int room_id,List<Facility> facility);
	int getRoomTypeId(String roomTypeName);
	String getRoomTypeName(int id);
	int saveRoomType(Room_Type roomType);
	List<Room_Master> getAllRooms(); 
	List<Facility>  getRoomFacility(int room_id);
	String getFacilityname(int id);
	String getUsername(int id);
	boolean delRoomFacility(int room_id);
	List<Authentication> getLocCoordList();
}


