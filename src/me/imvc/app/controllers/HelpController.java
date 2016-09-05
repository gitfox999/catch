package me.imvc.app.controllers;

import me.imvc.core.BaseController;

public class HelpController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String introduction(){
		
		return "/help/introduction";
	}
	public String mvc() {
		// TODO Auto-generated method stub
		return "/help/mvc";
	}
	public String rest() {
		// TODO Auto-generated method stub
		return "/help/rest";
	}
	public String orm() {
		// TODO Auto-generated method stub
		return "/help/orm";
	}
	public String activeRecord() {
		// TODO Auto-generated method stub
		return "/help/activeRecord";
	}
	public String domainModel() {
		// TODO Auto-generated method stub
		return "/help/domainModel";
	}
	public String aop() {
		// TODO Auto-generated method stub
		return "/help/aop";
	}
	public String ioc() {
		// TODO Auto-generated method stub
		return "/help/ioc";
	}

	@Override
	public String index() {
		// TODO Auto-generated method stub
		return "/help/index";
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
