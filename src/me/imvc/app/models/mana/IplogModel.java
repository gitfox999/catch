package me.imvc.app.models.mana;

import java.io.Serializable;

import me.imvc.app.entities.Iplog;
import me.imvc.core.BaseModel;

public class IplogModel extends BaseModel {
	private Iplog iplog;

	public Iplog getIplog() {
		return iplog;
	}

	public void setIplog(Iplog iplog) {
		this.iplog = iplog;
	}

	public Iplog get(Long id) {
		setIplog((Iplog) get(Iplog.class, (Serializable) id));
		return getIplog();
	}

	public void save() {
		save(getIplog());
	}

	public void update(Long id) {
		save(getIplog());
	};

	public void delete(Long id) {
		if (id == 0) {
			for (Long nid : getIds()) {
				delete(get(nid));
			}
		}else{
			delete(get(id));
		}
	}

}
