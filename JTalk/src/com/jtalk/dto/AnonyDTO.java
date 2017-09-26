package com.jtalk.dto;

import java.sql.Timestamp;

public class AnonyDTO {
	private int num;
	private String writerId;
	private String content;
	private Timestamp writeDate;
	
	public AnonyDTO() {
	
	}

	public AnonyDTO(int num, String writerId, String content, Timestamp writeDate) {
		super();
		this.num = num;
		this.writerId = writerId;
		this.content = content;
		this.writeDate = writeDate;
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
	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	
	
}
