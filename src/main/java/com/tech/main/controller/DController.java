package com.tech.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.main.dao.IDao;
import com.tech.main.dao.JoinIDao;
import com.tech.main.dto.BoardDto;
import com.tech.main.dto.JoinDto;
import com.tech.main.dto.Re_BoardDto;
import com.tech.main.page.PageVO;
import com.tech.main.page.PageVO2;

@Controller
public class DController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/free_board")
	public String free_board(HttpServletRequest request, PageVO pageVo, Model model) {
		System.out.println("DController free_board!!!!!");

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

		IDao dao = sqlSession.getMapper(IDao.class);

		// 검색의 4가지 경우의 수 표현
		int total = 0;
		if (datitle.equals("datitle") && dacontent.equals("")) { // title만 검색한경우
			total = dao.selectBoardCount(searchKeyword, "1");

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
			model.addAttribute("free_board", dao.free_board(rowStart, rowEnd, searchKeyword, "1"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "1"));
			System.out.println("go list1111 list111111111");
		} else if (datitle.equals("") && dacontent.equals("dacontent")) { // content만 검색한 경우
			model.addAttribute("free_board", dao.free_board(rowStart, rowEnd, searchKeyword, "2"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "2"));
			System.out.println("go list222 list222222222");
		} else if (datitle.equals("datitle") && dacontent.equals("dacontent")) { // 둘다 검색한 경우
			model.addAttribute("free_board", dao.free_board(rowStart, rowEnd, searchKeyword, "3"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "3"));
			System.out.println("go list333333 list333333333");
		} else if (datitle.equals("") && dacontent.equals("")) { // 아무것도 체크안하고 검색한 경우
			model.addAttribute("free_board", dao.free_board(rowStart, rowEnd, searchKeyword, "4"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "4"));
			System.out.println("go list4444444 list4444444");
		}

		// model에 넣기
		/*
		 * ArrayList<BoardDto> dto=dao.list(rowStart,rowEnd);
		 * model.addAttribute("list",dto);
		 */

		model.addAttribute("pageVo", pageVo);
		return "free_board";
	}

	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("DController content_view()!!!!!");
		model.addAttribute("request", request);
		IDao dao = sqlSession.getMapper(IDao.class);
		String daid = request.getParameter("daid");
		// hitup
		hitup(daid);

		BoardDto dto = dao.contentView(daid);
		model.addAttribute("content_view", dto);

		return "content_view";
	}
	@RequestMapping("/content_view2")
	public String content_view2(HttpServletRequest request, Model model) {
		System.out.println("DController content_view()!!!!!");
		model.addAttribute("request", request);
		IDao dao = sqlSession.getMapper(IDao.class);
		String daid = request.getParameter("daid");
		// hitup
		hitup(daid);
		
		BoardDto dto = dao.contentView(daid);
		model.addAttribute("content_view", dto);
		
		return "content_view2";
	}

	private void hitup(String daid) {
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.hitup(daid);

	}

	@RequestMapping("/write_view")
	public String write_view() {
		System.out.println("DController write_view()!!!!!");

		return "write_view";
	}

	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("DController write()!!!!!");
		IDao dao = sqlSession.getMapper(IDao.class);
		String datitle = request.getParameter("datitle");
		String daname = request.getParameter("daname");
		String dacontent = request.getParameter("dacontent");

		dao.write(datitle, daname, dacontent);

		return "redirect:free_board";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("DController modify()!!!!!");
		IDao dao = sqlSession.getMapper(IDao.class);
		String daid = request.getParameter("daid");
		String datitle = request.getParameter("datitle");
		String daname = request.getParameter("daname");
		String dacontent = request.getParameter("dacontent");

		dao.modify(daid, datitle, daname, dacontent);

		return "redirect:free_board";
	}

	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("DController delete()!!!!!");
		IDao dao = sqlSession.getMapper(IDao.class);
		String daid = request.getParameter("daid");
		dao.delete(daid);

		return "redirect:free_board";
	}

	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		System.out.println("DController reply_view()!!!!!");
		IDao dao = sqlSession.getMapper(IDao.class);
		String daid = request.getParameter("daid");

		BoardDto dto = dao.replyView(daid);
		model.addAttribute("reply_view", dto);

		return "reply_view";
	}

	@RequestMapping("/reply")
	public String reply(HttpServletRequest request, Model model) {
		System.out.println("DController reply()!!!!!");
		IDao dao = sqlSession.getMapper(IDao.class);

		String datitle = request.getParameter("datitle");
		String daname = request.getParameter("daname");
		String dacontent = request.getParameter("dacontent");
		int dagroup = Integer.parseInt(request.getParameter("dagroup"));
		int dastep = Integer.parseInt(request.getParameter("dastep"));
		int daindent = Integer.parseInt(request.getParameter("daindent"));

		dao.reply(datitle, daname, dacontent, dagroup, dastep, daindent);

		// replyShape
		replyShape(dagroup, dastep);

		return "redirect:free_board";
	}

	private void replyShape(int dagroup, int dastep) {
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.replyShape(dagroup, dastep);

	}

	// 신고 게시판
	@RequestMapping("/report_board")
	public String report_board(HttpServletRequest request, PageVO2 pageVo, Model model) {
		System.out.println("DController report_board!!!!!");

		IDao dao = sqlSession.getMapper(IDao.class);

		// 페이징 처리
		int total = dao.selectBoard3Count();
		pageVo = new PageVO2();
		String strpage = request.getParameter("page");
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

		int rowStart2 = pageVo.getRowStart();
		int rowEnd2 = pageVo.getRowEnd();

		// model에 넣기
		ArrayList<Re_BoardDto> dto = dao.report_board(rowStart2, rowEnd2);
		model.addAttribute("report_board", dto);

		model.addAttribute("pageVo", pageVo);

		return "report_board";
	}

	@RequestMapping("/re_content_view")
	public String re_content_view(HttpServletRequest request, Model model) {
		System.out.println("DController re_content_view()!!!!!");
		model.addAttribute("request", request);
		IDao dao = sqlSession.getMapper(IDao.class);
		String reid = request.getParameter("reid");

		Re_BoardDto dto = dao.re_contentView(reid);
		model.addAttribute("re_content_view", dto);

		return "re_content_view";
	}

	@RequestMapping("/re_write_view")
	public String re_write_view() {
		System.out.println("DController re_write_view()!!!!!");

		return "re_write_view";
	}

	@RequestMapping("/re_write")
	public String re_write(HttpServletRequest request, Model model) {
		System.out.println("DController re_write()!!!!!");
		IDao dao = sqlSession.getMapper(IDao.class);
		String re_name = request.getParameter("re_name");
		String recontent = request.getParameter("recontent");

		dao.re_write(re_name, recontent);

		return "redirect:mainpage";
	}

	@RequestMapping("/re_reply_view")
	public String re_reply_view(HttpServletRequest request, Model model) {
		System.out.println("DController re_reply_view!!!!!");
		IDao dao = sqlSession.getMapper(IDao.class);
		String reid = request.getParameter("reid");

		Re_BoardDto dto = dao.re_replyView(reid);
		model.addAttribute("re_reply_view", dto);

		return "re_reply_view";
	}

	@RequestMapping("/re_reply")
	public String re_reply(HttpServletRequest request, Model model) {
		System.out.println("DController re_reply()!!!!!");
		IDao dao = sqlSession.getMapper(IDao.class);

		String retitle = request.getParameter("retitle");
		String re_name = request.getParameter("re_name");
		String recontent = request.getParameter("recontent");
		int regroup = Integer.parseInt(request.getParameter("regroup"));
		int restep = Integer.parseInt(request.getParameter("restep"));
		int reindent = Integer.parseInt(request.getParameter("reindent"));

		dao.re_reply(retitle, re_name, recontent, regroup, restep, reindent);

		// re_replyShape
		re_replyShape(regroup, restep);

		return "redirect:report_board";
	}

	private void re_replyShape(int regroup, int restep) {
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.re_replyShape(regroup, restep);

	}

	@RequestMapping("/type_board")
	public String type_board(HttpServletRequest request, PageVO2 pageVo, Model model) {
		System.out.println("DController type_board!!!!!");
		// 검색 search
		String memberage = "";
		String roadaddrpart1 = "";

		String[] brdTitle2 = request.getParameterValues("searchType2"); // checkbox 는 배열로 받아낼수있음

		if (brdTitle2 != null) {
			for (int i = 0; i < brdTitle2.length; i++) {
				System.out.println("brdTitle : " + brdTitle2[i]);
			}
		}
		if (brdTitle2 != null) {
			for (String val : brdTitle2) {
				if (val.equals("memberage")) {
					model.addAttribute("memberage", "true");
					memberage = "memberage";
				} else if (val.equals("roadaddrpart1")) {
					model.addAttribute("roadaddrpart1", "true");
					roadaddrpart1 = "roadaddrpart1";
				}
			}
		}

		String searchKeyword2 = request.getParameter("sk2");
		if (searchKeyword2 == null) {
			searchKeyword2 = "";

		}

		JoinIDao dao = sqlSession.getMapper(JoinIDao.class);
		
		// 검색의 4가지 경우의 수 표현
		int total = 0;
		if (memberage.equals("memberage") && roadaddrpart1.equals("")) { // memberage만 검색한경우
			total = dao.selectBoardCount(searchKeyword2, "1");
			System.out.println("go total list111111111");

		} else if (memberage.equals("") && roadaddrpart1.equals("roadaddrpart1")) { // roadaddrpart1만 검색한 경우
			total = dao.selectBoardCount(searchKeyword2, "2");
			
			System.out.println("go total list222222222");
		} else if (memberage.equals("memberage") && roadaddrpart1.equals("roadaddrpart1")) { // 둘다 검색한 경우
			total = dao.selectBoardCount(searchKeyword2, "3");
			
			System.out.println("go total list333333333");
		} else if (memberage.equals("") && roadaddrpart1.equals("")) { // 아무것도 체크안하고 검색한 경우
			total = dao.selectBoardCount(searchKeyword2, "4");
			
			System.out.println("go total list4444444");
		}

		// 페이징 처리
		// int total=dao.selectBoard2Count();
		System.out.println("total row : " + total);
		pageVo = new PageVO2();
		String strpage = request.getParameter("page");
		System.out.println("search keyword : " + searchKeyword2);
		model.addAttribute("searchKeyword", searchKeyword2);
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
		if (memberage.equals("memberage") && roadaddrpart1.equals("")) { 
			model.addAttribute("type_board", dao.type_board(rowStart, rowEnd, searchKeyword2, "1"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword2, "1"));
			
			System.out.println("go list1111 list111111111");
		} else if (memberage.equals("") && roadaddrpart1.equals("roadaddrpart1")) {
			model.addAttribute("type_board", dao.type_board(rowStart, rowEnd, searchKeyword2, "2"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword2, "2"));
			
			System.out.println("go list222 list222222222");
		} else if (memberage.equals("memberage") && roadaddrpart1.equals("roadaddrpart1")) { // 둘다 검색
			model.addAttribute("type_board", dao.type_board(rowStart, rowEnd, searchKeyword2, "3"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword2, "3"));
			
			System.out.println("go list333333 list333333333");
		} else if (memberage.equals("") && roadaddrpart1.equals("")) { // 아무것도 체크안하고 검색
			model.addAttribute("type_board", dao.type_board(rowStart, rowEnd, searchKeyword2, "4"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword2, "4"));
			
			System.out.println("go list4444444 list4444444");
		}

		//String memberid = request.getParameter("memberid");

		//ArrayList<JoinDto> dto = dao.ITview();
		//model.addAttribute("type_board", dto);
		model.addAttribute("pageVo", pageVo);

		return "type_board";
	}

}
