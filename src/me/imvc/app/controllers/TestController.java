package me.imvc.app.controllers;


import me.imvc.app.models.TestModel;
import me.imvc.core.BaseController;

public class TestController extends BaseController {
	
	private TestModel testModel;
	




	public TestModel getTestModel() {
		return testModel;
	}

	public void setTestModel(TestModel testModel) {
		this.testModel = testModel;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String index() {
		System.out.println(getTestModel());
		getTestModel().aaa();
		return null;
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
