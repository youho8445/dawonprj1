package com.tech.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.main.dao.JoinIDao;
import com.tech.main.dto.JoinDto;
import com.tech.main.service.LoginService;

@Controller
public class JoinController {

	LoginService service;
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/joinview")
	public String joinview() {
		return "/joinview";
	}
	@RequestMapping("/joinform")
	public String joinform(HttpServletRequest request,Model model)  {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String memberid=request.getParameter("memberid");
		String memberpw=request.getParameter("memberpw");
		String memberpwd=request.getParameter("memberpwd");
		String membernick=request.getParameter("membernick");
		String membername=request.getParameter("membername");
		String roadAddrPart1=request.getParameter("roadAddrPart1");
		String addrDetail=request.getParameter("addrDetail");
		String jibunAddr=request.getParameter("jibunAddr"); 
		String zipNo=request.getParameter("zipNo");
		String membergender=request.getParameter("membergender");
		String membertel=request.getParameter("membertel");
		String memberyear=request.getParameter("memberyear");
		String membermonth=request.getParameter("membermonth");
		String memberday=request.getParameter("memberday");
		String memberage=request.getParameter("memberage");
		String memberemail=request.getParameter("memberemail");
		String memberreligion=request.getParameter("memberreligion");
		String membersmok=request.getParameter("membersmok");
		String memberjob=request.getParameter("memberjob");
		String memberpersonality=request.getParameter("memberpersonality");
		String memberideal=request.getParameter("memberideal");
		String membersal=request.getParameter("membersal");
		String memberblood=request.getParameter("memberblood");
		String memberglasses=request.getParameter("memberglasses");
		String memberschool=request.getParameter("memberschool");
		String membercontent=request.getParameter("membercontent");
		if(memberjob==null) {
			memberjob="";
		}if(memberpersonality==null) {
			memberpersonality="";
		}if(memberideal==null) {
			memberideal="";
		}if(memberschool==null) {
			memberschool="";
		}if(membercontent==null) {
			membercontent="";
		}if(membersal==null) {
			membersal="";
		}if(memberreligion==null) {
			memberreligion="";
		}if(membersmok==null) {
			membersmok="";
		}if(memberblood==null) {
			memberblood="";
		}if(memberglasses==null) {
			memberglasses="";
		}
		dao.joinwrite(memberid,memberpw,memberpwd,membernick,membername,roadAddrPart1,addrDetail,jibunAddr,zipNo,membergender,
					  membertel,memberyear,membermonth,memberday,memberage,memberemail,memberreligion,
				      membersmok,memberjob,memberpersonality,memberideal,membersal,memberblood,
				      memberglasses,memberschool,membercontent);
	
		return "/joinform";
	}
	
	//@RequestMapping(value = "/idCheck")
		// PostMapping은
		// 이전엔 RequestMapping (안에 Get인지 Post 인지 구분해줘야 되었는데)
		// 요즘은 따로 어노테이션이 구분되어서 나와서
		// GetMapping PostMapping 으로 써도됨. 뭐가 최신이고 뭐가 좋은진 모르겠음 찾아볼것
		@RequestMapping(value = "/idCheck")
		public String idCheck(HttpServletRequest request,Model model){
			JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
			System.out.println("들어옴");
			String memberid=request.getParameter("memberid");
			 
			int Checkresult =dao.checkid(memberid);
			
			model.addAttribute("Checkresult",Checkresult);
			model.addAttribute("memberid",memberid);
			
			System.out.println("테스트 값 : " + Checkresult);
			System.out.println("테스트 값 : " + memberid);
			System.out.println("테스트 값 : " + Checkresult);
			
			return "joinview";
		}
		@RequestMapping(value = "/nickCheck")
		public String nickCheck(HttpServletRequest request,Model model){
			JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
			System.out.println("닉네임 들어옴");
			String membernick=request.getParameter("membernick");
			 
			int nickCheckresult =dao.checknick(membernick);
			
			model.addAttribute("nickCheckresult",nickCheckresult);
			model.addAttribute("membernick",membernick);
			
			System.out.println("닉네임테스트 값 : " + nickCheckresult);
			System.out.println("닉네임테스트 값 : " + membernick);
			System.out.println("닉네임테스트 값 : " + nickCheckresult);
			
			return "nickCheckForm";
		}
		@RequestMapping("/nickCheckForm")
		public String nickCheckForm() {
			return "/nickCheckForm";
		}
		
}
