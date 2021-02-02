package com.tech.main.dto;

import java.sql.Timestamp;

public class FaqBoardDto {
	private int daid;
	private String datitle;
	private String daname;
	private String dacontent;
	private Timestamp dadate;
	public FaqBoardDto() {
		// TODO Auto-generated constructor stub
	}
	
	public FaqBoardDto(int daid, String datitle, String daname, String dacontent, Timestamp dadate) {
		super();
		this.daid = daid;
		this.datitle = datitle;
		this.daname = daname;
		this.dacontent = dacontent;
		this.dadate = dadate;
	}
	public int getDaid() {
		return daid;
	}
	public void setDaid(int daid) {
		this.daid = daid;
	}
	public String getDatitle() {
		return datitle;
	}
	public void setDatitle(String datitle) {
		this.datitle = datitle;
	}
	public String getDaname() {
		return daname;
	}
	public void setDaname(String daname) {
		this.daname = daname;
	}
	public String getDacontent() {
		return dacontent;
	}
	public void setDacontent(String dacontent) {
		this.dacontent = dacontent;
	}
	public Timestamp getDadate() {
		return dadate;
	}
	public void setDadate(Timestamp dadate) {
		this.dadate = dadate;
	}
	
	
}
