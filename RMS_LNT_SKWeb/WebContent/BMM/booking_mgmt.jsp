<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <link rel="stylesheet" href="../css/style.css" media="screen"/>
<title>Insert title here</title>
</head>
<body>

 
 <br>
 <table border="0" align="center">
 <tr><th colspan="2">
 <h3>Booking</h3> </th></tr><tr></tr><tr></tr>
 <tr>
 <td><img src="../images/logo/1331890872_calendar-selection-day.PNG"></td>
<td> <a class="tab" href="../BMM/index2.jsp" target="_subWindow">Single Day</a></td>
</tr>

<tr>
<td><img src="../images/logo/1331699219_check.PNG" border="0"></td>
<td><a class="tab" href="<s:url action="getAllTentaiveBookings"/>" target="_subWindow">Approve/Cancel Booking</a></td>
</tr><tr></tr><tr></tr><tr></tr>

 
 
 </table>
</body>
</html>