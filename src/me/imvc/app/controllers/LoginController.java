package me.imvc.app.controllers;

import me.imvc.app.entities.Users;
import me.imvc.app.models.UserModel;
import me.imvc.core.BaseController;

public class LoginController extends BaseController {

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
	//默认登陆页面
	@Override
	public String index() {
		return "login/index";
	}
	//登陆窗口
	public String loginDialog(){		
		return render("login/login_dialog");
	}
	//登陆成功
	public String success(){
		String json="{'statusCode':'200','message':'登陆成功','navTabId':'','callbackType':'closeCurrent','forwardUrl':''}";
		getUserModel().setUser((Users)getUserModel().getHt().find("from Users where username="+"'"+getLoginName()+"'").get(0));
		getSession().put("userid", getUserModel().getUser().getId());
		getSession().put("username", getUserModel().getUser().getUserExtends().getName());
		getSession().put("loginname", getUserModel().getUser().getUsername());
		return renderJson(json);
	}
	//退出
	public String logout(){
		return renderJson("{'statusCode':'200','message':'','navTabId':'','callbackType':'closeCurrent','forwardUrl':'"+getWebUrl()+"/login'}");
	}

	@Override
	public String show() {
		// TODO Auto-generated method stub
		return null;
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
}
