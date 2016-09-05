package me.imvc.app.models.mana;

import java.io.Serializable;

import me.imvc.app.entities.Ssc;
import me.imvc.core.BaseModel;

public class SscModel extends BaseModel {
	private Ssc ssc;

	public Ssc getSsc() {
		return ssc;
	}

	public void setSsc(Ssc ssc) {
		this.ssc = ssc;
	}

	public Ssc get(Long id) {
		setSsc((Ssc) get(Ssc.class, (Serializable) id));
		return getSsc();
	}

	public void save() {
		save(getSsc());
	}

	public void update(Long id) {
		save(getSsc());
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
