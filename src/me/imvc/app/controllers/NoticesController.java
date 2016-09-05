package me.imvc.app.controllers;

import me.imvc.app.models.NoticeModel;
import me.imvc.core.BaseController;

public class NoticesController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6314173296301722790L;
	
	private NoticeModel noticeModel;

	public NoticeModel getNoticeModel() {
		return noticeModel;
	}

	public void setNoticeModel(NoticeModel noticeModel) {
		this.noticeModel = noticeModel;
	}
	
	@Override
	public String index() {
		getNoticeModel().getPageData("Notices");
		//setModel(getNoticeModel().getExcel());
		return render("/notices/index");
	}

	@Override
	public String show() {
		getNoticeModel().get(getId());
		return render("/notices/show");
	}

	@Override
	public String editNew() {
		// TODO Auto-generated method stub
		//getNoticeModel().getNotice().setAuthor((String)getHttpServletRequest().getSession().getAttribute("username"));
		getSession().get("username");
		return render("/notices/editNew");
	}

	@Override
	public String create() {
		System.out.println(getNoticeModel().getNotice().getAuthor());
		System.out.println(getNoticeModel().getNotice().getTimeBegin());
		System.out.println(getNoticeModel().getNotice().getTimeEnd());
		getNoticeModel().save();
		return successMsg("创建成功","notices","closeCurrent");
	}

	@Override
	public String edit() {
		getNoticeModel().get(getId());
		return render("/notices/edit");
	}

	@Override
	public String update() {
		getNoticeModel().update(getId());
		return successMsg("修改成功","notices","closeCurrent");
	}

	@Override
	public String destroy() {
		getNoticeModel().delete(getId());
		return successMsg("删除成功","notices");
	}

}
