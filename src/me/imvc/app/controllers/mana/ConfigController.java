package me.imvc.app.controllers.mana;

import me.imvc.app.models.mana.ConfigModel;
import me.imvc.core.BaseController;

public class ConfigController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ConfigModel configModel;

	public ConfigModel getConfigModel() {
		return configModel;
	}

	public void setConfigModel(ConfigModel configModel) {
		this.configModel = configModel;
	}

	@Override
	public String index() {
		getConfigModel().setOrderField("id");
		getConfigModel().setOrderDirection("asc");
		getConfigModel().getPageData("Config");
		return render("config/index");
	}

	@Override
	public String show() {
		getConfigModel().get(getId());
		return render("/config/edit");

	}

	@Override
	public String editNew() {
		return render("/config/edit");
	}

	@Override
	public String create() {
		getConfigModel().save();
		return successMsg("创建成功","config","closeCurrent");
	}

	@Override
	public String edit() {
		getConfigModel().get(getId());
		return render("/config/edit");
	}

	@Override
	public String update() {
		getConfigModel().update(getId());
		return successMsg("修改成功","config","closeCurrent");
	}

	@Override
	public String destroy() {
		getConfigModel().delete(getId());
		return successMsg("删除成功","config");
	}
}
