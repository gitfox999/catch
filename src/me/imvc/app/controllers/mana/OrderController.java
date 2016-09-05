package me.imvc.app.controllers.mana;

import java.util.Map;

import me.imvc.app.models.mana.OrderModel;
import me.imvc.core.BaseController;
import me.imvc.core.OrderExplain;

public class OrderController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private OrderModel orderModel;
	

	public OrderModel getOrderModel() {
		return orderModel;
	}

	public void setOrderModel(OrderModel orderModel) {
		this.orderModel = orderModel;
	}

	@Override
	public String index() {
		if(getOrderModel().getSearchParams() != null){
			String le = ((String[])getOrderModel().getSearchParams().get("and_money_le"))[0].toString();
			String ge = ((String[])getOrderModel().getSearchParams().get("and_money_ge"))[0].toString();
			if(!"".equals(ge.trim())){
				double money = Double.valueOf(ge)*100;
				String[] moneyTmp = {(int)money+""};
				getOrderModel().getSearchParams().put("and_money_ge", moneyTmp);
			}
			if(!"".equals(le.trim())){
				double money = Double.valueOf(le)*100;
				String[] moneyTmp = {(int)money+""};
				getOrderModel().getSearchParams().put("and_money_le", moneyTmp);
			}
		}
		if(getOrderModel().getOrderField() == null){
			getOrderModel().setOrderField("otime");
			getOrderModel().setOrderDirection("desc");
		}
		String[] ff = {"money"};
		getOrderModel().setSumField(ff);
		getOrderModel().getPageData("Sscorder");
		return render("/order/index");
	}

	@Override
	public String show() {
		getOrderModel().get(getId());
		return render("/order/edit");

	}

	@Override
	public String editNew() {
		return render("/order/edit");
	}

	@Override
	public String create() {
		getOrderModel().save();
		return successMsg("创建成功","order","closeCurrent");
	}

	@Override
	public String edit() {
		getOrderModel().get(getId());
		return render("/order/edit");
	}

	@Override
	public String update() {
		getOrderModel().update(getId());
		return successMsg("修改成功","order","closeCurrent");
	}

	@Override
	public String destroy() {
		return successMsg("删除成功");
	}
}
