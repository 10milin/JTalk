package com.jtalk.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String email;
	private String pass;
	private String name;
	private int period;
	private String ban;
	private String active;
	private String link;
	private Timestamp registerDate;
	private String profile;
	private String pr;
	
	public MemberDTO(String email, String pass, String name, int period, String ban, String active, String link,
			Timestamp registerDate, String profile, String pr) {
		this.email = email;
		this.pass = pass;
		this.name = name;
		this.period = period;
		this.ban = ban;
		this.active = active;
		this.link = link;
		this.registerDate = registerDate;
		this.profile = profile;
		this.pr = pr;
	}

	public MemberDTO(String email, String pass, String name, int period, String link) {
		this.email = email;
		this.pass = pass;
		this.name = name;
		this.period = period;
		this.link = link;
	}

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public String getBan() {
		return ban;
	}

	public void setBan(String ban) {
		this.ban = ban;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getPr() {
		return pr;
	}

	public void setPr(String pr) {
		this.pr = pr;
	}
}
