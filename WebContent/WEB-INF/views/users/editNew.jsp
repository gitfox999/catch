<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
	<form method="post" action="${webUrl}/users" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input name="userModel.user.enabled" type="hidden" value="true"/>
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>登录名：</label>
				<input name="userModel.user.username"   minlength=""  class="required"  type="text" size="30" value=""  alt="请输入登录名"/>
			</p>
			<p>
				<label>密码：</label>
				<input name="userModel.user.password" minlength="6" class="required" type="password" size="30" value=""/>
			</p>
			<p>
				<label>姓名：</label>
				<input name="userModel.userExtend.name" class="required" type="text" size="30" value="" alt="请输入姓名"/>
			</p>
			<p>
				<label>性别：</label>
				<select name="userModel.userExtend.sex">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</p>
			<p>
				<label>联系电话：</label>
				<input name="userModel.userExtend.mtel"  type="text" size="30" value="" alt=""/>
			</p>	
		    <p style="width: 760px;">
				<label>角色：</label>
				<c:forEach var="role" items="${userModel.dataList}">
					<input name="userModel.ids" value="${role.id}" checked="checked" onclick="showTeacher(this)" type="checkbox">${role.name}
				</c:forEach>
					
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
