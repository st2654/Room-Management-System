<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="lstList != null">
	<s:select list="lstList" name="location" headerValue="---SELECT---" ></s:select>
</s:if>