package me.imvc.app.controllers;

import java.io.Serializable;

import me.imvc.app.entities.Roles;
import me.imvc.app.models.RoleModel;
import me.imvc.core.BaseController;

public class RolesController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private RoleModel roleModel;
	

	public RoleModel getRoleModel() {
		return roleModel;
	}

	public void setRoleModel(RoleModel roleModel) {
		this.roleModel = roleModel;
	}
	public String search(){
		getRoleModel().hdslSearch(Roles.class, getRoleModel().getSearch(), "code","name","remark");
		setModel(getRoleModel().getExcel());
		return render("roles/search");
	}
	@Override
	public String index() {
		getRoleModel().getPageData("Roles");
		setModel(getRoleModel().getExcel());
		return render("roles/index");
	}
	
	@Override
	public String show() {
		return render("roles/show");
	}

	@Override
	public String editNew() {
		return render("roles/editNew");
	}

	@Override
	public String create() {
		if(getRoleModel().save()==(Serializable)0)
			return errorMsg("创建失败");
			return successMsg("创建成功","roles","closeCurrent");
	}
	
	public String disk(){
		return"disk";
	}
	@Override
	public String edit() {
		getRoleModel().get(getId());
		return render("roles/edit");
	}

	@Override
	public String update() {
		if(getId()==1){
			return errorMsg("你无权限修改管理员角色");
		}else{
			getRoleModel().update(getId());
			return successMsg("修改成功","roles","closeCurrent");
		}		
	}

	@Override
	public String destroy() {
		if(getId()==1){
			return errorMsg("你无权限删除管理员角色");
		}else{
			getRoleModel().delete(getId());
			return successMsg("删除成功");
		}
		
	}
	
	public String defaultManagement(){
		return render("roles/default_management");
	}
	
	public String systemManagement(){
		return render("roles/system_management");
	}
	
	public String headOfDepartment(){
		return render("roles/head_of_department");
	}

}
