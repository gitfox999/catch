<%@page import="org.apache.catalina.core.ApplicationContext"%>
<%@page import="me.imvc.core.ClientInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="me.imvc.core.IPUtil"%>
<%response.setStatus(200);
//ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
//SystemConfig sysConfig = (SystemConfig)ctx.getBean(SystemConfig.class);
response.getWriter().write("{\"statusCode\":\"200\",\"message\":\"\"}");
%>