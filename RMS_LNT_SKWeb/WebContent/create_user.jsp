
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>

<body style="font-family:monospace ;font-size:medium;">
<u>
<h2 align="center" style="color:maroon;font-family: monospace;font-size: x-large;">USER DETAILS</h2>
</u>
<s:form name="create_user" theme="simple">

PS.No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="login_psno" label="PS.NO"/>&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="name" label="Name"/><br><br>

Email Id&nbsp;&nbsp;:<s:textfield name="email_id" label="Email Id"/>&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;Role&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:select list="{'Super Administrator','Administrator','Power User'}" name="role" label="Role"/><br><br>
Location&nbsp;&nbsp;:<s:select list="{'Mahape','Airoli','Powai','Other'}" name="location" label="Location"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other Location:<s:textfield name="other_location" label="Other Location"/><br><br>
City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:select list="{'Mumbai','Bangalore','Chennai','Other'}" name="city" label="City"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other City&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="other_city" label="Other City"/> <br><br>
Block&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="block" label="Block"></s:textfield>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="address" label="Address"/><br><br>
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:submit align="center" name="submit" label="Create User" value="Create User"/>
&nbsp;&nbsp;<s:reset name="reset" label="Reset" value="Cancel"></s:reset>


</s:form>





</body>
</html>