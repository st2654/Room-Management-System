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
<body><u>
<h2 align="center" style="color:maroon;">Room Details</h2>
</u>
<s:form theme="simple">
Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:select list="{'Mahape','Airoli','Powai'}" name="location" label="Location"/><br>
<br>


Room Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:select list="{'MPH','MPH2}" name="room_name" label="Room Name"/>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<s:submit name="search" label="search" value="Search"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<s:reset name="reset" label="cancel" value="Cancel"/>
</s:form>
</body>
</html>