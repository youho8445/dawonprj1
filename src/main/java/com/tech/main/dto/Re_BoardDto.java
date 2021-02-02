package com.tech.main.dto;

import java.sql.Timestamp;

public class Re_BoardDto {
	
	private int reid;
	private String retitle;
	private String re_name;
	private String recontent;
	private Timestamp redate;
	private int rehit;
	private int regroup;
	private int restep;
	private int reindent;
	
	public Re_BoardDto() {
		// TODO Auto-generated constructor stub
	}

	public Re_BoardDto(int reid, String retitle, String re_name, String recontent, Timestamp redate, int rehit,
			int regroup, int restep, int reindent) {
		super();
		this.reid = reid;
		this.retitle = retitle;
		this.re_name = re_name;
		this.recontent = recontent;
		this.redate = redate;
		this.rehit = rehit;
		this.regroup = regroup;
		this.restep = restep;
		this.reindent = reindent;
	}

	public int getReid() {
		return reid;
	}

	public void setReid(int reid) {
		this.reid = reid;
	}

	public String getRetitle() {
		return retitle;
	}

	public void setRetitle(String retitle) {
		this.retitle = retitle;
	}

	public String getRe_name() {
		return re_name;
	}

	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public Timestamp getRedate() {
		return redate;
	}

	public void setRedate(Timestamp redate) {
		this.redate = redate;
	}

	public int getRehit() {
		return rehit;
	}

	public void setRehit(int rehit) {
		this.rehit = rehit;
	}

	public int getRegroup() {
		return regroup;
	}

	public void setRegroup(int regroup) {
		this.regroup = regroup;
	}

	public int getRestep() {
		return restep;
	}

	public void setRestep(int restep) {
		this.restep = restep;
	}

	public int getReindent() {
		return reindent;
	}

	public void setReindent(int reindent) {
		this.reindent = reindent;
	}
	

}
