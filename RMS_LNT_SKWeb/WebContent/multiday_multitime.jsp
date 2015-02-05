<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<s:head theme="ajax"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<s:form>
<s:select list="{'soft skill training','discussion','training'}" label="Room type"/>
<s:select list="{'mumbai','pune'}" label="Location"></s:select>
<s:datetimepicker name="start_date" label="Start Date" />
<s:datetimepicker name="end_date" label="End Date" />
<s:textfield name="seating_capacity" label="Seating Capacity"/>
<s:submit name="check_availability" label="Check Availability"></s:submit>



</s:form>
</body>
</html>