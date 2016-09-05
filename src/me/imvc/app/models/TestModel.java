package me.imvc.app.models;

import java.util.Map;

public class TestModel {
	
	private Map<String, Object> params;
	
	public String aaa(){
		System.out.println("==========aaa==========");
		String[] str_a=(String[])params.get("abc");
		System.out.println(str_a[0].isEmpty());

		return "";
	}

	public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}


}
