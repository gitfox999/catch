<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="accordion" fillSpace="sidebar">
	<div class="accordionHeader">
		<h2>
			<span>Folder</span>系统管理
		</h2>
	</div>
	<div class="accordionContent">
		<ul class="tree treeFolder">
                           <li><a href="${webUrl}/notices" target="navTab" rel="notices">公告管理</a>
								<ul>
									<li><a href="${webUrl}/notices/new" target="dialog" width="800" height="480" rel="notices_new">添加公告</a></li>
									<li><a href="${webUrl}/notices" target="navTab" rel="notices">公告列表</a></li>				
								</ul>
							</li>
							<li><a href="${webUrl}/roles" target="navTab" rel="roles">角色管理</a>
								<ul>
									<li><a href="${webUrl}/roles/new" target="navTab" rel="roles_new">增加角色</a></li>
									<li><a href="${webUrl}/roles" target="navTab" rel="roles">角色列表</a></li>				
								</ul>
							</li>
							
							<li><a href="${webUrl}/users" target="navTab" rel="users">用户管理</a>
								<ul>
									<li><a href="${webUrl}/users/new" target="navTab" rel="users_new">增加用户</a></li>
									<li><a href="${webUrl}/users" target="navTab" rel="users">用户列表</a></li>
								</ul>
							</li>

			<li><a>系统设置</a>
				<ul>
					<li><a href="javascript:;">基本设置</a>
						<ul>
							<li><a href="javascript:;">页面一</a></li>
						</ul></li>
				</ul></li>
		</ul>
	</div>

	<div class="accordionHeader">
						<h2><span>Folder</span>使用帮助</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="${webUrl}/help/0/introduction" target="navTab">简介</a></li>
							<li><a href="javascript:;">基础概念</a>
							<ul>
							
							<li><a href="${webUrl}/help/0/mvc"  target="navTab" rel="help">MVC</a></li>
							<li><a href="${webUrl}/help/0/rest"  target="navTab" rel="help">REST</a></li>
							<li><a href="${webUrl}/help/0/orm"  target="navTab" rel="help">ORM</a></li>
							<li><a href="${webUrl}/help/0/activeRecord"  target="navTab" rel="help">ActiveRecord</a></li>
							<li><a href="${webUrl}/help/0/domainModel"  target="navTab" rel="help">领域模型</a></li>
							<li><a href="${webUrl}/help/0/aop"  target="navTab" rel="help">AOP</a></li>
							<li><a href="${webUrl}/help/0/ioc"  target="navTab" rel="help">IOC</a></li>
							
							</ul>
							</li>
							<li><a href="javascript:;">入门</a>
								<ul>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">Hello world</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">控制器</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">模型</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">视图</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">单元测试Junit4</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">Hhsql搜索配置</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">Excel导出</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">Spring Security</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">hibernate Validator</a></li>	
									<li><a href="${webUrl}/help"  target="navTab" rel="help">hibernate Search</a></li>	
									<li><a href="${webUrl}/help"  target="navTab" rel="help">jbpm5</a></li>
									<li><a href="${webUrl}/help"  target="navTab" rel="help">其它</a></li>								
								</ul>
							</li>
							<li><a href="javascript:;">应用实例</a>
							   <ul>
									<li><a href="javascript:;">单表CURD</a></li>
									<li><a href="javascript:;">一对一CURD</a></li>	
									<li><a href="javascript:;">一对多CURD</a></li>	
									<li><a href="javascript:;">多对多CURD</a></li>	
									<li><a href="javascript:;">表格数据CURD</a></li>	
									<li><a href="javascript:;">表格数据分页</a></li>
									<li><a href="javascript:;">表格数据排序</a></li>
									<li><a href="javascript:;">表格数据搜索</a></li>
									<li><a href="javascript:;">表格数据导出</a></li>
								</ul>
							</li>
						</ul>
					</div> 
</div>