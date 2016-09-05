package me.imvc.app.models.mana;

import java.io.Serializable;

import me.imvc.app.entities.Config;
import me.imvc.core.BaseModel;

public class ConfigModel extends BaseModel {
	private Config config;

	public Config getConfig() {
		return config;
	}

	public void setConfig(Config config) {
		this.config = config;
	}

	public Config get(Long id) {
		setConfig((Config) get(Config.class, (Serializable) id));
		return getConfig();
	}

	public void save() {
		save(getConfig());
	}

	public void update(Long id) {
		getConfig().setId(id);
		update(getConfig());
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
