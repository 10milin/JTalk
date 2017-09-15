package com.jtalk.dto;

import java.sql.Timestamp;

public class MessageDTO {
	private int num;
	private String title;
	private String content;
	private String sendId;
	private String sendName;
	private String receiveId;
	private Timestamp writeDate;
	private String read;
	
	public MessageDTO(String title, String content, String sendId, String sendName, String receiveId) {
		this.title = title;
		this.content = content;
		this.sendId = sendId;
		this.sendName = sendName;
		this.receiveId = receiveId;
	}

	public MessageDTO(int num, String title, String content, String sendId, String sendName, String receiveId,
			Timestamp writeDate, String read) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.sendId = sendId;
		this.sendName = sendName;
		this.receiveId = receiveId;
		this.writeDate = writeDate;
		this.read = read;
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

	public String getSendId() {
		return sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
	}

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName;
	}

	public String getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}
}
