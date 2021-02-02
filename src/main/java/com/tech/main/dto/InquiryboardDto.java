package com.tech.main.dto;

import java.sql.Timestamp;

public class InquiryboardDto {
	
	private int daid;
	private String datitle;
	private String daname;
	private String dacontent;
	private Timestamp dadate;
	private int dahit;
	private int dagroup;
	private int dastep;
	private int daindent;
	
	public InquiryboardDto() {
		// TODO Auto-generated constructor stub
	}
	public InquiryboardDto(int daid, String datitle, String daname, String dacontent, Timestamp dadate, int dahit, int dagroup,
			int dastep, int daindent) {
		super();
		this.daid = daid;
		this.datitle = datitle;
		this.daname = daname;
		this.dacontent = dacontent;
		this.dadate = dadate;
		this.dahit = dahit;
		this.dagroup = dagroup;
		this.dastep = dastep;
		this.daindent = daindent;
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

	public int getDahit() {
		return dahit;
	}

	public void setDahit(int dahit) {
		this.dahit = dahit;
	}

	public int getDagroup() {
		return dagroup;
	}

	public void setDagroup(int dagroup) {
		this.dagroup = dagroup;
	}

	public int getDastep() {
		return dastep;
	}

	public void setDastep(int dastep) {
		this.dastep = dastep;
	}

	public int getDaindent() {
		return daindent;
	}

	public void setDaindent(int daindent) {
		this.daindent = daindent;
	}

	

}
