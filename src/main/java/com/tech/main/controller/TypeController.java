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
public class TypeController {
	
	
	LoginService service;

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/minihompy")
	public String minimompy(HttpServletRequest request,Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String memberid=request.getParameter("memberid");
		JoinDto dto=dao.hompy(memberid);
		model.addAttribute("hom",dto);
		return "/minihompy";
	}
	@RequestMapping("/story")
	public String story() {
		
		return "/story";
	}
	
	@RequestMapping("/ready")
	public String ready() {
		
		return "/ready";
	}
	
	
	
}
