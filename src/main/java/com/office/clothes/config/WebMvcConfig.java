package com.office.clothes.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 로컬 폴더(C:/library/upload/)의 파일을 웹에서 접근 가능하도록 설정
		registry.addResourceHandler("/library/upload/**").addResourceLocations("file:///C:/library/upload/");
	}
}