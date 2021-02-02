package com.tech.main.serviceImpl;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.tech.main.dao.JoinIDao;
import com.tech.main.dao.MemberDAO;
import com.tech.main.dto.JoinDto;
import com.tech.main.service.LoginService;



public class LoginServiceImpl implements LoginService {
	
	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String memberid=request.getParameter("memberid");
		String memberpw=request.getParameter("memberpw");

		MemberDAO dao=new MemberDAO();
		String result=dao.login(memberid,memberpw);
		if(result.equals("비밀번호 불일치")){
			model.addAttribute("error",result);
			System.out.println("비밀번호 불일치");
			return "/loginview";
		}else if(result.equals("아이디 없음")){
			model.addAttribute("error",result);
			System.out.println("아이디없음");
			return "/loginview";
		}else if(result.equals("아이디 및 비밀번호 오류")){
			model.addAttribute("error",result);
			return "/loginview";
		}else {//성공
			request.getSession().setAttribute("membernick",result);
			request.getSession().setAttribute("memberid", memberid);
		return "redirect:mainpage";
	}

	}


}
