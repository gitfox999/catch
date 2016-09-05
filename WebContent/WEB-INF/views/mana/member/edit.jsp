<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="pageContent">
	<form method="post" action="${webUrl}/ywdj/csdj" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input name="csdjModel.ksszyry.id" type="hidden" value="${csdjModel.ksszyry.id}"/>
			<div class="pageFormContent" layoutH="56">
			<p>
				<label>出所日期：</label>
				<input name="csdjModel.ksscsdj.csrq" class="required"  type="text" size="30" value="${csdjModel.ksscsdj.csrq}"/>
			</p>
			<p>
				<label>负责民警警号：</label>
				<input name="csdjModel.ksscsdj.fzmjjh" class="required" type="text" size="30" value="${csdjModel.ksscsdj.fzmjjh}"/>
			</p>
			<p>
				<label>出所说明：</label>
				<input name="csdjModel.ksscsdj.cssm" type="text" size="30" value="${csdjModel.ksscsdj.cssm}"/>
			</p>
			<p>
				<label>姓名：</label>
				<input name="csdjModel.ksscsdj.xm" type="text" size="30" value="${csdjModel.ksscsdj.xm}"/>
			</p>
			<p>
				<label>身份证号：</label>
				<input name="csdjModel.ksscsdj.sfzh" type="text" size="30" value="${csdjModel.ksscsdj.sfzh}"/>
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
    