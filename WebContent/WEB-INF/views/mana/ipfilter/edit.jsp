<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
	<form method="post" action="${webUrl}/mana/ipfilter<c:if test="${ipfilterModel.ipfilter.id != null && ipfilterModel.ipfilter.id != ''}">
			/${ipfilterModel.ipfilter.id}</c:if>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<c:if test="${ipfilterModel.ipfilter.id != null && ipfilterModel.ipfilter.id != ''}">
			<input name="_method" type="hidden" value="put" /></c:if>
			<input name="ipfilterModel.ipfilter.id" type="hidden" value="${ipfilterModel.ipfilter.id}"/>
			<div class="pageFormContent" layoutH="56">
			<p>
				<label>ip：</label>
				<input name="ipfilterModel.ipfilter.ip" class="required"  type="text" size="30" value="${ipfilterModel.ipfilter.ip}"/>
			</p>
			<p>
				<label>备注：</label>
				<input name="ipfilterModel.ipfilter.remark" class="required" type="text" size="30" value="${ipfilterModel.ipfilter.remark}"/>
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
    