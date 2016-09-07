package me.imvc.core;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import me.imvc.app.entities.Iplog;
import me.imvc.app.models.mana.IplogModel;

public class IpFilter implements Filter {


	@Override
	public void destroy() {


	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		  servletResponse.setContentType("text/javascript;charset=UTF-8");
		   HttpServletRequest request = (HttpServletRequest) servletRequest;
		   HttpServletResponse response = (HttpServletResponse) servletResponse;
		   response.setContentType("application/json;charset=UTF-8");
		   ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		   IplogModel iplogModel = (IplogModel)ctx.getBean("iplogModel");
		   Iplog iplog = new Iplog();
		   String ip = IPUtil.getRemoteHost(request);
		   List ll = iplogModel.getHt()
				   .find("from Ipfilter where ip = '"+ip+"'");
		   if(ll!=null && !ll.isEmpty()){
			   return;
		   }
		   ClientInfo clientInfo = new ClientInfo(request.getHeader("user-agent"));   
		   iplog.setBname(clientInfo.getExplorerName());
		   iplog.setBversion(clientInfo.getExplorerVer());
		   iplog.setBplug(clientInfo.getExplorerPlug());
		   iplog.setOname(clientInfo.getOSName());
		   iplog.setOversion(clientInfo.getOSVer());
		   iplog.setIp(ip);
		   iplog.setLoca(IPUtil.getaddress(ip));
		   iplog.setItime(new Date());
		   iplogModel.setIplog(iplog);
		   iplogModel.save();
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		

	}

}
