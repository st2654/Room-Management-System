<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="CSS/style2.css" rel="stylesheet"  media="screen" />
<title>Insert title here</title>
</head>
<body>
<u>
<h2 align="center" style="color:maroon;">Room Details</h2>
</u>
<s:form theme="simple">
Room Id&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="room_id" label="Room Id"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Room Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="room_name" label="Room Name"/><br><br>
Room Type&nbsp;&nbsp;:<s:select list="{'Training Room','Discussion Room','Soft Skills Room'}" name="room_type"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Other Room Type&nbsp;&nbsp;:<s:textfield name="other_room_type" label="other_room_type"/><br><br>
Location Co-ordinator:<s:textfield name="location_co_ordinator" label="location_co_ordinator" disabled="true"/>

<hr><u>Facilities</u>:<br>
<s:checkbox name="facility" label="Projector"/>Projector:<s:textfield name="projector" disabled="true"/><br>
<br><s:checkbox name="facility" label="WhiteBoard"/>WhiteBoard:<s:textfield name="whiteboard" disabled="true"/><br>
<br><s:checkbox name="facility" label="FlipChart"/>FlipChart:<s:textfield name="flipchart" disabled="true"/><br>
<br><s:checkbox name="facility" label="Screen"/>Screen:<s:textfield name="screen" disabled="true"/><br>
<hr>
<u>Venue</u>:
<br>City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:select list="{'Mumbai','Bangalore','Chennai'}" label="City"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:select list="{'Mahape','Airoli','Powai'}" label="Location"/><br>
<br>Block&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="block" label="Block"/><br>
<hr>
<br>Remark&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="remark" label="Remarks"/>&nbsp;&nbsp;&nbsp;
Number Of Participants:<s:textfield name="no_of_participants" label="No.Of.Participants"/><br>
<br><b>Are You Sure You Want To Delete The Room? 
<s:submit name="delete_room" label="Delete Room" value="YES"/>&nbsp;&nbsp;&nbsp;
<s:reset name="cancel" label="Cancel" value="NO"/><br>





</s:form>
</body>
</html>