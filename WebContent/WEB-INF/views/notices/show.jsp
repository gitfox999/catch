<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="56">
		<div class="unit">
				<p><label>标题：</label><span>${noticeModel.notice.title}</span></p>
				<p><label>发布者：</label><span>${noticeModel.notice.author}</span></p>
		</div>
		<div class="divider"></div>
		<%-- <div class="unit">
			<dl class="nowrap">
				<dt>内容简介：</dt>
				<dd>
					<pre>${noticeModel.notice.description}</pre>
				</dd>
			</dl>
		</div> --%>
<%-- 		<div class="divider"></div>
		<div class="unit">
			<dl class="nowrap">
				<dt>附件：</dt>
				<dd>
						<div id="fileQueue" class="fileQueue">
							<c:forTokens var="filequeue" items="${noticeModel.notice.files}" delims=",">
								<div class="uploadifyQueueItem completed"
									id="filePost${fn:split(filequeue,':')[0]}"
									filecode="${fn:split(filequeue,':')[0]}">
									
									<a	href="${webUrl}/files?fileCode=${fn:split(filequeue,':')[0]}"
										target="download" title="是要下载这个附件么?"><spanclass="fileName">${fn:split(filequeue,':')[1]}</span></a>
								</div>
							</c:forTokens>
						</div>
					</div>
				</dd>
			</dl>
		</div> --%>
		<div class="divider"></div>
		<div class="unit">
			<dl class="nowrap">
				<dt>内容：</dt>
				<dd>
					<div>${noticeModel.notice.content}</div>
				</dd>
			</dl>
		</div>
	</div>
</div>
