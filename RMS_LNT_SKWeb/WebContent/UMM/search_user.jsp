<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<u>
<h2 align="center" style="color:maroon;">Room Details</h2>
</u>
<s:form>
<s:textfield name="psno" label="PS.NO"/>
<s:textfield name="name" label="Name"/><!-- 
<s:textfield name="City" label="PS.NO"/>
<s:textfield name="psno" label="PS.NO"/> -->
<s:select list="{'Mumbai','Bangalore','Chennai'}" name="city" label="City"/>
<s:select list="{'Mahape','Airoli','Powai'}" name="location" label="Location"/>
<s:submit name="search" label="Search" ></s:submit>
<s:reset name="cancel" label="Cancel"/>
</s:form>
</body>
</html>