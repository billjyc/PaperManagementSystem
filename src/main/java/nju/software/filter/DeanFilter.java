package nju.software.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import nju.software.util.Constants;


public class DeanFilter implements Filter {
	private static Logger logger = LoggerFactory.getLogger(DeanFilter.class);
	
	public void doFilter(ServletRequest arg0, ServletResponse agr1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) agr1;
		HttpSession session = request.getSession();
		
		if(session == null || !Constants.ACTOR_DEAN.equals(session.getAttribute("actorLabel"))){ 
			response.sendRedirect( request.getContextPath() + "/mylogin.jsp"); 
			logger.debug("Dean Filter 已启动！！！！！！");
			return;
		} else {
			arg2.doFilter(request, response);
		}
	}

	public void destroy() {
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
