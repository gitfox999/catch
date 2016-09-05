$(function() {
	//登录提交
	$("#j_submit").click(function() {
		$weburl=$(this).attr("weburl");
		$.post($weburl+"/j_spring_security_check", {
			j_username : $("#j_username").val(),
			j_password : $("#j_password").val(),
			j_code : $("#j_code").val()
		}, function(data) {
				if (data.statusCode == "200") {
					window.location.href = $weburl+"/main/index";
				}else{
					$("#error").text(data.message);
				}
		}, "json");
	});
	//载入登录验证码
	$("#j_code").focus(function(){
		$("#code_img").attr("src",$("#code_img").attr("codesrc")+"?id="+Math.random());
	});
});