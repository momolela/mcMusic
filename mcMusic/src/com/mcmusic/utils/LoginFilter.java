package com.mcmusic.utils;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


public class LoginFilter implements Filter {

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		/*
		 * 获取session中的userInfo
		 * 判断是否为null
		 * 如果为null：保存错误信息，转发到login.jsp
		 * 如果不为null：放行
		 */
		HttpServletRequest req = (HttpServletRequest) request;
		Object user = req.getSession().getAttribute("userInfo");
		if(user == null) {
			//返回没有登录的信息
			req.getSession().setAttribute("nologin","true");
			chain.doFilter(request, response);
			
		} else {
			//返回已经登录的信息
			req.getSession().setAttribute("nologin","false");
			chain.doFilter(request, response);
		}
	}
		

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
