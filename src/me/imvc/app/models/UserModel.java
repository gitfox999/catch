package me.imvc.app.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jxl.write.Label;

import me.imvc.app.entities.Authorities;
import me.imvc.app.entities.Roles;
import me.imvc.app.entities.UserExtends;
import me.imvc.app.entities.Users;
import me.imvc.core.BaseModel;
import me.imvc.lib.StringToMd5;

public class UserModel extends BaseModel {
	private Users user;

	private UserExtends userExtend;

	public UserExtends getUserExtend() {
		return userExtend;
	}

	public void setUserExtend(UserExtends userExtend) {
		this.userExtend = userExtend;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<Label> getExcel() {
		List<Label> labels = new ArrayList<Label>();
		int i = 0;
		for (Object object : getDataList()) {
			Users user = (Users) object;
			int k = 0;
			labels.add(new Label(k++, i, user.getUsername()));
			if (user.isEnabled()) {
				labels.add(new Label(k++, i, "未锁定"));
			} else {
				labels.add(new Label(k++, i, "已锁定"));
			}
			labels.add(new Label(k++, i, user.getPassword()));
			if (user.getUserExtends() != null) {
				labels.add(new Label(k++, i, user.getUserExtends().getName()));
				labels.add(new Label(k++, i, user.getUserExtends().getSex()));
				labels.add(new Label(k++, i, String.valueOf(user
						.getUserExtends().getAge())));
				labels.add(new Label(k++, i, user.getUserExtends().getTel()));
				labels.add(new Label(k++, i, user.getUserExtends().getMtel()));
				String role = "";
				for (Authorities authoritie : user.getAuthoritieses()) {
					role += authoritie.getRoles().getName() + "|";
				}
				labels.add(new Label(k++, i, role));

			}
			i++;
		}
		return labels;
	}

	public Users get(Long id) {
		setUser((Users) get(Users.class, (Serializable) id));
		return getUser();
	}

	public Roles getRoles(Long id) {
		return (Roles)get(Roles.class, (Serializable) id);
	}

	@SuppressWarnings("rawtypes")
	public Serializable save() {
		List user = getHt().find("from Users where username=? ",
				getUser().getUsername());
		if (user.size() != 0)
			return 0;
		String password = StringToMd5.encode(getUser().getPassword());
		getUser().setPassword(password);
		save(getUserExtend());
		getUser().setUserExtends(getUserExtend());
		Serializable i = save(getUser());

		Set<Roles> roles = new HashSet<Roles>(0);
		if (getIds() != null)
			for (Long eid : getIds()) {
				roles.add((Roles)getRoles(eid));
			}
		for (Roles roles2 : roles) {
			Authorities authorities = new Authorities();
			authorities.setRoles(roles2);
			authorities.setUsers(getUser());
			authorities.setAuthority(roles2.getCode());
			authorities.setUsername(getUser().getUsername());
			i = save(authorities);
		}

		return i;
	}

	public void update(Long id) {
		Users newUser = getUser();
		Users loadUser = get(id);
		UserExtends loaduserExtend = loadUser.getUserExtends();

		getEntityUtils().copy(getUserExtend(), loaduserExtend, "id");
		update(loaduserExtend);
		if (newUser.getPassword().isEmpty()) {
			getEntityUtils().copy(newUser, loadUser, "id", "userExtends",
					"authoritieses", "password");
		} else {
			String password = StringToMd5.encode(newUser.getPassword());
			newUser.setPassword(password);
			getEntityUtils().copy(newUser, loadUser, "id", "userExtends",
					"authoritieses");
		}
		update(loadUser);
		for (Authorities authorities : loadUser.getAuthoritieses()) {
			delete(authorities);
		}

		if (getIds() != null) {
			for (Long ids : getIds()) {
				Roles role = (Roles) getHt().get(Roles.class, ids);
				Authorities authorities = new Authorities();
				authorities.setUsers(loadUser);
				authorities.setRoles(role);
				authorities.setUsername(loadUser.getUsername());
				authorities.setAuthority(role.getCode());
				save(authorities);
			}
		}

	};

	public void delete(Long id) {
		if (id == 0) {
			for (Long eid : getIds()) {
				if(eid!=1){
					get(eid);
					for (Authorities authorities : getUser().getAuthoritieses()) {
						delete(authorities);
					}
					delete(getUser());					
				}
				
			}
		} else {
			get(id);
			for (Authorities authorities : getUser().getAuthoritieses()) {
				delete(authorities);
			}
			delete(getUser());
		}

	}

}
