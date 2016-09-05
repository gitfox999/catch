package me.imvc.app.controllers;

import me.imvc.core.BaseController;

public class IndexController extends BaseController {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){		
		return redirect("/main/index");
	}

	@Override
	public String index() {	
		return redirect("/main/index");
	}

	@Override
	public String show() {		
		return redirect("/main/index");
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
