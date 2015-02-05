<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
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

.resetback{
background: url(images/reset.jpg);
border-right: 1px solid black;

padding: 2px;
}


-->
</style>

</head>
<body>

<table border="1" width="900">
<tr><td colspan="2"><img src="images/header3.JPG" alt="Header"/></td></tr>
<tr>
	<td width="30%" height="400px" valign="top" style="color:blue; "><div  style="height:10px; max-height:80px;  ">
	
		<img src="images/lnthouse.JPG" alt="Header" height="420px" width="100%"/>
		
		</div>
	</td>
<td class="cellback" align="center" width="20%" valign="top" style="color:maroon;font-family:monospace; ;font-size:larger;"><br><b><u>LOGIN HERE</u><br><!--  <iframe height="600" scrolling="no"   width="100%" style="border:0;" name="_hello"></iframe>-->
<br><br><br>
<s:form name="f3" theme="simple" action="login">
<s:hidden name="errorMsg"></s:hidden>
Username:<s:textfield name="username" label="username"/><br><br><br>
Password:<s:password name="password" label="password"/><br><br><br>
<s:submit name="Submit" value="Submit"/>&nbsp;&nbsp;&nbsp;
<s:reset name="Reset" value="Reset"/>



</s:form>


</td></tr>
<tr style="background-color:#666666;color:white;text-align: center;"><td colspan="2">Copyright @ 2012 Larsen & Toubro Infotech Ltd</td></tr>

</tr>
</table>

 
  
</body>
</html>