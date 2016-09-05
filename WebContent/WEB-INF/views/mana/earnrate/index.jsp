<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" pageNum="earnrateModel.pageNum" numPerPage="earnrateModel.numPerPage" 
orderField="earnrateModel.orderField" orderDirection="earnrateModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="earnrateModel.pageNum" value="${earnrateModel.pageNum}" />
	<input type="hidden" name="earnrateModel.numPerPage" value="${earnrateModel.numPerPage}" />
	<input type="hidden" name="earnrateModel.orderField" value="${earnrateModel.orderField}" />
	<input type="hidden" name="earnrateModel.orderDirection" value="${earnrateModel.orderDirection}" />
</form>
<div class="pageHeader" style="display: none;">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/mana/earnrate!index" method="POST">
	<div class="searchBar">
<%-- ===================修改搜索条件===================== --%>
		<ul class="searchContent" style="height: 80px">
		</ul>
<%-- ===================修改搜索条件===================== --%>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			<!-- 	<li><a class="button fullTextSearch"><span>模糊搜索</span></a></li> -->
			</ul>
		</div>
	</div>
	</form>
	
<form class="fullTextSearchForm" style="display: none;" rel="pagerForm_hidden" onsubmit="return navTabSearch(this);" action="${webUrl}/notices!search" method="POST">
<%-- 	<div class="searchBar" style="text-align: center;">
	<ul class="searchContent">
	搜索内容：<input type="text" size="30" name="earnrateModel.search" value="${earnrateModel.search}"/>
	<input type="hidden"  name="earnrateModel.searchField" value="title,description,author,content,files"/>
	</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				<li><a class="button advancedSearch"><span>高级检索</span></a></li>
			</ul>
		</div>
	</div> --%>
	</form>	
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${webUrl}/mana/earnrate/new" target="dialog" width="860" height="460" rel="notices_new"><span>添加</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="earnrateModel.ids" href="${webUrl}/mana/earnrate/0?_method=delete" class="delete"><span>批量删除</span></a></li>
			<li class="line">line</li>
		<%-- 	<li><a class="icon" href="${webUrl}/notices.xls" target="dwzExport" targetType="navTab" title="是要导出这些记录吗?"><span>导出EXCEL</span></a></li> --%>
		</ul>
	</div>
<%-- ===================修改table显示内容===================== --%>
	<table class="table" layoutH="75">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="earnrateModel.ids" class="checkboxCtrl"></th>
				<th width="100">大于(%)</th>
				<th width="100">小于(%)</th>
				<th width="60" orderField="sort" class="asc">优先级</th>
				<th width="150">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${earnrateModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td><input name="earnrateModel.ids" value="${bm.id}" type="checkbox"></td>
				<td>${bm.efrom}</td>			   
				<td>${bm.eend}</td>			   
				<td>${bm.sort}</td>			   
				<td>
					<a title="删除" target="ajaxTodo" href="${webUrl}/mana/earnrate/${bm.id}?_method=DELETE" class="btnDel">删除</a>
					<a title="编辑"  target="dialog" width="860" height="460" href="${webUrl}/mana/earnrate/${bm.id}/edit" rel="notices_edit" class="btnEdit">编辑</a>
				</td>
			</tr>
			</c:forEach>		
		</tbody>
	</table>
<%-- ===================修改table显示内容===================== --%>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="${earnrateModel.numPerPage}">${earnrateModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${earnrateModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${earnrateModel.totalCount}" numPerPage="${earnrateModel.numPerPage}" pageNumShown="10" currentPage="${earnrateModel.pageNum}"></div>

	</div>
</div>