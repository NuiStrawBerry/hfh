package com.hfh.management.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class ManagerInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse resp, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object o) throws Exception {
			String userid = (String) request.getSession().getAttribute("currentUser");
			String url = request.getRequestURI();
			//if(request.getRequestURI())
			//System.out.println(request.getRequestURI());
			if(null==userid || ("").equals(userid)){
				if(url.contains("login")){
					return true;
				}
				 response.sendRedirect(request.getContextPath() +"/management/login");
	            return false;
			}
		return true;
	}

}
