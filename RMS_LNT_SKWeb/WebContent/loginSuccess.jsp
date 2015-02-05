<%@page import="com.opensymphony.xwork2.ActionInvocation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
  String roleType=(String)session.getAttribute("roleType");
%>
<link rel="stylesheet" href="css/style.css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>::RMS::L&T Infotech</title>

		

</head>
<body>
<table align="center" border="0" cellspacing="0" cellpadding="0" class="tablecss" width="950">
<tr><td colspan="2" ><img src="images/header.jpg"  alt="L&T Infotech HEADER"></td></tr>
	<% 
		if(roleType.equals("SA"))
		{
		%><%@include file="tabs/SA_tabs.jsp"%>
		<% }
		else if(roleType.equals("AD"))
		{
		%><%@include file="tabs/AD_tabs.jsp"%>
		<%}
		else if(roleType.equals("PU"))
		{
		%>
		<%@include file="tabs/PU_tabs.jsp"%>
		<%
		}
	%>
<tr><td><iframe name="_mainWindow" height="380" width="200" frameborder="0" ></iframe></td><td><iframe name="_subWindow" height="380" width="750" frameborder="0" scrolling="auto"></iframe></td></tr>


<tr><td class="footer" colspan="2"><b>&copy;</b>opyright <b>L &amp; T Infotech</b> 2012 &nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
</table>
</body>
</html>