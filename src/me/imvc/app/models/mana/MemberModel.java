package me.imvc.app.models.mana;

import java.io.Serializable;
import java.util.Date;

import me.imvc.app.entities.Flow;
import me.imvc.app.entities.Member;
import me.imvc.core.BaseModel;

public class MemberModel extends BaseModel {
	private Member member;
	private Flow flow;
	private FlowModel flowModel;
	
	public Flow getFlow() {
		return flow;
	}

	public void setFlow(Flow flow) {
		this.flow = flow;
	}
	
	public FlowModel getFlowModel() {
		return flowModel;
	}
	
	public void setFlowModel(FlowModel flowModel) {
		this.flowModel = flowModel;
	}
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Member get(Long id) {
		setMember((Member) get(Member.class, (Serializable) id));
		return getMember();
	}

	public void save() {
		save(getMember());
	}

	public void update(Long id) {
		save(getMember());
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
	
	public void updatePay(){
		member = get(flow.getMember().getId());
		flow.setMoney(flow.getMoney()*100);
		member.setMoney(member.getMoney()+flow.getMoney());
		save(member);
		flow.setDirction(0);
		flow.setTs(new Date());
		flow.setType(0);
		flowModel.setFlow(flow);
		flowModel.save();
	}

	public boolean updateTake(){
		member = get(flow.getMember().getId());
		flow.setMoney(flow.getMoney()*100);
		if(member.getMoney()>=flow.getMoney()){
			member.setMoney(member.getMoney()-flow.getMoney());
			save(member);
			flow.setDirction(1);
			flow.setTs(new Date());
			flow.setType(1);
			flowModel.setFlow(flow);
			flowModel.save();
			return true;
		}else{
			return false;
		}
	}
}
