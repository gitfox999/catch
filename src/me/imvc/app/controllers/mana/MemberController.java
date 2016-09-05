package me.imvc.app.controllers.mana;

import me.imvc.app.entities.Flow;
import me.imvc.app.entities.Member;
import me.imvc.app.models.mana.FlowModel;
import me.imvc.app.models.mana.MemberModel;
import me.imvc.core.BaseController;

public class MemberController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private MemberModel memberModel;
	private FlowModel flowModel;

	public MemberModel getMemberModel() {
		return memberModel;
	}

	public void setMemberModel(MemberModel memberModel) {
		this.memberModel = memberModel;
	}
	
	public FlowModel getFlowModel() {
		return flowModel;
	}

	public void setFlowModel(FlowModel flowModel) {
		this.flowModel = flowModel;
	}

	@Override
	public String index() {
		if(getMemberModel().getSearchParams() != null){
			String le = ((String[])getMemberModel().getSearchParams().get("and_money_le"))[0].toString();
			String ge = ((String[])getMemberModel().getSearchParams().get("and_money_ge"))[0].toString();
			if(!"".equals(ge.trim())){
				double money = Double.valueOf(ge)*100;
				String[] moneyTmp = {(int)money+""};
				getMemberModel().getSearchParams().put("and_money_ge", moneyTmp);
			}
			if(!"".equals(le.trim())){
				double money = Double.valueOf(le)*100;
				String[] moneyTmp = {(int)money+""};
				getMemberModel().getSearchParams().put("and_money_le", moneyTmp);
			}
		}
		if(getMemberModel().getOrderField() == null){
			getMemberModel().setOrderField("add_ts");
			getMemberModel().setOrderDirection("desc");
		}
		getMemberModel().getPageData("Member");
		return render("member/index");
	}

	@Override
	public String show() {
		getMemberModel().get(getId());
		return render("/member/edit");

	}

	@Override
	public String editNew() {
		return render("/member/edit");
	}

	@Override
	public String create() {
		getMemberModel().save();
		return successMsg("创建成功","member","closeCurrent");
	}

	@Override
	public String edit() {
		getMemberModel().get(getId());
		return render("/member/edit");
	}

	@Override
	public String update() {
		getMemberModel().update(getId());
		return successMsg("修改成功","member","closeCurrent");
	}

	@Override
	public String destroy() {
		return successMsg("删除成功");
	}
	
	public String topay(){
		Member member = new Member();
		member.setId(getId());
		Flow flow = new Flow();
		flow.setMember(member);
		memberModel.setFlow(flow);
		return render("/member/pay");
	}
	
	public String dopay(){
		getMemberModel().updatePay();
		return successMsg("充值成功","member","closeCurrent");
	}
	
	public String totake(){
		Member member = new Member();
		member.setId(getId());
		Flow flow = new Flow();
		flow.setMember(member);
		memberModel.setFlow(flow);
		return render("/member/take");
	}
	
	public String dotake(){
		if(getMemberModel().updateTake()){
			return successMsg("提现成功","member","closeCurrent");
		}else{
			return errorMsg("提款失败，金额异常","member","closeCurrent");
		}
	}
}
