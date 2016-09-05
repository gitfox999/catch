<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>模拟报税系统</title>
<link href="${webUrl}/themes/css/login.css" rel="stylesheet" type="text/css" />
<script src="${webUrl}/dwz/js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="${webUrl}/javascripts/dwz.core.js" type="text/javascript"></script>
<script src="${webUrl}/javascripts/login.init.js" type="text/javascript"></script>
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 style="display: none" class="login_logo">
				<a href="#"><img src="${webUrl}/themes/default/images/login_logo.gif" /></a>
			</h1>
			<div class="login_headerContent">
				<div class="navList">
				</div>
				<h2 style="display: none;" class="login_title"><img src="${webUrl}/themes/default/images/login_title.gif" /></h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
				<p>
					<label>用户名：</label> <input type="text" id="j_username"
						name='j_username' size="18" class="login_input" value="admin" />
				</p>
				<p>
					<label>密码：</label> <input type="password" id="j_password"
						name='j_password' size="18" class="login_input" value="admin" />
				</p>
					<p>
						<label>验证码：</label>
						<input class="code" id="j_code" name="j_code" type="text" size="5" />
						<span><img  id="code_img" src="${webUrl}/themes/default/images/header_bg.png" codesrc="${webUrl}/verification_code.jpg" alt="" width="75" height="24" /></span>
					</p>
					<div class="login_bar">
						<input class="sub" id="j_submit" weburl="${webUrl}" type="submit" value=" "  />
					</div>
<div id="error" style="text-align: center; margin-top: 40px; color: red;"></div>
			</div>
			<div class="login_banner"><img src="${webUrl}/themes/default/images/login_banner.jpg" /></div>
			<div class="login_main">
				<ul class="helpList">
				</ul>
				<div class="login_inner"></div>
			</div>
		</div>
		<div id="login_footer">
			 
		</div>
	</div>
</body>
</html>