package com.dxl.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.dxl.core.po.User;

public class LoginInterceptor implements HandlerInterceptor{

  @Override
  public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
      throws Exception {
    
  }

  @Override
  public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
      throws Exception {
    
  }

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
    //获取请求的URL
    String url = request.getRequestURI();
    
    if (url.indexOf("/login.action") != -1) {
      return true;
    }
    
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("USER_SESSION");
    if (user != null) {
      return true;
    }

    request.setAttribute("msg", "您还没有登录,请先登录");
    request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
    return false;
  }

}
