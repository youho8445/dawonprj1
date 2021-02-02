package com.tech.main.dao;

import java.util.ArrayList;

import com.tech.main.dto.BoardDto;
import com.tech.main.dto.JoinDto;
import com.tech.main.dto.Re_BoardDto;

public interface IDao {
	
	//public ArrayList<BoardDto> list(int Startrow, int Endrow);
	public ArrayList<BoardDto> free_board(int rowStart, int rowEnd, String sKeyword,String selNum);
	
	public BoardDto contentView(String daid);

	public void hitup(String daid);

	public void write(String datitle, String daname, String dacontent);

	public void modify(String daid, String datitle, String daname, String dacontent);

	public void delete(String daid);

	public BoardDto replyView(String daid);

	public void reply(String datitle, String daname, String dacontent,
			int dagroup, int dastep, int daindent);

	public void replyShape(int dagroup, int dastep);

	public int selectBoard2Count();

	public int selectBoardCount(String searchKeyword, String selNum);
	
	public ArrayList<Re_BoardDto> report_board(int rowStart2, int rowEnd2);
	
	public int selectBoard3Count();

	public Re_BoardDto re_contentView(String reid);

	public void re_write(String re_name, String recontent);

	public Re_BoardDto re_replyView(String reid);

	public void re_reply(String retitle, String re_name, String recontent, 
			int regroup, int restep, int reindent);

	public void re_replyShape(int regroup, int restep);

}
