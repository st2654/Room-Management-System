<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
<!--
.cellback {
background: url(images/glossyback.gif) repeat-x;
border-right: 1px solid black;

padding: 2px;
}
-->
</style>

</head>
<body>
 <form name="f2">
<table border="1" width="900">
<tr><td colspan="2"><img src="images/header3.JPG" alt="Header"/></td></tr>
<tr>
<td class="cellback" align="center" width="20%" valign="top" style="color:maroon;font-family:monospace ; ;font-size:larger ;">
<s:form name="first_time_login" theme="simple">
<b><br><u>CHANGE PASSWORD</u><br><br><br><br>
Current Password:<s:textfield name="current_password" label="current_password"/><br><br>
New Password&nbsp;&nbsp;&nbsp;&nbsp;:<s:textfield name="new_password" label="new_password"/><br><br>
Confirm Password:<s:textfield name="confirm_password" label="confirm_password"/><br><br><br>
<s:submit name="Submit" value="Submit"/>&nbsp;&nbsp;&nbsp;
<!-- <input type="image" src="" onclick="document.f3.reset();return false;" /> -->
<s:reset name="Reset" value="Reset"></s:reset>
</b>
</s:form>

	<td width="30%" height="400px" "top" style="color:blue; "><div  style="height:10px; max-height:80px;  ">
	
		<img src="" alt="Header" height="420px" width="100%"/>
		
		</div>
	</td>
	</tr>
<tr style="background-color:#666666;color:white;text-align: center;"><td colspan="2">Copyright @ 2012 Larsen & Toubro Infotech Ltd</td></tr>

</tr>
</table>
</form>
	
</body>
</html>