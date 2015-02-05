<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sx:head />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css" media="screen" />
<title>Insert title here</title>
<script type="text/javascript">
	function CheckCity(val) {
		var element = document.getElementById('other_city');
		if (val == '---------Others----------')
			element.style.display = 'block';
		else
			element.style.display = 'none';
	}
	function CheckLocation(val) {
		var element = document.getElementById('other_location');
		if (val == '---------Others----------')
			element.style.display = 'block';
		else
			element.style.display = 'none';
	}
	function show_details(val) {
		dojo.event.topic.publish("show_detail");
		var element = document.getElementById('other_city');
		var element1 = document.getElementById('other_location');
		if (val == 'Other') {
			element.style.display= 'block';
			element1.style.display = 'block';
		} else {
			element.style.display = 'none';
			element1.style.display = 'none';
		}
	}
</script>

</head>

<body>
	<fieldset>
		<legend>
			<b>Add User</b>
		</legend>

		<s:form id="create_user" name="create_user" theme="simple"
			action="user">
			<table align="center">
				<tr>
					<td><s:label>Pay Slip No.</s:label>
					</td>
					<td>&nbsp;</td>
					<td><s:textfield maxlength="6" name="loginPsno"
							value="e.g:299552" onclick="this.value=''"
							onblur="if(this.value==''){this.value='e.g:299552'}"></s:textfield>
					</td>
				</tr>
				<tr>
					<td><s:label>Name</s:label>
					</td>
					<td></td>
					<td><s:textfield maxlength="30" name="name"
							value="e.g: GAURAV SAHU" onclick="this.value=''"
							onblur="if(this.value==''){this.value='e.g:GAURAV SAHU'}"></s:textfield>
					</td>
				</tr>
				<tr>
					<td><s:label>Email Id</s:label>
					</td>
					<td></td>
					<td><s:textfield maxlength="30" name="emailId"
							value="e.g: abc@xyz.com" onclick="this.value=''"
							onblur="if(this.value==''){this.value='e.g: abc@xyz.com'}"></s:textfield>
					</td>
				</tr>
				<tr>
					<td><s:label>Role</s:label>
					</td>
					<td></td>
					<td><s:select
							list="{'Select','Super Administrator','Administrator','Power User'}"
							name="role" label="Role" />
					</td>
				</tr>
				<tr>
					<td><s:label>City</s:label>
					</td>
					<td></td>
					<td><s:select list="lstList1" name="city"
							headerValue="---Select---" headerKey="-1"
							onchange="javascript:show_details(this.value);return false;" /></td><td><input type="text" maxlength="20" name="otherCity"
						id="other_city" style="display: none" /></td>
					
				</tr>
				<tr>
					<td><s:label>Location</s:label>
					</td>
					<td></td>
					<td><s:url id="d_url" action="DetailAction" /> <sx:div
							id="details" href="%{d_url}" listenTopics="show_detail"
							formId="create_user" showLoadingText=""></sx:div></td><td><input type="text" maxlength="20" name="otherLocation"
						id="other_location" style="display: none"  /></td>
					
				</tr>

				<tr>
					<td><s:label>Block</s:label>
					</td>
					<td></td>
					<td><s:textfield name="block" />&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td><s:label>Address</s:label>
					</td>
					<td></td>
					<td><s:textfield name="address"></s:textfield>
					</td>
				</tr>
				<tr>
				
				
				
				
				</tr>
				<tr>
				
				
				
				</tr>




				<tr>
					<td></td>
					<td><s:submit value="SAVE"></s:submit>
					</td>
					<td><s:reset value="RESET"></s:reset>
					</td>
				</tr>

			</table>

		</s:form>
	</fieldset>



</body>
</html>