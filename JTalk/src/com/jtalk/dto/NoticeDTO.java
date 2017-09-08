package com.jtalk.dto;

import java.sql.Date;

public class NoticeDTO {
	private int num;
	private String title;
	private String content;
	private String writerId;
	private String writerName;
	private String fileName;
	private Date writeDate;
	
	public NoticeDTO() {}
	
	public NoticeDTO(int num, String title, String content, String writerId, String writerName, String fileName,
			Date writeDate) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.writerId = writerId;
		this.writerName = writerName;
		this.fileName = fileName;
		this.writeDate = writeDate;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
}
