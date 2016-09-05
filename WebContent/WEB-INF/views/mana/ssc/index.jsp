<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" pageNum="sscModel.pageNum" numPerPage="sscModel.numPerPage" 
orderField="sscModel.orderField" orderDirection="sscModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="sscModel.pageNum" value="${sscModel.pageNum}" />
	<input type="hidden" name="sscModel.numPerPage" value="${sscModel.numPerPage}" />
	<input type="hidden" name="sscModel.orderField" value="${sscModel.orderField}" />
	<input type="hidden" name="sscModel.orderDirection" value="${sscModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/mana/ssc!index" method="POST">
	<div class="searchBar">
<%-- ===================修改搜索条件===================== --%>
		<ul class="searchContent" >
			<li>
				<label>号码：</label>
				<input type="text" name="sscModel.searchParams.and_no_like" value="${sscModel.searchParams.and_no_like[0]}"/>
			</li>
			<li style="width: 500px;">
				<label>时间：</label>
				<input name="sscModel.searchParams.and_time_ge_string" type="text" class="date" format="yyyy-MM-dd HH:mm:ss" size="20" value="${sscModel.searchParams.and_time_ge_string[0] }" placeholder="开始时间"/>
				<input name="sscModel.searchParams.and_time_le_string" type="text" class="date" format="yyyy-MM-dd HH:mm:ss" size="20" value="${sscModel.searchParams.and_time_le_string[0] }" placeholder="结束时间"/>
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
	搜索内容：<input type="text" size="30" name="sscModel.search" value="${sscModel.search}"/>
	<input type="hidden"  name="sscModel.searchField" value="title,description,author,content,files"/>
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
		</ul>
	</div>
<%-- ===================修改table显示内容===================== --%>
	<table class="table" layoutH="162">
		<thead>
			<tr>
				<th width="100" orderField="qihao">开奖期号</th>
				<th width="100">开奖号码</th>
				<th width="100" orderField="income">总投注额</th>
				<th width="100" orderField="allwin">盈利</th>
				<th width="100" >赔付</th>
				<th width="80" orderField="rate">盈利百分比</th>
				<th width="150" orderField="time">开奖时间</th>
				<th width="350" >投注时间</th>
				<!-- <th width="50">操作</th> -->
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${sscModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td>${bm.qihao}</td>			   
				<td>${bm.no}</td>			   
				<td style="text-align: right;"><fmt:formatNumber value="${bm.income/100}" pattern="0.00"/></td>			   
				<td style="text-align: right;"><fmt:formatNumber value="${bm.allwin/100}" pattern="0.00"/></td>
				<td style="text-align: right;"><fmt:formatNumber value="${(bm.income-bm.allwin)/100}" pattern="0.00"/></td>
				<td style="text-align: right;"><fmt:formatNumber value="${bm.rate/100}" pattern="0.00"/></td>
				<td><fmt:formatDate value="${bm.time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${bm.stime }" pattern="yyyy-MM-dd HH:mm:ss"/>至<fmt:formatDate value="${bm.etime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<%-- <td>
					<a title="出所" target="dialog" width="800" height="480" href="${webUrl}/ywdj/csdj/${bm.id}/edit" rel="roles_edit" class="btnEdit">出所</a>
				</td> --%>
			</tr>
			</c:forEach>		
		</tbody>
	</table>
	<div class="panelBar">
	<table class="table">
		<thead>
			<tr>
				<th width="100">合计</th>
				<th width="100"></th>
				<th width="100" style="text-align: right;"><fmt:formatNumber value="${sscModel.sum[0]/100}" pattern="0.00"/></th>
				<th width="100" style="text-align: right;"><fmt:formatNumber value="${sscModel.sum[1]/100}" pattern="0.00"/></th>
				<th width="100" style="text-align: right;"><fmt:formatNumber value="${(sscModel.sum[0]-sscModel.sum[1])/100}" pattern="0.00"/></th>
				<th width="80"></th>
				<th width="150"></th>
				<th width="350"></th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	</div>
<%-- ===================修改table显示内容===================== --%>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="${sscModel.numPerPage}">${sscModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${sscModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${sscModel.totalCount}" numPerPage="${sscModel.numPerPage}" pageNumShown="10" currentPage="${sscModel.pageNum}"></div>

	</div>
</div>