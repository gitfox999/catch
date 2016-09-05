<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>系统管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
									
							<li><a href="${webUrl}/roles" target="navTab" rel="roles">角色管理</a>
								<ul>
									<li><a href="${webUrl}/roles/new" target="dialog"  width="800" height="480" rel="roles_new">增加角色</a></li>
									<li><a href="${webUrl}/roles" target="navTab" rel="roles">角色列表</a></li>				
								</ul>
							</li>
							
							<li><a href="${webUrl}/users" target="navTab" rel="users">用户管理</a>
								<ul>
									<li><a href="${webUrl}/users/new" target="dialog"  width="800" height="480" rel="users_new">增加用户</a></li>
									<li><a href="${webUrl}/users" target="navTab" rel="users">用户列表</a></li>
								</ul>
							</li>

							<li><a>系统设置</a>
								<ul>
									<li><a href="javascript:;">基本设置</a>
									<ul>
									<li><a href="javascript:;">页面一</a></li>
									</ul>
									</li>
								</ul>
							</li>
						
						</ul>
					</div>
</div>