<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" media="screen"/>

<title>Insert title here</title>

<script type="text/javascript">
function CheckDetails(val)
{ 
	 var element1=document.getElementById('id_1');
	 
	 if(val=='Open'){     
	 	element1.style.display='none';
	 	
	 }
	 else       
	{
	 element1.style.display='block';
	
	 
	}
}
	
	
	
   
    

function CheckBU(val)
{  
 	var element=document.getElementById('other_bu');   
	if(val=='---------Others----------')     
	element.style.display='block';   
	else       
	element.style.display='none';  
}
	
function toggle_details(psno,name,bu_type,email,mobile,chk1,cbn) 
{
	var chk=document.getElementById(chk1);
	var m = document.getElementById(psno);
	var nm = document.getElementById(name);
	var bt = document.getElementById(bu_type);
    var em = document.getElementById(email);
   	var mob = document.getElementById(mobile);
   	if(!chk.checked)
    {
    		//m.disabled = !cbn.checked;
    	    nm.disabled = chk;
    	    bt.disabled = chk;
    	    em.disabled = chk;
    	    mob.disabled =chk;
    	    
    	    
    }
    else
    {
   		 //m.disabled = cbn.checked;
   	    nm.disabled = !chk;
   	    bt.disabled = !chk;
   	    em.disabled = !chk;
   	    mob.disabled =!chk;
   	    
   	  
   } 	
}
	
function toggle_details1(psno,name,bu_type,email,mobile,chk1,cbn) 
{
	var chk=document.getElementById(chk1);
	var m = document.getElementById(psno);
	var nm = document.getElementById(name);
	var bt = document.getElementById(bu_type);
    var em = document.getElementById(email);
   	var mob = document.getElementById(mobile);
   	if(!m.checked)
    {
    		//m.disabled = !cbn.checked;
    	    nm.disabled = !cbn.checked;
    	    bt.disabled = !cbn.checked;
    	    em.disabled = !cbn.checked;
    	    mob.disabled = !cbn.checked;
    	    
    	    
    }
    else
    {
   		// m.disabled = cbn.checked;
   	    nm.disabled = cbn.checked;
   	    bt.disabled = cbn.checked;
   	    em.disabled = cbn.checked;
   	    mob.disabled = cbn.checked;
   	    
   	    
   } 	
}
</script>
</head>
<body>
<fieldset>
<legend><b>Single Day Search Result</b></legend>

<s:form name="single_day_booking" theme="simple" action="BookRoom">
<table align="center">
<th colspan="2"><s:label>Booking Details</s:label></th>
<tr>
<td><s:label>Room Name</s:label></td>
<td><s:textfield name="roomName" label="Room Name" readonly="true"/></td>
</tr>
<tr>
<td><s:label>Date</s:label></td>
<td><s:textfield name="date" label="date" readonly="true"/></td>
</tr>
<tr>
<td><s:label>Start Time</s:label></td>
<td><s:textfield name="startTime" label="Start Time" readonly="true"/></td>
</tr>
<tr>
<td><s:label>End Time</s:label></td>
<td><s:textfield name="endTime" label="End Time" readonly="true"/></td>
</tr>
<tr>
<td><s:label>City</s:label></td>
<td><s:textfield name="city" label="city" readonly="true"/></td>
</tr>
<tr>
<td><s:label>Location</s:label></td>
<td><s:textfield name="location" label="location" readonly="true"/></td>
</tr>
</table>
<hr width="500" align="center">
<!--<table align="center">
<th colspan="2">Facilities</th>
<tr>
<td><s:label>Screen</s:label></td>
<td><s:textfield name="screen" label="screen" disabled="true"/></td>
</tr>
<tr>
<td><s:label>Flipchart</s:label></td>
<td><s:textfield name="flipchart" label="flipchart" disabled="true"/></td>
</tr>
<tr>
<td><s:label>WhiteBoard</s:label></td>
<td><s:textfield name="whiteboard" label="whiteboard" disabled="true"/></td>
</tr>
<tr>
<td><s:label>Projector</s:label></td>
<td><s:textfield name="projector" label="projector" disabled="true"/></td>
</tr>
</table>  -->

<hr width="500" align="center">
<table align="center">
<tr>
	<td><s:label>Program Type</s:label></td>
	<td>&nbsp;</td>
	<td><s:select list="{'BU SPECIFIC','OPEN'}" id="program_type" name="program_type" label="Program Type" onchange="CheckDetails(this.value);"/></td>
	
	<td>&nbsp;</td>
</tr>
</table>
<div id="id_1">
<table align="center" id="table1" style="display: ;">
<!--  <tr id="tr1" style="display:block ;">
	<td><s:checkbox name="new_requester" label="New Requester" id="checkBox" onchange="toggle_details('psno','name','bu_type','email','mobile','checkBox',this);"/></td>
	<td><s:label>New Requester</s:label></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>-->

<tr id="tr2" style="display:block ;">
<td><s:label>Pay Slip No.</s:label></td><td>&nbsp;</td><td><s:textfield name="ps_no" label="ps_no" id="ps_no"/></td><td>&nbsp;</td>
</tr>
<tr id="tr3" style="display:block ;">
<td><s:label>Name</s:label></td><td>&nbsp;</td><td><s:textfield name="name" label="name" id="name" disabled="true"/></td><td>&nbsp;</td>
</tr>
<tr id="tr4" style="display:block ;">
<td><s:label>Business Unit</s:label></td><td>&nbsp;</td><td><s:select list="{'java','dotnet','oracle'}" id="bu_type" name="bu_type" label="bu_type" disabled="true" onchange="CheckBU(this.value);" /></td><td><input type="text" maxlength="20" name="other_bu" id="other_bu" id="other_bu" disabled="true" style='display:none ; '/></td>
 </tr>
 <tr id="tr5" style="display:block ;">
 <td><s:label>Email</s:label></td><td>&nbsp;</td><td><s:textfield name="email" label="email" id="email" disabled="true"/></td><td>&nbsp;</td>
 </tr>
 <tr id="tr6" style="display:block ;">
 <td><s:label>Mobile</s:label></td><td>&nbsp;</td><td><s:textfield name="mobile" label="mobile" id="mobile" disabled="true"/></td><td>&nbsp;</td>
</tr>
</table>
</div>

<table align="center">
<tr>
<td><s:submit name="submit" label="submit" value="Book"/></td>
<td><s:reset name="reset" label="reset" value="Cancel"></s:reset></td>
</tr>
</table>
<!--</td>
 </tr>
</table> -->
</s:form>
</fieldset>
</body>
</html>