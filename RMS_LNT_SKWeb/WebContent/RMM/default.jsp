<%@page import="com.lnt.lnd.view.ViewRoomDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="jquery-1.2.2.pack.js"></script>
<script type="text/javascript" src="htmltooltip.js">

</script>

<link rel="stylesheet" href="css/tstyle.css" media="screen"/>

<link rel="stylesheet" type="text/css" href="css/tstyle.css" />
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="ddaccordion.js"></script>
<script type="text/javascript">
ddaccordion.init({
	headerclass: "submenuheader", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
	defaultexpanded: [], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", ""], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["suffix", "<img src='images/plus.gif' class='statusicon' />", "<img src='images/minus.gif' class='statusicon' />"], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
})
</script>
<script src="jquery.jclock-1.2.0.js.txt" type="text/javascript"></script>
<script type="text/javascript" src="jconfirmaction.jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('.ask').jConfirmAction();
	});
	
</script>
<script type="text/javascript">
$(function($) {
    $('.jclock').jclock();
});
</script>

<script language="javascript" type="text/javascript" src="niceforms.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/niceforms-default.css" />



</head>
<body>

<h3 align="center" style="color:green;"><s:property  value="#request.Msg"/></h3>
<% 
try{	
		List<ViewRoomDetails> ViewAllRooms=(List<ViewRoomDetails>) request.getAttribute("ViewAllRooms");
		int i=0;
		if(ViewAllRooms.size()>0 && ViewAllRooms!=null)
{ %>
<div class="right_content">            
        
    <h2>Room Details</h2> 
                   
                    
<table  id="rounded-corner" summary="PENDING REQUESTS">
	<thead>
		<tr>
			<th scope="col" class="rounded-company">S.No.</th>
			<th scope="col" class="rounded">City,Location</th>
			<th scope="col" class="rounded">Location Coordinator</th>
			<th scope="col" class="rounded">Room Name</th>
			<th scope="col" class="rounded">Facilities</th>
			<th scope="col" class="rounded">Edit</th>
			<th scope="col" class="rounded-q4">Delete</th>
		</tr>
    </thead>

	<tfoot>
    	<tr>
        	<td colspan="7" class="rounded-foot-left"><em> </em></td>
        	<td class="rounded-foot-right">&nbsp;</td>

        </tr>
    </tfoot>
	<%for(ViewRoomDetails viewRoom:ViewAllRooms)
		{
	 %>
	<tr>
		<td> <%=++i%> </td>
			<td><%out.print(viewRoom.getCity()+","+viewRoom.getLocation());%></td>
			<td><%=viewRoom.getLocationCoordinator() %></td>
			<td><%=viewRoom.getRoom_name() %></td>
			<td><%=viewRoom.getFacilities() %></td>
			<td>
			        	
			<s:form action="editRoom"> 
				<input name="room_id" type="hidden" value="<%=viewRoom.getRoom_id()%>" class="buttonStylee"/>
				<s:submit value="Edit"/></s:form> 
			</td>
			<td>
			 	<s:form action="deleteRoom"> 
				<input name="room_id" type="hidden" value="<%=viewRoom.getRoom_id()%>" class="buttonStyled"/>
				<s:submit value="Delete"/></s:form> 
			</td>
	</tr>
	<% }%>
</table> 
 <%}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
%>

</body>
</html>