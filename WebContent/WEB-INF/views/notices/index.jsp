<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" pageNum="noticeModel.pageNum" numPerPage="noticeModel.numPerPage" 
orderField="noticeModel.orderField" orderDirection="noticeModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="noticeModel.pageNum" value="${noticeModel.pageNum}" />
	<input type="hidden" name="noticeModel.numPerPage" value="${noticeModel.numPerPage}" />
	<input type="hidden" name="noticeModel.orderField" value="${noticeModel.orderField}" />
	<input type="hidden" name="noticeModel.orderDirection" value="${noticeModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/notices!index" method="POST">
	<div class="searchBar">
<%-- ===================修改搜索条件===================== --%>
		<ul class="searchContent">
			<li>
				<label>标题：</label>
				<input type="text" name="noticeModel.searchParams.title_eq_string" value="${noticeModel.searchParams.title_eq_string[0]}"/>
			</li>
			<li>
				<label>发布者：</label>
				<input type="text" name="noticeModel.searchParams.and_author_eq_string" value="${noticeModel.searchParams.and_author_eq_string[0]}"/>
			</li>
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
	搜索内容：<input type="text" size="30" name="noticeModel.search" value="${noticeModel.search}"/>
	<input type="hidden"  name="noticeModel.searchField" value="title,description,author,content,files"/>
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
			<li><a class="add" href="${webUrl}/notices/new" target="dialog" width="860" height="460" rel="notices_new"><span>添加公告</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="noticeModel.ids" href="${webUrl}/notices/0?_method=delete" class="delete"><span>批量删除</span></a></li>
			<li><a class="edit" href="${webUrl}/notices/{data_id}/edit" rel="notices_edit"  target="dialog" width="800" height="480" warn="请选择一个用户"><span>修改</span></a></li>
			<li class="line">line</li>
		<%-- 	<li><a class="icon" href="${webUrl}/notices.xls" target="dwzExport" targetType="navTab" title="是要导出这些记录吗?"><span>导出EXCEL</span></a></li> --%>
		</ul>
	</div>
<%-- ===================修改table显示内容===================== --%>
	<table class="table"  width="1200" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="noticeModel.ids" class="checkboxCtrl"></th>
				<th width="300" orderField="title"   class="asc">标题</th>
				<th width="80" orderField="author"  class="asc">发布者</th>
				<th width="80" orderField="time_begin"  class="asc">开始是时间</th>
				<th width="80" orderField="time_end"  class="asc">结束时间</th>
			<!-- 	<th>附件</th> -->
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="data" items="${noticeModel.dataList}" varStatus="status">
			<tr target="data_id" rel="${data.id}">
				<td><input name="noticeModel.ids" value="${data.id}" type="checkbox"></td>
				<td>${data.title}</td>
				<td>${data.author}</td>				
				<td><fmt:formatDate value="${data.timeBegin}" pattern="yyyy-MM-dd HH:mm:ss" type="both"/></td>
				<td><fmt:formatDate value="${data.timeEnd}" pattern="yyyy-MM-dd HH:mm:ss" type="both"/></td>
				<td>
					<a title="删除" target="ajaxTodo" href="${webUrl}/notices/${data.id}?_method=DELETE" class="btnDel">删除</a>
					<a title="编辑"  target="dialog" width="860" height="460" href="${webUrl}/notices/${data.id}/edit" rel="notices_edit" class="btnEdit">编辑</a>
					<a title="查看"  target="dialog" width="860" height="460" href="${webUrl}/notices/${data.id}" rel="notices_show" class="btnLook">查看</a>
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
				<option value="${noticeModel.numPerPage}">${noticeModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${noticeModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${noticeModel.totalCount}" numPerPage="${noticeModel.numPerPage}" pageNumShown="10" currentPage="${noticeModel.pageNum}"></div>

	</div>
</div>