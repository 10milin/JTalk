package com.jtalk.dto;

import java.sql.Timestamp;

public class AnonyDTO {
	private int num;
	private String content;
	private Timestamp writeDate;
	private int awesome;
	
	public AnonyDTO() {
	
	}

	public AnonyDTO(int num, String content, Timestamp writeDate, int awesome) {
		super();
		this.num = num;
		this.content = content;
		this.writeDate = writeDate;
		this.awesome = awesome;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public int getAwesome() {
		return awesome;
	}
	public void setAwesome(int awesome) {
		this.awesome = awesome;
	}
	
}
