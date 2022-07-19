package com.phuong.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.phuong.model.Account;
import com.phuong.utils.SessionUtils;

@Service
public class SecurityInterceptor implements HandlerInterceptor {

	@Autowired
	private SessionUtils session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Account user = session.getAttibute("user");
		String error = "";
		if (user == null) {
			error = "Vui long dang nhap!";
		} else if (!user.getAdmin() && uri.startsWith("/admin/")) {
			error = "Truy cap khong hop le!";
		}
		if (error.length() > 0) {
			response.sendRedirect(request.getContextPath() + "/home/login?error=" + error);
			return false;
		}
		return true;
	}
}
