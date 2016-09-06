package me.imvc.app.controllers.mana;

import me.imvc.app.models.mana.IplogModel;
import me.imvc.app.models.mana.OrderModel;
import me.imvc.core.BaseController;

public class IplogController extends BaseController {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IplogModel iplogModel;
	
	public IplogModel getIplogModel() {
		return iplogModel;
	}

	public void setIplogModel(IplogModel iplogModel) {
		this.iplogModel = iplogModel;
	}

	@Override
	public String index() {
		if(getIplogModel().getOrderField() == null){
			getIplogModel().setOrderField("itime");
			getIplogModel().setOrderDirection("desc");
		}
		getIplogModel().getPageData("Iplog");
		return render("/iplog/index");
	}

	@Override
	public String show() {
		getIplogModel().get(getId());
		return render("/order/edit");

	}

	@Override
	public String editNew() {
		return render("/order/edit");
	}

	@Override
	public String create() {
		getIplogModel().save();
		return successMsg("创建成功","order","closeCurrent");
	}

	@Override
	public String edit() {
		getIplogModel().get(getId());
		return render("/order/edit");
	}

	@Override
	public String update() {
		getIplogModel().update(getId());
		return successMsg("修改成功","order","closeCurrent");
	}

	@Override
	public String destroy() {
		return successMsg("删除成功");
	}
}
