package me.imvc.app.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import jxl.write.Label;

import me.imvc.app.entities.Authorities;
import me.imvc.app.entities.Roles;
import me.imvc.core.BaseModel;

public class RoleModel extends BaseModel {
	private Roles role;

	public Roles getRole() {
		return role;
	}

	public void setRole(Roles role) {
		this.role = role;
	}

	public List<Label> getExcel() {
		List<Label> labels = new ArrayList<Label>();
		int i = 0;
		for (Object object : getDataList()) {
			Roles role = (Roles) object;
			int k = 0;
			labels.add(new Label(k++, i, role.getName()));
			labels.add(new Label(k++, i, role.getCode()));
			labels.add(new Label(k++, i, role.getRemark()));
			i++;
		}
		return labels;
	}

	public Roles get(Long id) {
		setRole((Roles) get(Roles.class, (Serializable) id));
		return getRole();
	}

	@SuppressWarnings("rawtypes")
	public Serializable save() {
		List role = getHt().find("from Roles where code=? ",
				getRole().getCode());
		if (role.size() != 0)
			return 0;
		return save(getRole());
	}

	public void update(Long id) {
		Roles newRole=getRole();
		Roles loadRole=get(id);
		getEntityUtils().copy(newRole, loadRole, "id");
		update(loadRole);
	};

	public void delete(Long id) {
		if (id == 0) {
			for (Long eid : getIds()) {
				if(eid!=1){
					get(eid);
					for (Authorities authorities : getRole().getAuthoritieses()) {
						delete(authorities);
					}
					delete(getRole());
				}
			}
		} else {
			get(id);
			for (Authorities authorities : getRole().getAuthoritieses()) {
				delete(authorities);
			}
			delete(getRole());
		}

	}

}
