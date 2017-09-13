package com.jtalk.dto;

import java.sql.Timestamp;

public class CommentDTO {
	private String tableName;
	private int postNum;
	private int num;
	private String writerId;
	private String writerName;
	private String content;
	private Timestamp writeDate;
	
	public CommentDTO() {}

	public CommentDTO(String tableName, int postNum, int num, String writerId, String writerName, String content,
			Timestamp writeDate) {
		this.tableName = tableName;
		this.postNum = postNum;
		this.num = num;
		this.writerId = writerId;
		this.writerName = writerName;
		this.content = content;
		this.writeDate = writeDate;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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
	
}
