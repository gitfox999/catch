<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="pageContent">
	<form method="post" action="${webUrl}/roles" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>角色名称：</label>
				<input name="roleModel.role.name" class="required"  type="text" size="30" value=""  alt="角色名称"/>
			</p>
			<p>
				<label>角色编码：</label>
				<input name="roleModel.role.code" class="required" type="text" size="30" value="" alt="角色编码"/>
			</p>
			<p>
				<label>权限说明：</label>
				<input name="roleModel.role.remark" type="text" size="30" value=""/>
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
    