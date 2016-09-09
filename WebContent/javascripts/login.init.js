$(function() {
	//登录提交
	$("#j_submit").click(function() {
		login();
	});
	//载入登录验证码
	$("#j_code").focus(function(){
		$("#code_img").attr("src",$("#code_img").attr("codesrc")+"?id="+Math.random());
	});
	
	$("#j_username").focus();
	$("#j_username").keydown(function(event){
		if(event.keyCode==13){
			var pwd = $("#j_password");
			if($(this).val().length >0 && pwd.val().length >0){
				login();
			}else{
				pwd.focus();
			} 
			return false;
		}	 
	});
	$("#j_password").keydown(function(event){
		if(event.keyCode==13){
			var name = $("#j_username");
			if($(this).val().length >0 && name.val().length >0){
				login();
			}else{
				name.focus();
			} 
			return false;
		}	 
	});
	$("#j_submit").click(login);
});

function login() {
	$weburl=$("#j_submit").attr("weburl");
	$.post($weburl+"/j_spring_security_check", {
		j_username : $("#j_username").val(),
		j_password : $("#j_password").val(),
		_spring_security_remember_me : $("#j_remember").val()
	}, function(data) {
			if (data.statusCode == "200") {
				window.location.href = $weburl+"/system/index";
			}else{
				$("#error").text(data.message);
			}
	}, "json");
}