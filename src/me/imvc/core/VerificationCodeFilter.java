package me.imvc.core;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VerificationCodeFilter implements Filter {


	@Override
	public void destroy() {


	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		  servletResponse.setContentType("text/javascript;charset=UTF-8");
		   HttpServletRequest request = (HttpServletRequest) servletRequest;
		   HttpServletResponse response = (HttpServletResponse) servletResponse;
		   String session_code = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
           String param_code = (String) request.getParameter("j_code");
			if (session_code != null && param_code != null) {
				if (session_code.equals(param_code)) {
					filterChain.doFilter(request, response);
				}else{
					response.sendRedirect(request.getContextPath()+"/access_denied/0/VerificationCodeError");					
				}
			}else{
				filterChain.doFilter(request, response);
			}
			
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		

	}

}
