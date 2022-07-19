package com.phuong.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.phuong.interceptor.LoggerInterceptor;
import com.phuong.interceptor.SecurityInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{

	@Autowired
	private LoggerInterceptor interceptor;
	
	@Autowired
	private SecurityInterceptor auth;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		        .addPathPatterns("/**")
		        .excludePathPatterns("/AssetsForAdmin/**","/AssetsForUser/**","/images/","/video/");
		
		registry.addInterceptor(auth)
		        .addPathPatterns("/admin/**","/home/checkout","/home/changepassword")
		        .excludePathPatterns("/home/index","/home/login");
	}
	
}
