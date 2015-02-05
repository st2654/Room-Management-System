<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="lstAvailability != null">
	<s:select list="lstAvailability" name="roomName"
		headerValue="---SELECT---"></s:select>
</s:if>