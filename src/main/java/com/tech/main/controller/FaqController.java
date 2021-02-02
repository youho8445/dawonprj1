package com.tech.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.main.dao.FaqDao;
import com.tech.main.dto.FaqBoardDto;
import com.tech.main.dto.InquiryboardDto;
import com.tech.main.page.PageVO;



@Controller
public class FaqController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/faq")
	public String faq(HttpServletRequest request,Model model) {

		return "faq";
	}
	
	
	@RequestMapping("/inquiry")
	public String inquiry(HttpServletRequest request, PageVO pageVo, Model model) {
		System.out.println("BController inquiry()!!!!!");
		/*
		 * commandInp=new BListService(); commandInp.execute(model);
		 */
		
		// 검색 search
		String datitle = "";
		String dacontent = "";
		
		String[] brdTitle = request.getParameterValues("searchType"); // checkbox 는 배열로 받아낼수있음
		
		if (brdTitle != null) {
			for (int i = 0; i < brdTitle.length; i++) {
				System.out.println("brdTitle : " + brdTitle[i]);
			}
		}
		if (brdTitle != null) {
			for (String val : brdTitle) {
				if (val.equals("datitle")) {
					model.addAttribute("datitle", "true");
					datitle = "datitle";
				} else if (val.equals("dacontent")) {
					model.addAttribute("dacontent", "true");
					dacontent = "dacontent";
				}
			}
		}
		
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
			
		}
		
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		
		// 검색의 4가지 경우의 수 표현
		int total = 0;
		if (datitle.equals("datitle") && dacontent.equals("")) { // title만 검색한경우
			total = dao.selectBoardCount(searchKeyword, "1");
			// total=dao.selectBoardCount1(searchKeyword);
			System.out.println("go total list111111111");
			
		} else if (datitle.equals("") && dacontent.equals("dacontent")) { // content만 검색한 경우
			total = dao.selectBoardCount(searchKeyword, "2");
			// total=dao.selectBoardCount2(searchKeyword);
			System.out.println("go total list222222222");
		} else if (datitle.equals("datitle") && dacontent.equals("dacontent")) { // 둘다 검색한 경우
			total = dao.selectBoardCount(searchKeyword, "3");
			// total=dao.selectBoardCount3(searchKeyword);
			System.out.println("go total list333333333");
		} else if (datitle.equals("") && dacontent.equals("")) { // 아무것도 체크안하고 검색한 경우
			total = dao.selectBoardCount(searchKeyword, "4");
			// total=dao.selectBoardCount4(searchKeyword);
			System.out.println("go total list4444444");
		}
		
		// 페이징 처리
		// int total=dao.selectBoard2Count();
		System.out.println("total row : " + total);
		pageVo = new PageVO();
		String strpage = request.getParameter("page");
		System.out.println("search keyword : " + searchKeyword);
		model.addAttribute("searchKeyword", searchKeyword);
		if (strpage == null) {
			strpage = "1";
		}
		
		int page = Integer.parseInt(strpage);
		pageVo.setPage(page);
		
		pageVo.pageCalculate(total);
		
		// 계산된 결과 출력
		System.out.println("click page : " + request.getParameter("page"));
		System.out.println("pageStart : " + pageVo.getPageStart());
		System.out.println("pageEnd : " + pageVo.getPageEnd());
		System.out.println("pageTotal : " + pageVo.getTotPage());
		System.out.println("rowStart : " + pageVo.getRowStart());
		System.out.println("rowEnd : " + pageVo.getRowEnd());
		
		int rowStart = pageVo.getRowStart();
		int rowEnd = pageVo.getRowEnd();
		
		// 리스트에 select query 적용
		if (datitle.equals("datitle") && dacontent.equals("")) { // title만 검색한경우
			model.addAttribute("inquiry", dao.inquiry(rowStart, rowEnd, searchKeyword, "1"));
			// model.addAttribute("totRowCnt",dao.selectBoardCount1(searchKeyword));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "1"));
			System.out.println("go inquiry1111 inquiry111111111");
		} else if (datitle.equals("") && dacontent.equals("dacontent")) { // content만 검색한 경우
			model.addAttribute("inquiry", dao.inquiry(rowStart, rowEnd, searchKeyword, "2"));
			// model.addAttribute("totRowCnt",dao.selectBoardCount2(searchKeyword));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "2"));
			System.out.println("go inquiry222 inquiry222222222");
		} else if (datitle.equals("datitle") && dacontent.equals("dacontent")) { // 둘다 검색한 경우
			model.addAttribute("inquiry", dao.inquiry(rowStart, rowEnd, searchKeyword, "3"));
			// model.addAttribute("totRowCnt",dao.selectBoardCount3(searchKeyword));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "3"));
			System.out.println("go inquiry333333 inquiry333333333");
		} else if (datitle.equals("") && dacontent.equals("")) { // 아무것도 체크안하고 검색한 경우
			model.addAttribute("inquiry", dao.inquiry(rowStart, rowEnd, searchKeyword, "4"));
			// model.addAttribute("totRowCnt",dao.selectBoardCount4(searchKeyword));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "4"));
			System.out.println("go inquiry4444444 inquiry4444444");
		}
		
		// model에 넣기
		/*
		 * ArrayList<BoardDto> dto=dao.list(rowStart,rowEnd);
		 * model.addAttribute("list",dto);
		 */
		
		model.addAttribute("pageVo", pageVo);
		return "inquiry";
	}
	@RequestMapping("/inquiry_view")
	public String inquiry_view(HttpServletRequest request, Model model) {
		System.out.println("BController inquiry_view()!!!!!");
		model.addAttribute("request", request);
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		String daid = request.getParameter("daid");
		// hitup
		
		
		InquiryboardDto dto = dao.InquiryView(daid);
		model.addAttribute("inquiry_view", dto);
		
		return "inquiry_view";
	}
	@RequestMapping("/inquiry_view2")
	public String inquiry_view2(HttpServletRequest request, Model model) {
		System.out.println("BController inquiry_view()!!!!!");
		model.addAttribute("request", request);
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		String daid = request.getParameter("daid");
		// hitup
		
		
		InquiryboardDto dto = dao.InquiryView(daid);
		model.addAttribute("inquiry_view", dto);
		
		return "inquiry_view2";
	}
	
	

	@RequestMapping("/inquirywrite_view")
	public String inquirywrite_view() {
		System.out.println("BController inquirywrite_view()!!!!!");

		return "inquirywrite_view";
	}

	@RequestMapping("/Inquirywrite")
	public String Inquirywrite(HttpServletRequest request, Model model) {
		System.out.println("BController inquirywrite()!!!!!");
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		String datitle = request.getParameter("datitle");
		String daname = request.getParameter("daname");
		String dacontent = request.getParameter("dacontent");

		dao.Inquirywrite(datitle, daname, dacontent);

		return "redirect:inquiry";
	}

	@RequestMapping(value = "/Inquirymodify", method = RequestMethod.POST)
	public String Inquirymodify(HttpServletRequest request, Model model) {
		System.out.println("BController inquirymodify()!!!!!");
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		String daid = request.getParameter("daid");
		String datitle = request.getParameter("datitle");
		String daname = request.getParameter("daname");
		String dacontent = request.getParameter("dacontent");

		dao.Inquirymodify(daid, datitle, daname, dacontent);

		return "redirect:inquiry";
	}

	@RequestMapping("/Inquirydelete")
	public String Inquirydelete(HttpServletRequest request, Model model) {
		System.out.println("BController Inquirydelete()!!!!!");
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		String daid = request.getParameter("daid");
		dao.Inquirydelete(daid);

		return "redirect:inquiry";
	}

	@RequestMapping("/inquiryreply_view")
	public String Inquiryreply_view(HttpServletRequest request, Model model) {
		System.out.println("BController Inquiryreply_view()!!!!!");
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		String daid = request.getParameter("daid");

		InquiryboardDto dto = dao.InquiryReplyView(daid);
		model.addAttribute("inquiryreply_view", dto);

		return "inquiryreply_view";
	}

	@RequestMapping("/InquiryReply")
	public String Inquiryreply(HttpServletRequest request, Model model) {
		System.out.println("BController Inquiryreply()!!!!!");
		FaqDao dao = sqlSession.getMapper(FaqDao.class);

		String datitle = request.getParameter("datitle");
		String daname = request.getParameter("daname");
		String dacontent = request.getParameter("dacontent");
		int dagroup = Integer.parseInt(request.getParameter("dagroup"));
		int dastep = Integer.parseInt(request.getParameter("dastep"));
		int daindent = Integer.parseInt(request.getParameter("daindent"));

		dao.InquiryReply(datitle, daname, dacontent, dagroup, dastep, daindent);

		// replyShape
		InquiryReplyShape(dagroup, dastep);

		return "redirect:inquiry";
	}

	private void InquiryReplyShape(int dagroup, int dastep) {
		FaqDao dao = sqlSession.getMapper(FaqDao.class);
		dao.InquiryReplyShape(dagroup, dastep);

	}
}
