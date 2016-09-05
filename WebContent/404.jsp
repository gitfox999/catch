<%@page import="org.apache.catalina.core.ApplicationContext"%>
<%@page import="me.imvc.core.ClientInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="me.imvc.core.IPUtil"%>
<%response.setStatus(200);
//ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
//SystemConfig sysConfig = (SystemConfig)ctx.getBean(SystemConfig.class);
response.setContentType("application/json;charset=UTF-8");
String ip = IPUtil.getRemoteHost(request);
ClientInfo clientInfo = new ClientInfo(request.getHeader("user-agent"));   
System.out.println(clientInfo.getExplorerName());   
System.out.println(clientInfo.getExplorerVer());   
System.out.println(clientInfo.getExplorerPlug());   
System.out.println(clientInfo.getOSName());   
System.out.println(clientInfo.getOSVer());
String strBackUrl = "http://" + request.getServerName() //服务器地址  
+ ":"   
+ request.getServerPort()           //端口号  
+ request.getContextPath()      //项目名称  
+ request.getServletPath()      //请求页面或其他地址  
+ "?" + (request.getQueryString()); //参数  
System.out.println(strBackUrl);
response.getWriter().write("{\"statusCode\":\"200\",\"message\":\""+ip+"\"}");
%>