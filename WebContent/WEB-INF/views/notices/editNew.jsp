<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<form method="post" action="${webUrl}/notices"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone);">

		<div class="pageFormContent" layoutH="56">
			<div class="unit">
				<dl>
					<dt>标题：</dt>
					<dd>
						<input name="noticeModel.notice.title"
						class="required" type="text" size="30" value="" alt="请输标题" />
					</dd>
				</dl>
				<dl>
					<dt>发布者：</dt>
					<dd>
						<input name="noticeModel.notice.author"
						type="text" size="30" value="${username }" readonly="readonly"/>
					</dd>
				</dl>
<p>
				<label>开始时间：</label>
				<input type="text" name="noticeModel.notice.timeBegin" value="" class="date" format="yyyy-MM-dd HH:mm:ss" readonly="true"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
				</p>
			
				<p>
				<label>结束时间：</label>
				<input type="text" name="noticeModel.notice.timeEnd" value="" class="date" format="yyyy-MM-dd HH:mm:ss" readonly="true"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
				</p>

			</div>
			
			<div class="unit">
				<dl class="nowrap">
					<dt>内容简介：</dt>
					<dd>
						<textarea rows="2" cols="70" name="noticeModel.notice.content" class="textInput"></textarea>
					</dd>
				</dl>
			</div>

		<%-- 	<div class="unit">
				<dl class="nowrap">
					<dt>上传文件：</dt>
					<dd>
						<div>
							<div id="fileInput" filefield="noticeModel.files"></div>
							<div id="fileQueue" class="fileQueue"></div>
							
							<input id="filePost" type="file" name="image"
								script="${webUrl}/files" fileDataName="fileData"
								onAllComplete="uploadifyAllComplete" />
						</div>
					</dd>
				</dl>
			</div> --%>

			<%-- <div class="unit">
				<dl class="nowrap">
					<dt>内容：</dt>
					<dd>

					<textarea class="editor" upImgUrl="${webUrl}/files" name="noticeModel.notice.content" rows="10" cols="70"></textarea>

					</dd>
				</dl>
			</div> --%>

		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>
