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
<legend><b>Edit Room</b></legend>

<s:form theme="simple" action="deleteRoomRemote">
<s:hidden name="room_id"/>
Room Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield readonly="true" name="room_name"  label="Room Name"/><br><br>
Room Type&nbsp;&nbsp;-:<s:select disabled="true" list="roomType" name="room_type"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<tr>
 <td><s:label>Location Coordinator</s:label></td><td></td><td>
 <select disabled="disabled" name="locationCoordinatorId">
 
 <% 
	List<Authentication> userList;
	userList=(List<Authentication>)request.getAttribute("userList");
	
	if(userList.size()<0 || userList!=null)
	{ 
		for(Authentication tempUser:userList)
		{
		if((Integer)request.getAttribute("LOC_id")!=tempUser.getUser_no() )
		{	
	%>
	
	<option value="<%=tempUser.getUser_no()%>"><%=tempUser.getUsername() %></option>
	<%}else
	{
	%>
		<option value="<%=tempUser.getUser_no()%>" selected="selected"><%=tempUser.getUsername()%></option>
	<%
	}
	}
	}
	%>
 </select></td>
 </tr>
<hr><u>Facilities</u>:<br>
<table border="0" >
<% 
	List<Facility> facList;
	facList=(List<Facility>)request.getAttribute("facList");
	List<Facility> currentFacList=(List<Facility>)request.getAttribute("currentFacList");
	String facValue="0";
	if(facList.size()<0 || facList!=null)
	{ 
		for(Facility tempFac:facList)
		{	for(Facility tempCurFacList:currentFacList)
			{	
				if(tempCurFacList.getFacility_id()==tempFac.getFacility_id())
				{	//out.print("call faci inside"+tempCurFacList.getFacility_type());
					facValue=tempCurFacList.getFacility_type();
					break;
				}
				else
				{
				facValue="0";
				}
			}
			%>
			<tr><td><%=tempFac.getFacility_name() %></td><td><input readonly="readonly" type="text" name="fac<%=tempFac.getFacility_id()%>" value="<%=facValue%>"></td></tr>
			<%
			
		}
	}%>
</table>
<hr>
<u>Venue</u>:
<br>City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:select disabled="true" list="{'Mumbai','Bangalore','Chennai'}" label="City" name="city"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:select disabled="true"  list="{'Mahape','Airoli','Powai'}" label="Location" name="location"/><br>
<br>Block&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield readonly="true" name="block" label="Block"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number Of Participants:<s:textfield readonly="true" name="no_of_participants" label="No.Of.Participants"/><br>
<hr>
<br>Remark&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="remarks" label="Remarks"/>&nbsp;&nbsp;&nbsp;
<br>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:submit align="center" name="Delete Room" label="Delete Room" value="Delete Room"/>&nbsp;&nbsp;&nbsp;
<s:reset name="cancel" label="Cancel" value="Back"/><br>
</s:form>
</fieldset>
</body>
</html>