<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="pageContent">	
	<form method="post" action="${webUrl}/j_spring_security_check" class="pageForm" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>用户名：</label>
				<input type="text" name="j_username" size="30" class="required" value="admin"/>
			</div>
			<div class="unit">
				<label>密码：</label>
				<input type="password" name="j_password" size="30" class="required"  value="admin"/>
			</div>
			<div class="unit">
			    <label>验证码：</label> 
			    <input class="code" type="text" id="j_code"	name="j_code" size="5" /> 
			    <span><img src="${webUrl}/dwz/themes/default/images/header_bg.png" codesrc="${webUrl}/verification_code.jpg" alt=""  id="code_img" width="75" height="22" /></span>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>	
</div>

