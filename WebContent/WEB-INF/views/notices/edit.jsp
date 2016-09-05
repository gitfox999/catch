<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="pageContent">
	<form method="post" action="${webUrl}/notices/${noticeModel.notice.id}"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone);">
       <input name="_method" type="hidden" value="put" />
       <input name="noticeModel.notUpdate" type="hidden" value="id,createdAt" />
		<div class="pageFormContent" layoutH="56">
			<div class="unit">
				<dl>
					<dt>标题：</dt>
					<dd>
						<input name="noticeModel.notice.title"
						class="required" type="text" size="30" value="${noticeModel.notice.title}" alt="请输标题" />
					</dd>
				</dl>
				<dl>
					<dt>发布者：</dt>
					<dd>
						<input name="noticeModel.notice.author"
						type="text" size="30" value="${noticeModel.notice.author}" readonly="readonly" />
					</dd>
				</dl>
				
				<p>
				<label>开始时间：</label>
				<input type="text" name="noticeModel.notice.timeBegin"  value="<fmt:formatDate value="${noticeModel.notice.timeBegin}" pattern="yyyy-MM-dd HH:mm:ss" type="both"/>"   class="date" format="yyyy-MM-dd HH:mm:ss" />
				<a class="inputDateButton" href="javascript:;">选择</a>
				</p>
			
				<p>
				<label>结束时间：</label>
				<input type="text" name="noticeModel.notice.timeEnd"   value="<fmt:formatDate value="${noticeModel.notice.timeEnd}" pattern="yyyy-MM-dd HH:mm:ss" type="both"/>"     class="date" format="yyyy-MM-dd HH:mm:ss" />
				<a class="inputDateButton" href="javascript:;">选择</a>
				</p>	
			
			</div>
			
			<div class="unit">
				<dl class="nowrap">
					<dt>内容简介：</dt>
					<dd>
						<textarea rows="2" cols="70" name="noticeModel.notice.content" class="textInput">${noticeModel.notice.content}</textarea>
					</dd>
				</dl>
			</div>

			<%-- <div class="unit">
				<dl class="nowrap">
					<dt>上传文件：</dt>
					<dd>
						<div>
							<div id="fileInput" filefield="noticeModel.files">
							<c:forTokens var="fileinptu" items="${noticeModel.notice.files}" delims=",">						
							<input type="hidden" value="${fileinptu}," name="noticeModel.files" id="${fn:split(fileinptu,':')[0]}">
							</c:forTokens>
							</div>
							
							<div id="fileQueue" class="fileQueue">
							<c:forTokens var="filequeue" items="${noticeModel.notice.files}" delims=",">									
							   <div class="uploadifyQueueItem completed" id="filePost${fn:split(filequeue,':')[0]}" filecode="${fn:split(filequeue,':')[0]}">
							       <div class="cancel">
							           <a href="javascript:jQuery('#filePost').uploadifyCancel('${fn:split(filequeue,':')[0]}')"><img border="0" src="${webUrl}/javascripts/uploadify/cancel.png"></a>
							        </div>
							           <a  href="${webUrl}/files?fileCode=${fn:split(filequeue,':')[0]}" target="download"  title="是要下载这个附件么?"><span class="fileName">${fn:split(filequeue,':')[1]}</span></a>
							    </div>
							</c:forTokens>
							</div>
							
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
					<textarea class="editor" upImgUrl="${webUrl}/files" name="noticeModel.notice.content" rows="10" cols="70">${noticeModel.notice.content}</textarea>
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
