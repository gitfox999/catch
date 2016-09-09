<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<form method="post" action="${webUrl}/users/${userModel.user.id}"
		class="pageForm required-validate"	onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input name="_method" type="hidden" value="put" />
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>登录名：</label> 
				<input name="userModel.user.username" class="required" minlength="4" type="text" size="30"
					value="${userModel.user.username}" alt="请输入登录名" />
			</p>
			<p>
				<label>密码：</label> 
				<input name="userModel.user.password" type="text" minlength="6" size="30" value=""  />
			</p>

			<p>
				<label>姓名：</label><input name="userModel.userExtend.name" class="required" type="text" size="30"
					value="${userModel.user.userExtends.name}" alt="请输入姓名" />
			</p>
			<p>
				<label>性别：</label>
				<select name="userModel.userExtend.sex">
					<option <c:if test="${userModel.user.userExtends.sex == '男'}">selected</c:if> value="男">男</option>
					<option <c:if test="${userModel.user.userExtends.sex == '女'}">selected</c:if> value="女">女</option>
				</select>
			</p>
			<p>
				<label>联系电话：</label> 
				<input name="userModel.userExtend.mtel" type="text" size="30" value="${userModel.user.userExtends.mtel }"/>
			</p>
			
			<p>
				<label>是否锁定：</label>
				<c:if test="${userModel.user.enabled==true}">
				<input name="userModel.user.enabled" type="radio" value="false" />锁定  
		        <input name="userModel.user.enabled" type="radio" checked="checked" value="true" />启用
				</c:if>
				<c:if test="${userModel.user.enabled==false}">
				<input name="userModel.user.enabled" type="radio" checked="checked" value="false" />锁定    
			    <input name="userModel.user.enabled" type="radio"  value="true" />启用
				</c:if>
			</p>
			

			<p style="width: 760px;">
				<label>角色：</label>
				<c:forEach var="authoritieses"
					items="${userModel.user.authoritieses}">
					<input name="userModel.ids" value="${authoritieses.roles.id}"
						checked="checked" type="checkbox">${authoritieses.roles.name}	
				</c:forEach>
				<c:forEach var="role" items="${userModel.dataSet}"
					varStatus="status">
					<input name="userModel.ids" value="${role.id}" type="checkbox">${role.name}	
				</c:forEach>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>