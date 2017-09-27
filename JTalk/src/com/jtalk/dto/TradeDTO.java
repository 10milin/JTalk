package com.jtalk.dto;

import java.sql.Timestamp;

public class TradeDTO {
	private int num;
	private String title;
	private String photo;
	private String content;
	private String writerID;
	private String writerName;
	private String phone;
	private String price;
	private Timestamp writeDate;
	
	public TradeDTO() {}
	
	public TradeDTO(int num, String title, String photo, String content, String writerID, String writerName, String phone, String price,
			Timestamp writeDate) {
		super();
		this.num = num;
		this.title = title;
		this.photo = photo;
		this.content = content;
		this.writerID = writerID;
		this.writerName = writerName;
		this.phone = phone;
		this.price = price;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriterID() {
		return writerID;
	}

	public void setWriterID(String writerID) {
		this.writerID = writerID;
	}
	
	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
	
}
