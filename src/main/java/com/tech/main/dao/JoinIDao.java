package com.tech.main.dao;

import java.util.ArrayList;

import com.tech.main.dto.JoinDto;
import com.tech.main.dto.NoteDto;
import com.tech.main.dto.Re_BoardDto;

public interface JoinIDao {

	public void joinwrite(String memberid, String memberpw, String memberpwd, String membernick, String membername,
			String roadAddrPart1, String addrDetail, String jibunAddr, String zipNo, String membergender,
			String membertel, String memberyear, String membermonth, String memberday, String memberage, String memberemail,
			String memberreligion, String membersmok, String memberjob, String memberpersonality, String memberideal,
			String membersal, String memberblood, String memberglasses, String memberschool, String membercontent);

	
	public JoinDto proview(String memberid);


	public void fileproc(String memberid, String membernick, String memberreligion, String membersmok, String memberjob,
			String memberpersonality, String memberideal, String membersal, String memberblood, String memberglasses,
			String memberschool, String membercontent,String fname);


	public void memderpro(String memberid);


	public void setpw(String memberid, String memberpw, String memberpwd);

	//public ArrayList<JoinDto> ITview();


	public int selectBoardCount(String searchKeyword2, String selNum);
	
	public ArrayList<JoinDto> type_board(int rowStart, int rowEnd, String sKeyword,String selNum);
	
	public int checkid(String memberid);
	
	public int checknick(String membernick);

	public  JoinDto hompy(String memberid);


	public void send(String nonum,String sendnick, String takenick, String title, String content);


	public ArrayList<NoteDto> notebox(String takenick);


	public ArrayList<NoteDto> take(String nonum);


	public void delnote(String nonum);


	public NoteDto replysend(String nonum);


	public void replysendnote(String nonum, String sendnick, String takenick, String title, String content);


	











	







	


	
	


	



	
	



	

	




	
	

	

	

	
}
