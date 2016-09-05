package me.imvc.app.controllers.mana;

import java.util.Map;

import me.imvc.app.models.mana.FlowModel;
import me.imvc.app.models.mana.OrderModel;
import me.imvc.core.BaseController;
import me.imvc.core.OrderExplain;

public class FlowController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private FlowModel flowModel;
	
	public FlowModel getFlowModel() {
		return flowModel;
	}

	public void setFlowModel(FlowModel flowModel) {
		this.flowModel = flowModel;
	}


	@Override
	public String index() {
		if(getFlowModel().getSearchParams() != null){
			String le = ((String[])getFlowModel().getSearchParams().get("and_money_le"))[0].toString();
			String ge = ((String[])getFlowModel().getSearchParams().get("and_money_ge"))[0].toString();
			if(!"".equals(ge.trim())){
				double money = Double.valueOf(ge)*100;
				String[] moneyTmp = {(int)money+""};
				getFlowModel().getSearchParams().put("and_money_ge", moneyTmp);
			}
			if(!"".equals(le.trim())){
				double money = Double.valueOf(le)*100;
				String[] moneyTmp = {(int)money+""};
				getFlowModel().getSearchParams().put("and_money_le", moneyTmp);
			}
		}
		if(getFlowModel().getOrderField() == null){
			getFlowModel().setOrderField("ts");
			getFlowModel().setOrderDirection("desc");
		}
		String[] ff = {"money"};
		getFlowModel().setSumField(ff);
		getFlowModel().getPageData("Flow");
		return render("/flow/index");
	}

	@Override
	public String show() {
		getFlowModel().get(getId());
		return render("/flow/edit");

	}

	@Override
	public String editNew() {
		return render("/flow/edit");
	}

	@Override
	public String create() {
		getFlowModel().save();
		return successMsg("创建成功","flow","closeCurrent");
	}

	@Override
	public String edit() {
		getFlowModel().get(getId());
		return render("/flow/edit");
	}

	@Override
	public String update() {
		getFlowModel().update(getId());
		return successMsg("修改成功","flow","closeCurrent");
	}

	@Override
	public String destroy() {
		return successMsg("删除成功");
	}
}
