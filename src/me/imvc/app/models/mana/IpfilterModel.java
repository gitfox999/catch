package me.imvc.app.models.mana;

import java.io.Serializable;
import java.util.Date;

import me.imvc.app.entities.Ipfilter;
import me.imvc.core.BaseModel;

public class IpfilterModel extends BaseModel {
	private Ipfilter ipfilter;

	public Ipfilter getIpfilter() {
		return ipfilter;
	}

	public void setIpfilter(Ipfilter ipfilter) {
		this.ipfilter = ipfilter;
	}

	public Ipfilter get(Long id) {
		setIpfilter((Ipfilter) get(Ipfilter.class, (Serializable) id));
		return getIpfilter();
	}

	public void save() {
		getIpfilter().setItime(new Date());
		save(getIpfilter());
	}

	public void update(Long id) {
		getIpfilter().setItime(new Date());
		save(getIpfilter());
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
