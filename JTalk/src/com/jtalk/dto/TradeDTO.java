package com.jtalk.dto;

import java.sql.Timestamp;

public class TradeDTO {
	private int num;
	private String title;
	private String photo;
	private String originphoto;
	private String content;
	private String isSoldout;
	private String writerID;
	private String writerName;
	private String phone;
	private String price;
	private Timestamp writeDate;
	private int hit;
	
	public TradeDTO() {}
	
	public TradeDTO(int num, String title, String photo, String originphoto, String content, String isSoldout,
			String writerID, String writerName, String phone, String price, Timestamp writeDate) {
		this.num = num;
		this.title = title;
		this.photo = photo;
		this.originphoto = originphoto;
		this.content = content;
		this.isSoldout = isSoldout;
		this.writerID = writerID;
		this.writerName = writerName;
		this.phone = phone;
		this.price = price;
		this.writeDate = writeDate;
	}

	public String getOriginphoto() {
		return originphoto;
	}

	public void setOriginphoto(String originphoto) {
		this.originphoto = originphoto;
	}

	public String getIsSoldout() {
		return isSoldout;
	}

	public void setIsSoldout(String isSoldout) {
		this.isSoldout = isSoldout;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
