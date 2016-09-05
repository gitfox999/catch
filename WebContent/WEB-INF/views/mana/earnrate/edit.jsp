<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
	<form method="post" action="${webUrl}/mana/earnrate<c:if test="${earnrateModel.earnRate.id != null && earnrateModel.earnRate.id != ''}">
			/${earnrateModel.earnRate.id}</c:if>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<c:if test="${earnrateModel.earnRate.id != null && earnrateModel.earnRate.id != ''}">
			<input name="_method" type="hidden" value="put" /></c:if>
			<input name="earnrateModel.earnRate.id" type="hidden" value="${earnrateModel.earnRate.id}"/>
			<div class="pageFormContent" layoutH="56">
			<p>
				<label>大于(%)：</label>
				<input name="earnrateModel.earnRate.efrom" class="required"  type="text" size="30" value="${earnrateModel.earnRate.efrom}"/>
			</p>
			<p>
				<label>小于(%)：</label>
				<input name="earnrateModel.earnRate.eend" class="required" type="text" size="30" value="${earnrateModel.earnRate.eend}"/>
			</p>
			<p>
				<label>优先级：</label>
				<input name="earnrateModel.earnRate.sort" class="required" type="text" size="30" value="${earnrateModel.earnRate.sort}"/>
			</p>
			</div>
			<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
			</div>
			</form>
</div>
    