package com.tech.main.dao;

import java.util.ArrayList;

import com.tech.main.dto.FaqBoardDto;
import com.tech.main.dto.InquiryboardDto;

public interface FaqDao {

	public int selectBoardCount(String searchKeyword, String selNum);


	public ArrayList<InquiryboardDto>inquiry(int rowStart, int rowEnd, String sKeyword, String selNum);

	public InquiryboardDto InquiryView(String daid);


	public void Inquirywrite(String datitle, String daname, String dacontent);

	public void Inquirymodify(String daid, String datitle, String daname, String dacontent);

	public void Inquirydelete(String daid);

	public InquiryboardDto InquiryReplyView(String daid);

	public void InquiryReply(String datitle, String daname, String dacontent, int dagroup, int dastep, int daindent);

	public void InquiryReplyShape(int dagroup, int dastep);


	
}
