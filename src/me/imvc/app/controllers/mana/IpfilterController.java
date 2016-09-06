package me.imvc.app.controllers.mana;

import me.imvc.app.models.mana.IpfilterModel;
import me.imvc.core.BaseController;

public class IpfilterController extends BaseController {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IpfilterModel ipfilterModel;
	
	public IpfilterModel getIpfilterModel() {
		return ipfilterModel;
	}

	public void setIpfilterModel(IpfilterModel ipfilterModel) {
		this.ipfilterModel = ipfilterModel;
	}

	@Override
	public String index() {
		if(getIpfilterModel().getOrderField() == null){
			getIpfilterModel().setOrderField("itime");
			getIpfilterModel().setOrderDirection("desc");
		}
		getIpfilterModel().getPageData("Ipfilter");
		return render("/ipfilter/index");
	}

	@Override
	public String show() {
		getIpfilterModel().get(getId());
		return render("/ipfilter/edit");

	}

	@Override
	public String editNew() {
		return render("/ipfilter/edit");
	}

	@Override
	public String create() {
		getIpfilterModel().save();
		return successMsg("创建成功","ipfilter","closeCurrent");
	}

	@Override
	public String edit() {
		getIpfilterModel().get(getId());
		return render("/ipfilter/edit");
	}

	@Override
	public String update() {
		getIpfilterModel().update(getId());
		return successMsg("修改成功","ipfilter","closeCurrent");
	}

	@Override
	public String destroy() {
		getIpfilterModel().delete(getId());
		return successMsg("删除成功");
	}
}
