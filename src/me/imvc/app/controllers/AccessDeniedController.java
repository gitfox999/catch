package me.imvc.app.controllers;

import me.imvc.core.BaseController;

public class AccessDeniedController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//没有访问权限
	@Override
	public String index() {
		return renderJson("{'statusCode':'300','message':'你无权限访问','navTabId':'','callbackType':'','forwardUrl':''}");
	}
	//登陆失败登录名或密码错误
	public String loginError(){
		return renderJson("{'statusCode':'300','message':'登录名或密码错误','navTabId':'','callbackType':'','forwardUrl':''}");
	}
	//验证码错误
	public String VerificationCodeError(){
		return renderJson("{'statusCode':'300','message':'验证码失败','navTabId':'','callbackType':'','forwardUrl':''}");
		
	}

	@Override
	public String show() {
		return null;
	}

	@Override
	public String editNew() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create() {
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
