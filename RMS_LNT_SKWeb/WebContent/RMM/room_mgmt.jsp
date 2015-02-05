<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="../css/style.css" media="screen"/>
<title>Insert title here</title>
</head>
<body>
<!-- <ul style=" list-style-type: none;">
<li><img src="images/logo/create_room.PNG" border="0">&nbsp;&nbsp;<a class="tab" href="create_room.jsp" target="_subWindow">Add Room</a></li>
<li><img src="images/logo/house-go-icon.png" border="0">&nbsp;&nbsp;<a class="tab" href="edit_room.jsp" target="_subWindow">Edit Room</a></li>
<li><img src="images/logo/delete_room.PNG" border="0">&nbsp;&nbsp;<a class="tab" href="delete_room.jsp" target="_subWindow">Delete Room</a></li>

</ul>-->
<br>
 <table border="0" align="center">
 <tr>
 <td><img src="../images/logo/1331716680_plus.PNG"></td>
<td> <a class="tab" href="<s:url action="preCreateRoom"/>" target="_subWindow">Add Room</a></td>
</tr>
<tr><tr></tr><tr></tr><tr></tr>
<td><img src="../images/logo/1331716858_pencil2.PNG" border="0"></td>
<td><a class="tab" href="<s:url action="getAllRooms"/>" target="_subWindow">Edit Room</a></td>
</tr><tr></tr><tr></tr><tr></tr>
<tr>
<td><img src="../images/logo/1331716917_delete.PNG" border="0"></td>
<td><a class="tab" href="<s:url action="getAllRooms"/>" target="_subWindow">Delete Room</a></td>
</tr><tr></tr><tr></tr><tr></tr>
 </table>


</body>
</html>