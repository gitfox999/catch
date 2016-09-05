package me.imvc.app.models.mana;

import java.io.Serializable;

import me.imvc.app.entities.Flow;
import me.imvc.core.BaseModel;

public class FlowModel extends BaseModel {
	private Flow flow;

	public Flow getFlow() {
		return flow;
	}

	public void setFlow(Flow flow) {
		this.flow = flow;
	}

	public Flow get(Long id) {
		setFlow((Flow) get(Flow.class, (Serializable) id));
		return getFlow();
	}

	public void save() {
		save(getFlow());
	}

	public void update(Long id) {
		save(getFlow());
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
