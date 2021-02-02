package com.tech.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.main.dao.JoinIDao;

@Controller
public class introducepageController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/introducepage")
	public String introducepage() {
		return "/introducepage";
	}
	@RequestMapping("/map")
	public String map() {
		return "/map";
	}
	

}
