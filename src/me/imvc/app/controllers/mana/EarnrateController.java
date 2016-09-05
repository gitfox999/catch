package me.imvc.app.controllers.mana;

import me.imvc.app.models.mana.EarnrateModel;
import me.imvc.core.BaseController;

public class EarnrateController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private EarnrateModel earnrateModel;

	public EarnrateModel getEarnrateModel() {
		return earnrateModel;
	}

	public void setEarnrateModel(EarnrateModel earnrateModel) {
		this.earnrateModel = earnrateModel;
	}

	@Override
	public String index() {
		getEarnrateModel().setOrderField("sort");
		getEarnrateModel().setOrderDirection("asc");
		getEarnrateModel().getPageData("EarnRate");
		return render("earnrate/index");
	}

	@Override
	public String show() {
		getEarnrateModel().get(getId());
		return render("/earnrate/edit");

	}

	@Override
	public String editNew() {
		return render("/earnrate/edit");
	}

	@Override
	public String create() {
		getEarnrateModel().save();
		return successMsg("创建成功","earnrate","closeCurrent");
	}

	@Override
	public String edit() {
		getEarnrateModel().get(getId());
		return render("/earnrate/edit");
	}

	@Override
	public String update() {
		getEarnrateModel().update(getId());
		return successMsg("修改成功","earnrate","closeCurrent");
	}

	@Override
	public String destroy() {
		getEarnrateModel().delete(getId());
		return successMsg("删除成功","earnrate");
	}
}
