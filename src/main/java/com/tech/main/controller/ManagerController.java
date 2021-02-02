package com.tech.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.main.dao.JoinIDao;
import com.tech.main.dao.ManagerDao;
import com.tech.main.dto.JoinDto;
import com.tech.main.page.PageVO;
import com.tech.main.service.LoginService;
@Controller
public class ManagerController {
	
	
	LoginService service;

	@Autowired
	private SqlSession sqlSession;
	
	/*@RequestMapping("/manager")
	public String manager(Model model) {
		return "/manager";
	}*/
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request,PageVO pageVo,Model model) {
		String memberid = "";
		String membernick = "";
		
		String[] brdTitle3 = request.getParameterValues("searchType3"); // checkbox 는 배열로 받아낼수있음
		if (brdTitle3 != null) {
			for (int i = 0; i < brdTitle3.length; i++) {
				System.out.println("brdTitle : " + brdTitle3[i]);
			}
		}
		if (brdTitle3 != null) {
			for (String val : brdTitle3) {
				if (val.equals("memberid")) {
					model.addAttribute("memberid", "true");
					memberid = "memberid";
				} else if (val.equals("membernick")) {
					model.addAttribute("membernick", "true");
					membernick = "membernick";
				}
			}
		}
		String searchKeyword3 = request.getParameter("sk3");
		if (searchKeyword3 == null) {
			searchKeyword3 = "";

		}
		ManagerDao dao=sqlSession.getMapper(ManagerDao.class);
		// 검색의 4가지 경우의 수 표현
		int total = 0;
		
		if (memberid.equals("memberid") && membernick.equals("")) { // memberid만 검색한경우
			total = dao.selectBoardCount(searchKeyword3, "1");
			System.out.println("go total list111111111");

		} else if (memberid.equals("") && membernick.equals("membernick")) { // membernick만 검색한 경우
			total = dao.selectBoardCount(searchKeyword3, "2");
			
			System.out.println("go total list222222222");
		} else if (memberid.equals("memberid") && membernick.equals("membernick")) { // 둘다 검색한 경우
			total = dao.selectBoardCount(searchKeyword3, "3");
			
			System.out.println("go total list333333333");
		} else if (memberid.equals("") && membernick.equals("")) { // 아무것도 체크안하고 검색한 경우
			total = dao.selectBoardCount(searchKeyword3, "4");
			System.out.println("go total list4444444");
		}
		
		// 페이징 처리
				// int total=dao.selectBoard2Count();
				System.out.println("total row : " + total);
				pageVo = new PageVO();
				String strpage = request.getParameter("page");
				System.out.println("search keyword : " + searchKeyword3);
				model.addAttribute("searchKeyword", searchKeyword3);
				if (strpage == null) {
					strpage = "1";
				}

				int page = Integer.parseInt(strpage);
				pageVo.setPage(page);

				pageVo.pageCalculate(total);
				
				System.out.println("click page : " + request.getParameter("page"));
				System.out.println("pageStart : " + pageVo.getPageStart());
				System.out.println("pageEnd : " + pageVo.getPageEnd());
				System.out.println("pageTotal : " + pageVo.getTotPage());
				System.out.println("rowStart : " + pageVo.getRowStart());
				System.out.println("rowEnd : " + pageVo.getRowEnd());
				
				int rowStart = pageVo.getRowStart();
				int rowEnd = pageVo.getRowEnd();
				// 리스트에 select query 적용
				if (memberid.equals("memberid") && membernick.equals("")) { 
					model.addAttribute("manager", dao.memberlist(rowStart, rowEnd, searchKeyword3, "1"));
					model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword3, "1"));
					
					System.out.println("go list1111 list111111111");
				} else if (memberid.equals("") && membernick.equals("membernick")) {
					model.addAttribute("manager", dao.memberlist(rowStart, rowEnd, searchKeyword3, "2"));
					model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword3, "2"));
					
					System.out.println("go list222 list222222222");
				} else if (memberid.equals("memberid") && membernick.equals("membernick")) { // 둘다 검색
					model.addAttribute("manager", dao.memberlist(rowStart, rowEnd, searchKeyword3, "3"));
					model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword3, "3"));
					
					System.out.println("go list333333 list333333333");
				} else if (memberid.equals("") && membernick.equals("")) { // 아무것도 체크안하고 검색
					model.addAttribute("manager", dao.memberlist(rowStart, rowEnd, searchKeyword3, "4"));
					model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword3, "4"));
					
					System.out.println("go list4444444 list4444444");
				}

				model.addAttribute("pageVo", pageVo);

				return "manager";
	}
	@RequestMapping("/managerdel")
	public String managerdel(HttpServletRequest request,Model model) {
		ManagerDao dao=sqlSession.getMapper(ManagerDao.class);
		String memberseq=request.getParameter("memberseq");
		
		dao.managerdel(memberseq);
		return "redirect:manager";
	}
	@RequestMapping("/memberinfo")
	public String memberinfo(HttpServletRequest request,Model model) {
		ManagerDao dao=sqlSession.getMapper(ManagerDao.class);
		String memberid=request.getParameter("memberid");
		JoinDto dto=dao.info(memberid);
		model.addAttribute("hom",dto);
		return "/memberinfo";
	}
	
}
