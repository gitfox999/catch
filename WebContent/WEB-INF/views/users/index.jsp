<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="pagerForm" pageNum="userModel.pageNum" numPerPage="userModel.numPerPage" 
orderField="userModel.orderField" orderDirection="userModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="userModel.pageNum" value="${userModel.pageNum}" />
	<input type="hidden" name="userModel.numPerPage" value="${userModel.numPerPage}" />
	<input type="hidden" name="userModel.orderField" value="${userModel.orderField}" />
	<input type="hidden" name="userModel.orderDirection" value="${userModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/users!index" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>登录名：</label>
				<input type="text" name="userModel.searchParams.username_eq_string" value="${userModel.searchParams.username_eq_string[0]}"/>
			</li>
			<li>
				<label>姓名：</label>
				<input type="text" name="userModel.searchParams.and_userExtends_dot_name_eq_string" value="${userModel.searchParams.and_userExtends_dot_name_eq_string[0]}"/>
			</li>
			<li>
			<label>是否禁用：</label>
			<select class="combox" name="userModel.searchParams.and_enabled_eq">
			    <option  value="${userModel.searchParams.and_enabled_eq[0]}"></option>
			    <option  value="">全部</option>
				<option  value="1">未禁用</option>
				<option  value="0">已禁用</option> 
			</select>
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				<!-- <li><a class="button fullTextSearch"><span>模糊搜索</span></a></li> -->
			</ul>
		</div>
	</div>
	</form>
	
<form class="fullTextSearchForm" style="display: none;" rel="pagerForm_hidden" onsubmit="return navTabSearch(this);" action="${webUrl}/users/0/search" method="POST">
	<div class="searchBar" style="text-align: center;">
	<ul class="searchContent">
	搜索内容：<input type="text" size="30" name="userModel.search" value="${userModel.search}"/>
	</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				<li><a class="button advancedSearch"><span>高级检索</span></a></li>
			</ul>
		</div>
	</div>
	</form>	
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${webUrl}/users/new" target="dialog" width="800" height="480" rel="users_new"><span>增加用户</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="userModel.ids" href="${webUrl}/users/0?_method=delete" class="delete"><span>批量删除</span></a></li>
			<li><a class="edit" href="${webUrl}/users/{user_id}/edit" rel="users_edit"  target="dialog" width="800" height="480" warn="请选择一个用户"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="${webUrl}/users.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
	<table class="table"  width="1200" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="userModel.ids" class="checkboxCtrl"></th>
				<th width="120" orderField="username"   class="asc">登录名</th>
				<th width="80" orderField="enabled"  class="asc">是否锁定</th>
				<th width="40">姓名</th>
				<th width="40">性别</th>
				<th width="100">手机</th>				
				<th>角色</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="user" items="${userModel.dataList}" varStatus="name">
			<tr target="user_id" rel="${user.id}">
				<td><input name="userModel.ids" value="${user.id}" type="checkbox"></td>
				<td>${user.username}</td>
			   <td>
				<c:choose>
				<c:when test="${user.enabled==true}">
				未锁定
				</c:when>
				 <c:when test="${user.enabled==false}">
				 已锁定
				 </c:when>
				</c:choose>
				</td>
				<td>${user.userExtends.name}</td>
				<td>${user.userExtends.sex}</td>
				<td>${user.userExtends.mtel}</td>
				<td>
				<c:forEach var="authoritieses" items="${user.authoritieses}">
				${authoritieses.roles.name}|
				</c:forEach>
				</td>
				<td>
					<a title="删除" target="ajaxTodo" href="${webUrl}/users/${user.id}?_method=DELETE" class="btnDel">删除</a>
					<a title="编辑"  target="dialog" width="800" height="480" href="${webUrl}/users/${user.id}/edit" rel="users_edit" class="btnEdit">编辑</a>
				</td>
			</tr>
				<c:set var="num" value="${num+1 }" scope="page"></c:set>
			</c:forEach>
			<c:if test="${num==1 }">
				<tr>
					<td align="center" colspan="20"><font color="red" size="30">未找到符合条件的信息！</font>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="${userModel.numPerPage}">${userModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${userModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${userModel.totalCount}" numPerPage="${userModel.numPerPage}" pageNumShown="10" currentPage="${userModel.pageNum}"></div>

	</div>
</div>