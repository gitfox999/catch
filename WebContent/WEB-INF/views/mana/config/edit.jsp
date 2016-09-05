<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
	<form method="post" action="${webUrl}/mana/config<c:if test="${configModel.config.id != null && configModel.config.id != ''}">
			/${configModel.config.id}</c:if>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<c:if test="${configModel.config.id != null && configModel.config.id != ''}">
			<input name="_method" type="hidden" value="put" /></c:if>
			<input name="configModel.config.id" type="hidden" value="${configModel.config.id}"/>
			<div class="pageFormContent" layoutH="56">
			<p>
				<label>名称：</label>
				<input name="configModel.config.name" class="required"  type="text" size="30" value="${configModel.config.name}"/>
			</p>
			<p>
				<label>值：</label>
				<input name="configModel.config.value" class="required" type="text" size="30" value="${configModel.config.value}"/>
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
    