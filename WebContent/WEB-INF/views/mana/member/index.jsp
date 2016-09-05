<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" pageNum="memberModel.pageNum" numPerPage="memberModel.numPerPage" 
orderField="memberModel.orderField" orderDirection="memberModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="memberModel.pageNum" value="${memberModel.pageNum}" />
	<input type="hidden" name="memberModel.numPerPage" value="${memberModel.numPerPage}" />
	<input type="hidden" name="memberModel.orderField" value="${memberModel.orderField}" />
	<input type="hidden" name="memberModel.orderDirection" value="${memberModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/mana/member!index" method="POST">
	<div class="searchBar">
<%-- ===================修改搜索条件===================== --%>
		<ul class="searchContent" style="height: 80px">
			<li>
				<label>用户名：</label>
				<input type="text" name="memberModel.searchParams.name_like" value="${memberModel.searchParams.name_like[0]}"/>
			</li>
			<li>
				<label>实名：</label>
				<input type="text" name="memberModel.searchParams.and_trueName_like" value="${memberModel.searchParams.and_trueName_like[0]}"/>
			</li>
			<li>
				<label>电话：</label>
				<input type="text" name="memberModel.searchParams.and_tel_like" value="${memberModel.searchParams.and_tel_like[0]}"/>
			</li>
			<li>
				<label>卡号：</label>
				<input type="text" name="memberModel.searchParams.and_card_like" value="${memberModel.searchParams.and_card_like[0]}"/>
			</li>
			<li style="width: 500px;">
				<label>注册时间：</label>
				<input name="memberModel.searchParams.and_addTs_ge_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${memberModel.searchParams._and_addTs_ge_date[0] }" placeholder="开始时间"/>
				<input name="memberModel.searchParams.and_addTs_le_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${memberModel.searchParams._and_addTs_le_date[0] }" placeholder="结束时间"/>
			</li>
			<li style="width: 500px;">
				<label>余额：</label>
				<input name="memberModel.searchParams.and_money_ge" type="text" value="<c:if test="${memberModel.searchParams.and_money_ge[0] != null && memberModel.searchParams.and_money_ge[0] != ''}">${memberModel.searchParams.and_money_ge[0]/100 }</c:if>" placeholder="大于"/>
				<input name="memberModel.searchParams.and_money_le" type="text" value="<c:if test="${memberModel.searchParams.and_money_le[0] != null && memberModel.searchParams.and_money_le[0] != ''}">${memberModel.searchParams.and_money_le[0]/100 }</c:if>" placeholder="小于"/>
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
	搜索内容：<input type="text" size="30" name="memberModel.search" value="${memberModel.search}"/>
	<input type="hidden"  name="memberModel.searchField" value="title,description,author,content,files"/>
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
	<table class="table" layoutH="190">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="memberModel.ids" class="checkboxCtrl"></th>
				<th width="100">会员名称</th>
				<th width="150">电话</th>
				<th width="200">银行卡号</th>
				<th width="150">开户行</th>
				<th width="100">实名</th>
				<th width="100" orderField="money">余额</th>
				<th width="150" orderField="addTs">注册时间</th>
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${memberModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td><input name="memberModel.ids" value="${bm.id}" type="checkbox"></td>
				<td>${bm.name}</td>			   
				<td>${bm.tel}</td>			   
				<td>${bm.card}</td>			   
				<td>${bm.bank}</td>
				<td>${bm.trueName}</td>
				<td><fmt:formatNumber value="${bm.money/100}" pattern="0.00"/></td>
				<td>${bm.addTs}</td>
				<td>
					<a title="${bm.name}---充值" target="dialog" width="800" height="480" href="${webUrl}/mana/member/${bm.id}/topay" rel="pay_edit">充值</a>
					<a title="${bm.name}---提值" target="dialog" width="800" height="480" href="${webUrl}/mana/member/${bm.id}/totake" rel="take_edit">提现</a>
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
				<option value="${memberModel.numPerPage}">${memberModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${memberModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${memberModel.totalCount}" numPerPage="${memberModel.numPerPage}" pageNumShown="10" currentPage="${memberModel.pageNum}"></div>

	</div>
</div>