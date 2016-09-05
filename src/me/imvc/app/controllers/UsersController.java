package me.imvc.app.controllers;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import me.imvc.app.models.UserModel;
import me.imvc.core.BaseController;
import me.imvc.app.entities.Authorities;
import me.imvc.app.entities.Users;

public class UsersController extends BaseController {

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
	
	public String search(){
		getUserModel().hdslSearch(Users.class, getUserModel().getSearch(), "username");
		setModel(getUserModel().getExcel());
		return render("users/search");
	}
	

	@Override
	public String index() {
		getUserModel().getPageData("Users");
		setModel(getUserModel().getExcel());
		return render("users/index");
	}


	@Override
	public String show() {
		getSession().get("userid").equals(getId());
			return render("users/show");

	}

	@SuppressWarnings("unchecked")
	@Override
	public String editNew() {
		getUserModel().setDataList(getUserModel().getHt().find("from Roles"));
		return render("users/editNew");
	}

	@Override
	public String create() {
		if(getUserModel().save()==(Serializable)0)
		return errorMsg("创建失败");
		return successMsg("创建成功","users","closeCurrent");
	}

	@SuppressWarnings("unchecked")
	@Override
	public String edit() {
		if(getSession().get("userid").toString().equals("1")){
			getUserModel().get(getId());
			getUserModel().setDataList(getUserModel().getHt().find("from Roles"));
			Set<Object> set=new HashSet<Object>();
			for (Object object : getUserModel().getDataList()) {
				set.add(object);
			}
			for (Authorities authorities : getUserModel().getUser().getAuthoritieses()) {
				set.remove(authorities.getRoles());
			}
			getUserModel().setDataSet(set);
			return render("users/edit");
			
		}
		getUserModel().get(getId());
		getUserModel().setDataList(getUserModel().getHt().find("from Roles"));
		Set<Object> set=new HashSet<Object>();
		for (Object object : getUserModel().getDataList()) {
			set.add(object);
		}
		for (Authorities authorities : getUserModel().getUser().getAuthoritieses()) {
			set.remove(authorities.getRoles());
		}
		getUserModel().setDataSet(set);
		return render("users/edit2");
	}

	@Override
	public String update() {
		if(getId()==1){
			return errorMsg("无法修改系统管理员的信息");
		}else{
			getUserModel().update(getId());
			return successMsg("修改成功","users","closeCurrent");
		}
		
	}

	@Override
	public String destroy() {
		if(getId()==1){
			return errorMsg("无法删除系统管理员");
		}else{
			getUserModel().delete(getId());
			return successMsg("删除成功");
		}
		
	}
}
