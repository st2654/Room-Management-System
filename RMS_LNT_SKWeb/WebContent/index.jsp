<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/style.css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>::RMS::L&T Infotech</title>
</head>
<body>
<table align="center" border="0" cellspacing="0" cellpadding="0" class="tablecss" width="950">
<tr><td colspan="2" style="border-bottom: solid 2px #666666;"><img src="images/header.jpg"  alt="L&T Infotech HEADER"></td></tr>
<tr><td colspan="2">
	
	<center><div class="loginFormUI" >
		<h3><s:property value="Msg"/></h3>
		<fieldset>
		<legend> <img src="images/logo/sign_in.png" align="middle" alt="Login" title="Login"> Login </legend>
		
		<s:form action="login">
		
	    <s:textfield label="Username" name="username"/>
	    <s:password label="Password"  name="password"/>
	    <s:submit value="Login"></s:submit>
	</s:form>    
	</fieldset>
	</div> </center>
	
</td></tr>

<tr><td class="footer" colspan="2"><b>&copy;</b>opyright <b>L&T Infotech</b> 2012 &nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
</table>
</body>
</html>