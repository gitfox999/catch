<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" pageNum="iplogModel.pageNum" numPerPage="iplogModel.numPerPage" 
orderField="iplogModel.orderField" orderDirection="iplogModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="iplogModel.pageNum" value="${iplogModel.pageNum}" />
	<input type="hidden" name="iplogModel.numPerPage" value="${iplogModel.numPerPage}" />
	<input type="hidden" name="iplogModel.orderField" value="${iplogModel.orderField}" />
	<input type="hidden" name="iplogModel.orderDirection" value="${iplogModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/mana/iplog!index" method="POST">
	<div class="searchBar">
<%-- ===================修改搜索条件===================== --%>
		<ul class="searchContent">
			<li>
				<label>登陆ip：</label>
				<input type="text" name="iplogModel.searchParams.and_ip_like" value="${iplogModel.searchParams.and_ip_like[0]}"/>
			</li>
			<li style="width: 500px;">
				<label>登陆时间：</label>
				<input name="iplogModel.searchParams.and_itime_ge_string" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${iplogModel.searchParams.and_itime_ge_string[0] }" placeholder="开始时间"/>
				<input name="iplogModel.searchParams.and_itime_le_string" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${iplogModel.searchParams.and_itime_le_string[0] }" placeholder="结束时间"/>
			</li>
			<li>
				<label>登陆地点：</label>
				<input type="text" name="iplogModel.searchParams.and_loca_like" value="${iplogModel.searchParams.and_loca_like[0]}"/>
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
	</form>	
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div>
<%-- ===================修改table显示内容===================== --%>
	<table class="table" layoutH="138">
		<thead>
			<tr>
				<th width="100">ip</th> 
				<th width="200">地址</th>
				<th width="100">浏览器</th>
				<th width="100">浏览器版本</th>
				<th width="100">浏览器插件</th>
				<th width="60">操作系统</th>
				<th width="100">操作系统版本</th>
				<th width="150">登陆时间</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${iplogModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td>${bm.ip}</td>			 
				<td>${bm.loca}</td>	
				<td>${bm.bname}</td>
				<td>${bm.bversion}</td>
				<td>${bm.bplug}</td>	
				<td>${bm.oname}</td>
				<td>${bm.oversion}</td>
				<td><fmt:formatDate value="${bm.itime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>			   
			</tr>
			</c:forEach>		
		</tbody>
	</table>
<%-- ===================修改table显示内容===================== --%>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="${iplogModel.numPerPage}">${iplogModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${iplogModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${iplogModel.totalCount}" numPerPage="${iplogModel.numPerPage}" pageNumShown="10" currentPage="${iplogModel.pageNum}"></div>

	</div>
</div>