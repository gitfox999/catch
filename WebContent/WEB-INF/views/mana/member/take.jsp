<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="pageContent">
	<form method="post" id="payForm" action="${webUrl}/mana/member/${id}/dotake" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input name="memberModel.flow.member.id" type="hidden" value="${memberModel.flow.member.id}"/>
			<div class="pageFormContent" layoutH="56">
			<p>
				<label>提现金额：</label>
				<input name="memberModel.flow.money" class="required" type="text" size="30" value="${memberModel.flow.money}"/>
			</p>
			<p>
				<label>出款卡号：</label>
				<input name="memberModel.flow.fromcard" class="required" type="text" size="30" value="${memberModel.flow.fromcard}"/>
			</p>
			<p>
				<label>出款银行：</label>
				<input name="memberModel.flow.frombank" class="required" type="text" size="30" value="${memberModel.flow.frombank}"/>
			</p>
			<p>
				<label>打入卡号：</label>
				<input name="memberModel.flow.tocard" class="required" type="text" size="30" value="${memberModel.flow.tocard}"/>
			</p>
			<p>
				<label>打入银行：</label>
				<input name="memberModel.flow.tobank" class="required" type="text" size="30" value="${memberModel.flow.tobank}"/>
			</p>
			<p>
				<label>备注：</label>
				<input name="memberModel.flow.remark" type="text" size="30" value="${memberModel.flow.remark}"/>
			</p>
			</div>
			<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="doPay()">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
			</div>
			</form>
</div>
<script>
function doPay(){
	alertMsg.confirm("确定要提现吗？", {
		okCall: function(){
			$("#payForm").submit();
		}
	});
}
</script>
    