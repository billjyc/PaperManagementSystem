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

public class TeacherFilter implements Filter {
	private static Logger logger = LoggerFactory.getLogger(TeacherFilter.class);
	
	public void destroy() {

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		HttpSession session = request.getSession();

		if(session==null||!Constants.ACTOR_TEACHER.equals(session.getAttribute("actorLabel"))){
			response.sendRedirect( request.getContextPath() + "/mylogin.jsp"); 
			logger.debug("Teacher Filter 已启动！！！！！！");
			return;
		}else{
			arg2.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}