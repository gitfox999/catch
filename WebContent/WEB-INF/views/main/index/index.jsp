<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>模拟报税系统</title>
<!-- 避免浏览器缓存  正式部署时要去掉  -->
<% String time="?"+String.valueOf(System.currentTimeMillis()); request.setAttribute("time", time);%>
<link href="${webUrl}/themes/default/style.css${time}" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${webUrl}/themes/css/core.css${time}" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${webUrl}/themes/css/print.css${time}" rel="stylesheet"
	type="text/css" media="print" />
<link href="${webUrl}/javascripts/uploadify/css/uploadify.css${time}"
	rel="stylesheet" type="text/css" media="screen" />
<!--[if IE]>
<link href="${webUrl}/themes/css/ieHack.css${time}" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<script src="${webUrl}/dwz/js/speedup.js${time}" type="text/javascript"></script>
<script src="${webUrl}/dwz/js/jquery-1.7.1.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/jquery.cookie.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/jquery.validate.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/jquery.bgiframe.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/xheditor/xheditor-1.1.12-zh-cn.min.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script
	src="${webUrl}/javascripts/uploadify/scripts/swfobject.js${time}"
	type="text/javascript"></script>
<script
	src="${webUrl}/javascripts/uploadify/scripts/jquery.uploadify.v2.1.4.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/javascripts/dwz.core.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/dwz/js/dwz.util.date.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.validate.method.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.regional.zh.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.barDrag.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.drag.js${time}" type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.tree.js${time}" type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.accordion.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/javascripts/dwz.ui.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/javascripts/dwz.theme.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/dwz/js/dwz.switchEnv.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.alertMsg.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.contextmenu.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/javascripts/dwz.navTab.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/dwz/js/dwz.tab.js${time}" type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.resize.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.dialog.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.dialogDrag.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.sortDrag.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.cssTable.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.stable.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.taskBar.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/javascripts/dwz.ajax.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/dwz/js/dwz.pagination.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.database.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.datepicker.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.effects.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.panel.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.checkbox.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.history.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/javascripts/dwz.combox.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script src="${webUrl}/dwz/js/dwz.print.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/dwz/js/dwz.regional.zh.js${time}"
	type="text/javascript"></script>
<!--修改-->
<script type="text/javascript">
var $weburl="${webUrl}";
</script>
<script src="${webUrl}/javascripts/main.init.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/javascripts/public.function.js${time}"
	type="text/javascript"></script>
<script src="${webUrl}/javascripts/jquery.timers.js${time}"
	type="text/javascript"></script>
<!--修改-->
</head>

<body scroll="no">
	<div id="layout">
		<!-- ==========header begin========== -->
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="#">标志</a>
				<ul class="nav" style="display: none">
					<li style="display: none" id="switchEnvBox"><a href="javascript:">（<span>全部</span>）切换角色
					</a>
						<ul>
							<li><a href="${webUrl}/roles/0/defaultManagement">全部</a></li>
							<li><a href="${webUrl}/roles/0/systemManagement">系统管理员</a></li>
							<li><a href="${webUrl}/roles/0/headOfDepartment">部门主任</a></li>
						</ul></li>
					<li style="background: none;"><a height="400" class="_username">您好：&nbsp;&nbsp;<font color="red" size="+2">${username }</font></a></li>
					<!-- style="display: none" -->
					<li ><a href="${webUrl}/users/${session.userid}/edit" target="dialog" width="800" height="400"  >修改密码</a></li>
					<li><a href="${webUrl}/j_spring_security_logout"
						callback="redirect" target="ajaxTodo" title="确定要退出吗?">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!--<li theme="red"><div>红色</div></li>-->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
			<!-- navMenu -->
		</div>
		<!-- ==========header end========== -->
		<!-- ==========leftside begin========== -->
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>主菜单</h2>
					<div>收缩</div>
				</div>
				<!-- ==========Accordion组件 begin========== -->
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>信息管理
						</h2>
					</div>

					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li>
								<a>登陆管理</a>
								<ul>
									<li><a href="${webUrl}/mana/iplog" target="navTab" rel="iplog">登陆列表</a></li>
									<li><a href="${webUrl}/mana/ipfilter" target="navTab" rel="ipfilter">ip过滤</a></li>
								</ul>
							</li>
						</ul>
					</div>


				</div>
				<!-- ==========Accordion组件 end========== -->
			</div>
		</div>
		<!-- ==========leftside end========== -->
		<!-- ==========container begin========== -->
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
					</div>
				</div>
			</div>
		</div>
		<!-- ==========container end========== -->
	</div>
	<div id="footer"> </div>
</body>
</html>