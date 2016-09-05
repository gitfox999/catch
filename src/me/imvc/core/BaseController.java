package me.imvc.core;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.Label;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.CookiesAware;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public abstract class BaseController extends ActionSupport implements
		ApplicationAware, RequestAware, SessionAware, CookiesAware,
		ParameterAware, ModelDriven<Object> {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private ServletContext servletContext;
	private HttpServletRequest httpServletRequest;
	private HttpServletResponse httpServletResponse;
	private Map<String, Object> application;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, String> cookie;
	private Map<String, String[]> parameter;
	private String rootPath;
	private String webUrl;
	private Logger loggerController;
	private Object model=null;
	private Long id;// 获取对象id

	public BaseController() {
		this.servletContext = ServletActionContext.getServletContext();
		this.httpServletRequest = ServletActionContext.getRequest();
		this.httpServletResponse = ServletActionContext.getResponse();
		this.rootPath = servletContext.getRealPath("/");
		int webPort=httpServletRequest.getServerPort();
		if(webPort==80){
			this.webUrl = httpServletRequest.getScheme() + "://"
					+ httpServletRequest.getServerName()
					+ httpServletRequest.getContextPath();
		}else{
			this.webUrl = httpServletRequest.getScheme() + "://"
					+ httpServletRequest.getServerName() + ":"
					+ webPort + httpServletRequest.getContextPath();
		}		
		
	}

	public String successMsg(String... msgs) {
		String[] msg_a = { "成功", "", "", "" };
		int i = 0;
		for (String msg : msgs) {
			msg_a[i] = msg;
			i++;
		}
		String message = "{'statusCode':'200','message':'" + msg_a[0]
				+ "','navTabId':'" + msg_a[1] + "','callbackType':'" + msg_a[2]
				+ "','forwardUrl':'" + msg_a[3] + "'}";
		return renderJson(message);
	}

	public String errorMsg(String... msgs) {
		String[] msg_a = { "失败", "", "", "" };
		int i = 0;
		for (String msg : msgs) {
			msg_a[i] = msg;
			i++;
		}
		String message = "{'statusCode':'300','message':'" + msg_a[0]
				+ "','navTabId':'" + msg_a[1] + "','callbackType':'" + msg_a[2]
				+ "','forwardUrl':'" + msg_a[3] + "'}";
		return renderJson(message);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ServletContext getServletContext() {
		return servletContext;
	}

	public HttpServletRequest getHttpServletRequest() {
		return httpServletRequest;
	}

	public HttpServletResponse getHttpServletResponse() {
		return httpServletResponse;
	}

	public Map<String, Object> getApplication() {
		return application;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public Map<String, String> getCookie() {
		return cookie;
	}

	public Map<String, String[]> getParameter() {
		return parameter;
	}

	public Logger getLoggerController() {
		return loggerController;
	}

	public void setLoggerController(Logger loggerController) {
		this.loggerController = loggerController;
	}

	public String getRootPath() {
		return rootPath;
	}

	public String getWebUrl() {
		return webUrl;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameter = parameters;
	}

	@Override
	public void setCookiesMap(Map<String, String> cookies) {
		this.cookie = cookies;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	@Override
	public String execute() {
		return this.index();
	}
	public abstract String index();

	public abstract String show();

	public abstract String editNew();

	public abstract String create();

	public abstract String edit();

	public abstract String update();

	public abstract String destroy();

	public Object getModel() {
		return this.model;
	}
	public void setModel(Object model) {
		this.model = model;
	}
	// 获取用户登录名
	public String getLoginName() {
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		String loginName = "";
		if (principal instanceof UserDetails) {
			loginName = ((UserDetails) principal).getUsername();
		} else {
			loginName = principal.toString();
		}
		return loginName;
	}

	// url跳转
	public String redirect(String url) {
		try {
			this.getHttpServletResponse().sendRedirect(webUrl + url);
		} catch (IOException e) {
			this.getLoggerController().warn(e);
		}
		return null;
	}

	public String render() {
		return "success";
	}

	public String render(String view) {
		return view;
	}

	// 输出文本
	public String renderText(String text) {
		this.getHttpServletResponse().setContentType("text/plain;charset=UTF-8");
		try {
			this.getHttpServletResponse().getWriter().write(text);
		} catch (IOException e) {
			loggerController.warn(e);
		}
		return null;
	}

	// 传入对象输出JSON
	private void renderObjectJson(Object objectJson) {
		this.getHttpServletResponse().setContentType(
				"application/json;charset=UTF-8");
		JSONObject jo = JSONObject.fromObject(objectJson);
		try {
			this.getHttpServletResponse().getWriter().write(jo.toString());
		} catch (IOException e) {
			loggerController.warn(e);
		}

	}

	// 传入文本输出JSON
	private void renderTextJson(String textJson) {
		this.getHttpServletResponse().setContentType(
				"application/json;charset=UTF-8");
		try {
			this.getHttpServletResponse().getWriter().write(textJson);
		} catch (IOException e) {
			loggerController.warn(e);
		}
	}

	// 输出JSON
	public String renderJson(Object object) {
		if (object instanceof String) {
			String json = String.valueOf(object).replace('\'', '"');
			this.renderTextJson(json);
		} else {
			this.renderObjectJson(object);
		}
		return null;
	}

	// 输出excel
	public String renderExcel(String fileName ,List<jxl.write.WritableCell> labels,String rptid) {
		try {
			getHttpServletResponse().setHeader("Content-disposition",
					"attachment; filename=" + new String(fileName.getBytes("GBK"),"ISO8859_1") + ".xls");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		getHttpServletResponse().setContentType("application/msexcel");
		OutputStream outputStream = null;
		jxl.write.WritableWorkbook writableWorkbook = null;
		try {
			outputStream = getHttpServletResponse().getOutputStream();
			writableWorkbook = jxl.Workbook.createWorkbook(outputStream);
			jxl.write.WritableSheet sheet=writableWorkbook.createSheet("Sheet1",0); 
			for (jxl.write.WritableCell cell : labels) {
				sheet.addCell(cell);
			}
			if(rptid.equals("rptgjmrjcj")){
				sheet.mergeCells(0, 0, 8, 0);
				sheet.mergeCells(0, 1, 8, 1);
				sheet.mergeCells(0, 2, 1, 2);
				sheet.mergeCells(0, 3, 0, 6);
				sheet.mergeCells(0, 7, 0, 13);
				sheet.mergeCells(0, 14, 0, 17);
				sheet.mergeCells(0, 18, 0, 20);
				sheet.mergeCells(0, 21, 0, 24);
				sheet.mergeCells(0, 25, 0, 30);
				sheet.mergeCells(0, 31, 1, 31);
				sheet.mergeCells(0, 32, 1, 32);
				sheet.mergeCells(0, 33, 1, 33);
				sheet.setRowView(2, 800);
				sheet.setColumnView(1, 17);
				sheet.setColumnView(0, 6);
				sheet.getSettings().setVerticalFreeze(3);
			}else if(rptid.equals("rptcjzl")){
				sheet.mergeCells(0, 0, 30, 0);
				sheet.mergeCells(0, 1, 30, 1);
				sheet.mergeCells(0, 2, 1, 5);
				sheet.mergeCells(2, 2, 2, 5);
				//刑事警情
				sheet.mergeCells(3, 2, 24, 2);
				//刑事案件总数
				sheet.mergeCells(3, 3, 3, 5);
				//盗窃
				sheet.mergeCells(4, 3, 16,3);
				//双抢
				sheet.mergeCells(17, 3, 18,3);
				//命案
				sheet.mergeCells(19, 3, 19,5);
				sheet.mergeCells(20, 3, 20,5);
				sheet.mergeCells(21, 3, 21,5);
				sheet.mergeCells(22, 3, 22,5);
				sheet.mergeCells(23, 3, 23,5);
				sheet.mergeCells(24, 3, 24,5);
				//交通事故
				sheet.mergeCells(25, 2, 25,5);
				sheet.mergeCells(26, 2, 26,5);
				sheet.mergeCells(27, 2, 27,5);
				sheet.mergeCells(28, 2, 28,5);
				sheet.mergeCells(29, 2, 29,5);
				sheet.mergeCells(30, 2, 30,5);
				//盗窃合计
				sheet.mergeCells(4, 4, 4,5);
				//住宅
				sheet.mergeCells(5, 4, 5,5);
				//单位
				sheet.mergeCells(6, 4, 7, 4);
				//机动车
				sheet.mergeCells(8, 4, 10, 4);
				//非机动车
				sheet.mergeCells(11, 4, 12, 4);
				//公共设施
				sheet.mergeCells(13, 4, 14, 4);
				//公共场所
				sheet.mergeCells(15, 4, 16, 4);
				//抢劫
				sheet.mergeCells(17, 4, 17, 5);
				//抢夺
				sheet.mergeCells(18, 4, 18, 5);
				
				sheet.mergeCells(0, 6, 0, 9);
				sheet.mergeCells(0, 10, 0, 16);
				sheet.mergeCells(0, 17, 0, 20);
				sheet.mergeCells(0, 21, 0, 23);
				sheet.mergeCells(0, 24, 0, 27);
				sheet.mergeCells(0, 28, 0, 33);
				sheet.mergeCells(0, 34, 1, 34);
				sheet.mergeCells(0, 35, 1, 35);
				sheet.mergeCells(0, 36, 1, 36);
//				sheet.setRowView(2, 800);
				for (int i = 2; i < 13; i++) {
					sheet.setColumnView(i,5);
				}
				for (int i = 13; i < 29; i++) {
					sheet.setColumnView(i,4);
				}
				sheet.setColumnView(30,6);
				sheet.setColumnView(29,6);
				sheet.setColumnView(1, 10);
				sheet.setColumnView(0, 3);
				sheet.getSettings().setVerticalFreeze(6);
			}else if(rptid.equals("afbw")){
				int percount = 33;
				for (int i = 0; i < 6; i++) {
					sheet.mergeCells(0, percount*i, 17, percount*i);
					sheet.mergeCells(0, percount*i+1, 0, percount*i+2);
					sheet.mergeCells(0, percount*i+3, 0, percount*i+3+(percount-6));
					sheet.mergeCells(2, percount*i+1, 10, percount*i+1);
					sheet.mergeCells(1, percount*i+1, 1, percount*i+2);
					for (int j = 11; j < 18; j++) {
						sheet.mergeCells(j, percount*i+1, j, percount*i+2);
					}
				}
				sheet.setColumnView(0,7);
				sheet.setColumnView(1,34);
				for (int j = 2; j < 18; j++) {
					sheet.setColumnView(j,6);
				}
			}
			writableWorkbook.write();
			outputStream.flush();
			writableWorkbook.close();
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (jxl.write.WriteException e) {
			e.printStackTrace();
		}
		return null;
	}
}
