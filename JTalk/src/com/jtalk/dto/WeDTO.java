package com.jtalk.dto;

import java.sql.Timestamp;

public class WeDTO {
	private int num;
	private String title;
	private String content;
	private String writerId;
	private String writerName;
	private String fileName;
	private String originFileName;
	private Timestamp writeDate;
	private int hit;
	private int period;
	
	public WeDTO() {}
	
	public WeDTO(int num, String title, String content, String writerId, String writerName, String fileName, String originFileName,
			Timestamp writeDate, int hit) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.writerId = writerId;
		this.writerName = writerName;
		this.fileName = fileName;
		this.originFileName = originFileName;
		this.writeDate = writeDate;
		this.hit = hit;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}
	
	
	
}
