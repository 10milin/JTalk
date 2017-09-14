package com.jtalk.dto;

public class NewCommentDTO {
	private String tableName;
	private int postNum;
	private String email;
	private int newCount;
	
	public NewCommentDTO(String tableName, int postNum, String email) {
		this.tableName = tableName;
		this.postNum = postNum;
		this.email = email;
	}
	
	public NewCommentDTO(String tableName, int postNum, String email, int newCount) {
		this.tableName = tableName;
		this.postNum = postNum;
		this.email = email;
		this.newCount = newCount;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getNewCount() {
		return newCount;
	}

	public void setNewCount(int newCount) {
		this.newCount = newCount;
	}
	
}
