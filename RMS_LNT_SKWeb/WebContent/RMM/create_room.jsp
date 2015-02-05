<%@page import="com.lnt.lnd.entity.Authentication"%>
<%@page import="com.lnt.lnd.entity.Facility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" media="screen"/>
<title>RMS_L&copy;T infoTech</title>
</head>
<body>
<fieldset>
<legend><b>Add Room</b></legend>

<s:form theme="simple" action="createRoom">

<table align="center">

 <tr>
 <td><s:label>Room Name</s:label></td><td>&nbsp;</td><td><s:textfield name="room_name" label="Room Name"/></td>
 </tr>
  <tr>
 <td><s:label>Room Type</s:label></td><td></td><td><s:select list="roomType" name="room_type" /></td>
 </tr>
 <tr>
 <td><s:label>Other Room Type</s:label></td><td></td><td><s:textfield name="other_room_type" label="other_room_type"/></td>
 </tr>
 <tr>
 <td><s:label>Location Coordinator</s:label></td><td></td><td>
 <select name="locationCoordinatorId">
 
 <% 
	List<Authentication> userList;
	userList=(List<Authentication>)request.getAttribute("userList");
	
	if(userList.size()<0 || userList!=null)
	{ 
		for(Authentication tempUser:userList)
		{	
	%>
	<option value="<%=tempUser.getUser_no()%>"><%=tempUser.getUsername() %></option>
		
	<%}
	}
	else
	{
	%>
			<option value="no">No Location Coordinator List Available</option>
	<%
	}
	 %>
 </select></td>
 </tr>
 <tr>
 </tr>
 </table >
 <table align="center">
 <tr>
 <td><hr width="500 px">
 </td>
 
 </tr></table>
 
 <table align="center">
 <tr><th>
 FACILITIES</th></tr><tr>
 	<td>
	<% 
	List<Facility> facList;
	facList=(List<Facility>)request.getAttribute("facList");
	
	if(facList.size()<0 || facList!=null)
	{ 
		for(Facility tempFac:facList)
		{	
			%>
			<tr><td><%=tempFac.getFacility_name() %></td><td><input type="text" name="fac<%=tempFac.getFacility_id()%>" value="0"></td></tr>
			<%			
		}
	}%>
 	</td>
	</tr>
	<tr>
 </tr>
 <tr>
 </table>
  <table align="center">
 <tr>
 <td><hr width="500 px">
 </td>
 
 </tr></table>
 
 <table align="center">
 <tr><th align="left">
VENUE</th></tr><tr>
 	<td>
 <s:label>City</s:label></td><td></td><td><s:select list="{'Select','Mumbai','Bangalore','Chennai','---------Others----------'}" name="city" label="City" onchange="CheckCity(this.value);"/>
 	</td>
	 <td>
 <input type="text" maxlength="20" name="other_city" id="other_city" style='display:none;'/>
	 </td>
</tr>
<tr>
  <td><s:label>Location</s:label></td><td></td><td><s:select list="{'Select','Mahape','Airoli'}" name="location"></s:select>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
<tr>
  <td><s:label>Block</s:label></td><td></td><td><s:select list="{'Select','Block-1','Block-2'}" name="block"></s:select>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
    <tr>
  <td><s:label>Address</s:label></td><td></td><td><s:textfield name="address"></s:textfield></td>
</tr>
<tr>
<td><s:label>Seating Capacity</s:label></td><td></td><td><s:textfield name="seating_capacity"/></td>

</tr>
<tr>
<td><s:label>No. Of Participants</s:label></td><td></td><td><s:textfield name="no_of_participants"/></td>

</tr><tr></tr>
</table>
<table align="center">
 <tr>
 <td><hr width="500 px">
 </td>
 
 </tr></table>
 
 <table align="center">
 <tr><th align="left">
REMARKS</th></tr>
<tr>
 	<td>
 </td><td></td><td><s:textarea value="Remarks Here" name="remarks" cols="20" rows="4"></s:textarea>
  	</td>
</tr>

<tr>
<td></td><td>
<s:submit align="center" name="create_room" label="Create Room" value="Create Room"/></td><td><s:reset value="Back"></s:reset></td>
</tr>



</table>


</s:form>
</fieldset>
</body>
</html>