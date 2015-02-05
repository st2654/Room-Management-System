<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<s:head theme="ajax"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" media="screen"/>
<title>Insert title here</title>
 <!--<script type="text/javascript">  
function CheckProgram(val)
{  
 var element=document.getElementById('program_type');   
 var element1=document.getElementById('bu_type'); 
<!-- if(val=='Program'||val=='Business Unit')     
element.style.display='block';   
else       
element.style.display='none';  }  

 if(val=='Program')
	 element.disabled=false;
 
 </script>  
-->

</head>
<body>
<fieldset>
<legend><b>Booked History Report</b></legend>
<s:form theme="simple" action="BookedHistoryAction">
<table align="center">
<tr>
<td><s:radio list="{'Weekly','Monthly'}" name="duration" label="duration"/></td><td>&nbsp;</td><td><s:label>Select Date</s:label></td><td><s:datetimepicker type="date" displayFormat="yyyy-MM-dd" name="selectDate" label="Select Date"/></td></tr>
<tr><td colspan="4">&nbsp;</td></tr>

</table>
<table align="center">
<tr><td align="left"><s:label>TYPE</s:label></td><td></td><td></td></tr>
<tr><td><input type="radio" name="reportType" value="Program"></td><td><s:label>Program</s:label></td>
<td><s:select list="{'.NET','JAVA'}" name="programType" />
</td></tr>
<!-- <tr><td colspan="4">&nbsp;</td></tr>
 -->
<tr>
<td><input type="radio" name="reportType" value="BusinessUnit"></td><td><s:label>Business Unit</s:label></td>
<td><s:select list="{'JAVA','DOTNET'}"  name="buType" /></td></tr>

<tr><td colspan="4">&nbsp;</td></tr>
<tr>
<td></td><td><s:submit name="submit" value="Generate Report" action="BookedHistoryAction"/></td><td><s:reset name="reset" value="Cancel"></s:reset></td></tr>
</table>
</s:form>
</fieldset>
</body>
</html>