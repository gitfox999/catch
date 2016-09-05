package me.imvc.app.models.mana;

import java.io.Serializable;
import me.imvc.app.entities.Sscorder;
import me.imvc.core.BaseModel;

public class OrderModel extends BaseModel {
	private Sscorder sscorder;

	public Sscorder getSscorder() {
		return sscorder;
	}

	public void setSscorder(Sscorder sscorder) {
		this.sscorder = sscorder;
	}

	public Sscorder get(Long id) {
		setSscorder((Sscorder) get(Sscorder.class, (Serializable) id));
		return getSscorder();
	}

	public void save() {
		save(getSscorder());
	}

	public void update(Long id) {
		save(getSscorder());
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
