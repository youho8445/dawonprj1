package com.tech.main.dao;

import java.util.ArrayList;

import com.tech.main.dto.JoinDto;

public interface ManagerDao {

	public int selectBoardCount(String searchKeyword3, String selNum);

	public ArrayList<JoinDto> memberlist(int rowStart, int rowEnd, String sKeyword, String selNum);

	public void managerdel(String memberseq);

	public JoinDto info(String memberid);

	
	


	
}
