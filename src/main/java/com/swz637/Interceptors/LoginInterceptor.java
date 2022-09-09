package com.swz637.Interceptors;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ author: lsq637
 * @ since: 2022-08-28 09:34:20
 * @ describe:
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getRequestURI().contains("Login")) {
            return true;
        }
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("u") != null) {
            return true;
        }
        response.sendRedirect(request.getContextPath() + "/book/toLogin");
        return false;
    }
}
