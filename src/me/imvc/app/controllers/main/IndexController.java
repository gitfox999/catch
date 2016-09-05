package me.imvc.app.controllers.main;

import me.imvc.app.models.UserModel;
import me.imvc.core.BaseController;


public class IndexController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserModel userModel;
	
	
	public UserModel getUserModel() {
		return userModel;
	}

	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	@Override
	public String index() {
	
		return "index/index";
	}

	@Override
	public String show() {
		getUserModel().createIndexer();
		return "index/show";
	}

	@Override
	public String editNew() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String edit() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String destroy() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
