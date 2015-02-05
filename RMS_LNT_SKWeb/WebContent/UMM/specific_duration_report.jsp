<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><s:head theme="ajax"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" media="screen"/>
<title>Insert title here</title>

</head>
<body>
<fieldset>
<legend><b>Specific Duration Report</b></legend>
<s:form theme="simple">
<br>
<table align="center">
<tr><td align="left"><s:label>Start Date</s:label></td><td><s:datetimepicker type="date" displayFormat="dd/MM/yyyy" name="start_date" label="Start Date"/></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td align="left"><s:label> End Date</s:label></td><td><s:datetimepicker  type="date" displayFormat="dd/MM/yyyy" name="end_date" label="End Date"/></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td align="left"><s:label>Location</s:label></td><td><s:select list="{'Mahape','Airoli','Powai'}"/></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td><s:submit name="submit" value="Generate Report"/></td><td><s:reset name="reset" value="Cancel"></s:reset></td></tr>

</table>

</s:form>
</fieldset>
</body>
</html>