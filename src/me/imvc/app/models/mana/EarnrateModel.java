package me.imvc.app.models.mana;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jxl.write.Label;

import me.imvc.app.entities.EarnRate;
import me.imvc.core.BaseModel;
import me.imvc.lib.StringToMd5;

public class EarnrateModel extends BaseModel {
	private EarnRate earnRate;


	public EarnRate getEarnRate() {
		return earnRate;
	}

	public void setEarnRate(EarnRate earnRate) {
		this.earnRate = earnRate;
	}

	public EarnRate get(Long id) {
		setEarnRate((EarnRate) get(EarnRate.class, (Serializable) id));
		return getEarnRate();
	}

	public void save() {
		save(getEarnRate());
	}

	public void update(Long id) {
		getEarnRate().setId(id);
		update(getEarnRate());
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
