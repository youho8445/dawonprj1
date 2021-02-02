package com.tech.main.serviceImpl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.main.service.LoginService;

public class LogoutServiceImpl implements LoginService {

	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		request.getSession().invalidate();
		return "redirect:mainpage";
	
	}

	


}
