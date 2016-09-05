<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="pagerForm" pageNum="roleModel.pageNum" numPerPage="roleModel.numPerPage" 
orderField="roleModel.orderField" orderDirection="roleModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="roleModel.pageNum" value="${roleModel.pageNum}" />
	<input type="hidden" name="roleModel.numPerPage" value="${roleModel.numPerPage}" />
	<input type="hidden" name="roleModel.orderField" value="${roleModel.orderField}" />
	<input type="hidden" name="roleModel.orderDirection" value="${roleModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/roles!index" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>角色名：</label>
				<input type="text" name="roleModel.searchParams.name_eq_string" value="${roleModel.searchParams.name_eq_string[0]}"/>
			</li>
			<li>
				<label>角色编码：</label>
				<input type="text" name="roleModel.searchParams.and_code_eq_string" value="${roleModel.searchParams.and_code_eq_string[0]}"/>
			</li>

		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			<!-- 	<li><a class="button fullTextSearch"><span>模糊搜索</span></a></li> -->
			</ul>
		</div>
	</div>
	</form>
	
<form class="fullTextSearchForm" style="display: none;" rel="pagerForm_hidden" onsubmit="return navTabSearch(this);" action="${webUrl}/roles/0/search" method="POST">
	<div class="searchBar" style="text-align: center;">
	<ul class="searchContent">
	搜索内容：<input type="text" size="30" name="roleModel.search" value="${roleModel.search}"/>
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
			<li><a class="add" href="${webUrl}/roles/new" target="dialog" width="800" height="480" rel="roles_new"><span>增加角色</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="roleModel.ids" href="${webUrl}/roles/0?_method=delete" class="delete"><span>批量删除</span></a></li>
			<li><a class="edit" href="${webUrl}/roles/{user_id}/edit" rel="roles_edit" target="dialog" width="800" height="480" warn="请选择一个用户"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="${webUrl}/roles.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
	<table class="table" width="1200" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="roleModel.ids" class="checkboxCtrl"></th>
				<th width="120" orderField="name"   class="asc">角色名称</th>
				<th width="120" orderField="code"  class="asc">角色编码</th>
				<th>权限</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="role" items="${roleModel.dataList}" varStatus="name">
			<tr target="user_id" rel="${role.id}">
				<td><input name="roleModel.ids" value="${role.id}" type="checkbox"></td>
				<td>${role.name}</td>			   
				<td>${role.code}</td>
				<td>${role.remark}</td>
				<td>
					<a title="删除" target="ajaxTodo" href="${webUrl}/roles/${role.id}?_method=DELETE" class="btnDel">删除</a>
					<a title="编辑" target="dialog" width="800" height="480" href="${webUrl}/roles/${role.id}/edit" rel="roles_edit" class="btnEdit">编辑</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="${roleModel.numPerPage}">${roleModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${roleModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${roleModel.totalCount}" numPerPage="${roleModel.numPerPage}" pageNumShown="10" currentPage="${roleModel.pageNum}"></div>

	</div>
</div>