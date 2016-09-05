//登出跳转
function redirect(json) {
	self.location = json.forwardUrl;
}
// =====================修改排序 帮助文档说每次要将orderDirection绑定回th的class 但是我测试不可以 所以修改一下==================
function dwzPageBreakCallback(response, op) {
	var $this = $(this);
	var orderField_v = "";
	var orderDirection_v = "";
	$.each(op.data, function(i, n) {
		var s_a = n.name.split('.');// 分割参数获取排序属性名
		switch (s_a[s_a.length - 1]) {
		case "orderField":
			orderField_v = n.value;
			break;
		case "orderDirection":
			orderDirection_v = n.value;
			break;
		default:
			break;
		}
	});
	if (typeof (orderField_v) != "undefined"
			&& typeof (orderDirection_v) != "undefined") {
		if (orderDirection_v == "asc") {
			$($this + "[orderField='" + orderField_v + "']").attr("class",
					"asc");
		} else {
			$($this + "[orderField='" + orderField_v + "']").attr("class",
					"desc");
		}
	}
}
// =====================修改排序==================
//获取cookies
function getCookie(c_name) {
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=");
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1;
			c_end = document.cookie.indexOf(";", c_start);
			if (c_end == -1)
				c_end = document.cookie.length;
			return unescape(document.cookie.substring(c_start, c_end));
		}
	}
	return "";
}

//删除文件ajax
function fileDeleteAjax(fileCode){
	ajaxTodo($weburl+"/files/0?fileCode="+fileCode+"&_method=delete");
}