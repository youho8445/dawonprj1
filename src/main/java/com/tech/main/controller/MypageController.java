package com.tech.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.main.dao.JoinIDao;
import com.tech.main.dto.JoinDto;
import com.tech.main.dto.NoteDto;



@Controller
public class MypageController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "/mypage";
	}
	@RequestMapping("/memberprofile")
	public String memberprofile(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String memberid=request.getParameter("memberid");
		
		JoinDto dto=dao.proview(memberid);
		model.addAttribute("prop",dto);
		return "/memberprofile";
	}
	@RequestMapping("/memberpw")
	public String memberpw(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		return "/memberpw";
	}
	@RequestMapping("/profileproc")
	public String profileproc(HttpServletRequest request, Model model) throws Exception {
		/*		//upload
		String attachPath="resources\\upload\\";  //upload 파일 찾아가기
		String uploadPath=request.getSession().getServletContext().getRealPath("/"); //realpath값 구하기
				
		String path=uploadPath+attachPath;  //path 합침 */
		//신유호 패스경로 
		String path = "C:\\spring_setting\\springwork\\dawonprj0118(6)\\src\\main\\webapp\\resources\\upload";
		
		//규정이형 패스경로 
		//String path = "D:\\Java\\Brackethome\\spring_setting\\spring_work\\dawonprj0118\\src\\main\\webapp\\resources\\upload";
		System.out.println("path : " + path);
		MultipartRequest req=
		new MultipartRequest(request, path,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());  //(10*1024*1024=10mb 라는뜻
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		
		String memberid=req.getParameter("memberid");
		String membernick=req.getParameter("membernick");
		String memberreligion=req.getParameter("memberreligion");
		String membersmok=req.getParameter("membersmok");
		String memberjob=req.getParameter("memberjob");
		String memberpersonality=req.getParameter("memberpersonality");
		String memberideal=req.getParameter("memberideal");
		String membersal=req.getParameter("membersal");
		String memberblood=req.getParameter("memberblood");
		String memberglasses=req.getParameter("memberglasses");
		String memberschool=req.getParameter("memberschool");
		String membercontent=req.getParameter("membercontent");
		String fname=req.getFilesystemName("filesrc");
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
		}if (fname==null) {
			fname="";
		}
		dao.fileproc(memberid,membernick,memberreligion,membersmok,memberjob,memberpersonality,memberideal,
				membersal,memberblood,memberglasses,memberschool,membercontent,fname);
		
		return "redirect:mainpage";
	}
	@RequestMapping("/memberdelete")
	public String memberdelete(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		
		
		return "/memberdelete";
	}
	@RequestMapping("/memberdeletepr")
	public String memberdeletepr(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		
		String memberid=request.getParameter("memberid");
		
		dao.memderpro(memberid);
		request.getSession().invalidate();
		return "redirect:memberdelproo";
	}
	@RequestMapping("/memberdelproo")
	public String memberdelproo() {
		return "/memberdelproo";
	}
	@RequestMapping("/updatepw")
	public String updatepw(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String memberid=request.getParameter("memberid");
		String memberpw=request.getParameter("memberpw");
		String memberpwd=request.getParameter("memberpwd");
		
		
		dao.setpw(memberid,memberpw,memberpwd);
		request.getSession().invalidate();
		return "redirect:loginview";
	}
	@RequestMapping("/notebox")
	public String notebox(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String takenick=request.getParameter("takenick");
		
		ArrayList<NoteDto>dtos=dao.notebox(takenick);
		model.addAttribute("notebox",dtos);
		return "/notebox";
	}
	@RequestMapping("/sendnote")
	public String sendnote() {
		return "/sendnote";
	}
	@RequestMapping("/send")
	public String send(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String nonum=request.getParameter("nonum");
		String sendnick=request.getParameter("sendnick");
		String takenick=request.getParameter("takenick");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		dao.send(nonum,sendnick,takenick,title,content);
		return "/notesuccess";
	}
	@RequestMapping("/notesuccess")
	public String notesuccess() {
		return "/notesuccess";
	}
	
	@RequestMapping("/takenote")
	public String takenote(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String nonum=request.getParameter("nonum");
			
		
		ArrayList<NoteDto> dtos=dao.take(nonum);
		model.addAttribute("taview",dtos);
		
		return "/takenote";
	}
	@RequestMapping("/notedel")
	public String notedel(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String nonum=request.getParameter("nonum");
		
		dao.delnote(nonum);
		return "/notedelsucc";
	}
	@RequestMapping("/replysendnote")
	public String replysendnote(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String nonum=request.getParameter("nonum");
		
		NoteDto dto=dao.replysend(nonum);
		model.addAttribute("reply",dto);
		System.out.println("테스트 sendnote :"+nonum);
		return "replysendnote"; 	
	}
	@RequestMapping("/replysend")
	public String replysend(HttpServletRequest request, Model model) {
		JoinIDao dao=sqlSession.getMapper(JoinIDao.class);
		String nonum=request.getParameter("nonum");
		String sendnick=request.getParameter("sendnick");
		String takenick=request.getParameter("takenick");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		dao.replysendnote(nonum,sendnick,takenick,title,content);
		System.out.println("테스트 sendnote1:"+nonum);
		return "/notesuccess";
	}
	
	
	
	
}
