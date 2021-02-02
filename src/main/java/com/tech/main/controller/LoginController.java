package com.tech.main.controller;

import java.lang.reflect.Member;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.main.dao.JoinIDao;
import com.tech.main.dto.JoinDto;
import com.tech.main.service.LoginService;
import com.tech.main.serviceImpl.LoginServiceImpl;
import com.tech.main.serviceImpl.LogoutServiceImpl;
@Controller
public class LoginController {
	
	
	LoginService service;

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/loginview")
	public String loginview() {

		return "/loginview";
	}
	
	@RequestMapping(value="/loginpros",method=RequestMethod.POST)
	public String loginpros(HttpServletRequest request, Model model){
	
		service=new LoginServiceImpl();
		
		model.addAttribute("request",request);
		String str=service.execute(model);
		
		return str;
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		service=new LogoutServiceImpl();
		String str=service.execute(model);
		return str;
	}
}
