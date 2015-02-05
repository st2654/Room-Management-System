<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
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
if(val=='---------Others----------')     
element.style.display='block';   
else       
element.style.display='none';  }  
function CheckLocation(val)
{  
 var element=document.getElementById('other_location');   
if(val=='---------Others----------')     
element.style.display='block';   
else       
element.style.display='none';  
}  
function CheckTable(val)
{  
 var element=document.getElementById('tab_view');   
if(val=='search')
element.style.display="table";   
else       
element.style.display='none';  
}  
  </script>  

</head>
<body>
<fieldset>
<legend><b>Edit User</b></legend>
<s:form name="edit_user" theme="simple" action="user" >
Enter Pay Slip No.<s:textfield name="searchPsno" ></s:textfield><br/> <br>
<table>
<tr>
	<td><s:submit value = "search" action="user" method="search"/>
	</td>
	<!--  <td>
	 <s:submit action="user" value = "edit" method="edit" />
	</td>
	<td>
<s:submit action="user" value = "delete" method="delete" />
	</td>
	<td>
<s:submit action="user" value = "block" method="block" />
	</td>
	<td>
<s:submit action="user" value = "unblock" method="unblock" />
</td>  -->
</tr>
<tr>
</table>

<hr>

<table  align="center" id="tab_view"" >
<tr>
	<td><s:label>Pay Slip No.</s:label>
	</td>	<td></td>
	<td><s:textfield readonly="true" name="loginPsno" maxlength="6" ></s:textfield>
</td>
</tr>
<tr>
	<td><s:label>Name</s:label></td>
	<td></td>
	<td><s:textfield name="name" maxlength="30"  ></s:textfield>
	</td>
</tr>
<tr>
	<td><s:label>Email Id</s:label></td>
	<td></td>
	<td><s:textfield name="emailId" maxlength="30" ></s:textfield></td>
</tr>
<tr>
	<td><s:label>Role</s:label></td>
	<td></td>
	<td><s:select list="{'Select','Super Administrator','Administrator','Power User'}" name="role"></s:select>
</tr>
<tr>
	<td><s:label>City</s:label></td>
	<td></td>
	<td><s:textfield   name="city" ></s:textfield>
	<td><input type="text" name="otherCity" id="otherCity" style='display:none;'/></td>
</tr>
<tr>
	<td><s:label>Location</s:label></td>
	<td></td>
	<td><s:textfield   name="location" ></s:textfield></td>
	<td><input type="text" name="otherLocation" id="otherLocation" style='display: none;'></td>
</tr>
<tr>
	<td><s:label>Block</s:label></td>
	<td></td>
	<td><s:textfield name="block"></s:textfield>
	</td>
</tr>

<tr>
	<td><s:label>Address</s:label></td>
	<td></td>
	<td><s:textfield name="address" maxlength="30" ></s:textfield>
</tr>	
<tr>
	<td><s:label>Remarks</s:label></td>
	<td></td>
	<td><s:textfield name="remarks" maxlength="30"></s:textfield></td>
</tr>
<tr></tr><tr></tr><tr>
<td></td><td>
<s:submit value="Update" name="submit" label="Edit User" method="edit" ></s:submit></td>
<td><s:reset name="reset" label="Reset" value="Cancel"></s:reset></td>
</tr>
<s:hidden name="password"/>
<s:hidden name="userid"/>
</table></s:form>



</fieldset>

</body>
</html>


