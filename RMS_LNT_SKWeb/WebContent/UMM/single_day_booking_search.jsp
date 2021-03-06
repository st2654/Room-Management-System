<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags"%> 
     <%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--<s:head theme="ajax"/>-->
<sx:head/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" media="screen"/>
<title>Insert title here</title>
        <script type="text/javascript">
        function toggle_radio(id1,id2,cbn) {
            var n = document.getElementById(id1);
            var m = document.getElementById(id2);              
            if(!m.checked)
           	{ 	
            	n.style.display='block';   
           	}
            else
            	{
            	n.style.display='none';
            	}     
            
       }
       function CheckCity(val)
{  
 var element=document.getElementById('other_city');   
if(val=='Others')     
element.style.display='block';   
else       
element.style.display='none';  }  
function CheckLocation(val)
{  
 var element=document.getElementById('other_location');   
if(val=='Others')     
element.style.display='block';   
else       
element.style.display='none';  }  
function show_details(val) {
	dojo.event.topic.publish("show_detail");
}
        </script>

</head>
<body>
<fieldset>
<legend><b>Single Day Booking</b></legend>


<s:form id="booking" theme="simple" name="booking" action="BookingAction">
<table align="center">
<tr>
<td><s:label>No Of Participants</s:label></td>
<td><s:textfield name="noOfParticipants" /></td>
</tr>
<tr>
	<td><s:label>Room Type</s:label></td>
	<td><s:select list="{'soft skills','discussion','training'}" name="roomType" label="Room type"/></td>
	<td></td><td></td>
</tr>
<tr><td>
<s:label>City</s:label></td><td><s:select list="lstList1" name="city"
						headerValue="---Select---" headerKey="-1"
						onchange="javascript:show_details(this.value);return false;"/>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td><s:label>Location</s:label></td><td><s:url id="d_url" action="DetailAction" /> <sx:div
						id="details" href="%{d_url}" listenTopics="show_detail"
						formId="booking" showLoadingText=""></sx:div></td>
</tr>
<tr>
	<td><s:label>Date</s:label></td>
	<td><s:datetimepicker name="date" type="date" displayFormat="yyyy-MM-dd" label="Select Date"></s:datetimepicker></td>
	<td></td><td></td>
</tr><tr><td colspan="2">&nbsp;</td></tr>
<tr>
<td><s:checkbox name="checkBox1" label="Full Day" value="checkBox" id="checkBox" onclick="toggle_radio('id_1','checkBox',this);"/>
<s:label>Full Day</s:label></td>
</tr>
<tr id="id_1" style="display:block ;">
<!-- <div id="id_1" style="display:block ;"> -->
<td><input type="radio" name="mb" id="rb1" value="SingleTimeSlot">
 <s:label>Single Time Slot</s:label></td>
<td><input type="radio" name="mb" id="rb2" value="MultipleTimeSlot">
<s:label>Multiple Time Slot</s:label></td>
 </tr><tr><td colspan="2">&nbsp;</td></tr>
<tr>
<td><s:label>Start Time</s:label></td>
<td><s:datetimepicker type="time" name="startTime" label="Start Time" id="start_time" displayFormat="HH:mm:ss" /></td>
</tr>
<tr>

<td><s:label>End Time</s:label></td>
<td><s:datetimepicker type="time" name="endTime" label="End Time" id="end_time"/></td>
</tr>
<tr>
<td></td><td><s:submit name="Proceed" label="Proceed" value="Proceed" ></s:submit></td>
<!-- <td><s:label>Room Name</s:label></td>
<td><s:select name="roomName" list="lstAvailability"   label="room_name"></s:select></td>
</tr>-->
</tr>

<tr>


</tr>
</table>
</s:form>
</fieldset>
</body>
</html>