<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" media="screen"/>
<title>Insert title here</title>
<script type="text/javascript">  
function CheckCity(val)
{  
 var element=document.getElementById('other_city');   
if(val=='Others')     
element.style.display='block';   
else       
element.style.display='none';  }  
function CheckLocation(val)
{  
 var element=document.getElementById('other_location');   
if(val=='Others')     
element.style.display='block';   
else       
element.style.display='none';  }  
  </script>  
  
</head>
<body>
<fieldset>
<legend><b>UnBlock User</b></legend>
<s:form name="unblock_user" theme="simple" action="unblockuser">
 Enter Pay Slip No.<s:textfield name="searchPsno" ></s:textfield><br/> <br>
 <s:submit value = "search" action="unblockuser" method="search"/>
 <table align="center">
<tr>
	<td><s:label>Pay Slip No.</s:label>
	</td>	<td></td>
	<td><s:textfield name="loginPsno" maxlength="6"  readonly="true"  ></s:textfield>
</td>
</tr>
<tr>
	<td><s:label>Name</s:label></td>
	<td></td>
	<td><s:textfield name="name" maxlength="30"  readonly="true" ></s:textfield>
	</td>
</tr>
<tr>
	<td><s:label>Email Id</s:label></td>
	<td></td>
	<td><s:textfield name="emailId" maxlength="30"  readonly="true" ></s:textfield></td>
</tr>
<tr>
	<td><s:label>Role</s:label></td>
	<td></td>
	<td><s:textfield readonly="true"  name="role"></s:textfield>
</tr>
<tr>
	<td><s:label>City</s:label></td>
	<td></td>
	<td><s:textfield readonly="true" name="city" onchange="CheckCity(this.value);"></s:textfield>
	<td><input type="text" name="other_city" id="other_city" style='display:none;'/></td>
</tr>
<tr>
	<td><s:label>Location</s:label></td>
	<td></td>
	<td><s:textfield readonly="true" name="location" onchange="CheckLocation(this.value);"></s:textfield></td>
	<td><input   type="text"  name="other_location" id="other_location" style='display: none;'></td>
</tr>
<tr>
	<td><s:label>Block</s:label></td>
	<td></td>
	<td><s:textfield name="block" readonly="true"></s:textfield>
	</td>
</tr>

<tr>
	<td><s:label>Address</s:label></td>
	<td></td>
	<td><s:textfield name="address" maxlength="30" readonly="true"></s:textfield>
</tr>	
<tr>
	<td><s:label  >Remarks</s:label></td>
	<td></td>
	<td><s:textfield name="remarks" maxlength="30" cssStyle=" border: solid 1px red; "></s:textfield></td>
</tr>
<tr></tr><tr></tr><tr>
</table>
<h3 align="center">Are You Sure You Want To Unblock The User?</h3>
<table align="center">
<tr><th>
<tr></tr>
<tr><td>
</td><td>
<s:submit value="YES" name="submit" label="Edit User"></s:submit></td>
<td><s:reset value="NO" name="reset" label="Reset"></s:reset></td>
</tr>
</table>

 
</s:form>
</fieldset>
</body>
</html>