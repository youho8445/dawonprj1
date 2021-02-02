package com.tech.main.dto;

import java.sql.Timestamp;

public class NoteDto {
	private int nonum;
	private String sendnick;
	private String takenick;
	private String title;
	private String content;
	private Timestamp notedate;
	private int notecheck;
	
	public NoteDto() {
		// TODO Auto-generated constructor stub
	}
	
	public NoteDto(int nonum, String sendnick, String takenick, String title, String content, Timestamp notedate,
			int notecheck) {
		super();
		this.nonum = nonum;
		this.sendnick = sendnick;
		this.takenick = takenick;
		this.title = title;
		this.content = content;
		this.notedate = notedate;
		this.notecheck = notecheck;
	}
	public int getNonum() {
		return nonum;
	}
	public void setNonum(int nonum) {
		this.nonum = nonum;
	}
	public String getSendnick() {
		return sendnick;
	}
	public void setSendnick(String sendnick) {
		this.sendnick = sendnick;
	}
	public String getTakenick() {
		return takenick;
	}
	public void setTakenick(String takenick) {
		this.takenick = takenick;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getNotedate() {
		return notedate;
	}
	public void setNotedate(Timestamp notedate) {
		this.notedate = notedate;
	}
	public int getNotecheck() {
		return notecheck;
	}
	public void setNotecheck(int notecheck) {
		this.notecheck = notecheck;
	}
	
	
	
	
	
	
	
}
