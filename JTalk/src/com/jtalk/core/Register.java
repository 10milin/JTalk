package com.jtalk.core;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class Register {
	public static String makeCode(String email) {
		String md5 = "";
		
		try{
			MessageDigest md = MessageDigest.getInstance("MD5"); 

			md.update(email.getBytes()); 

			byte byteData[] = md.digest();

			StringBuffer sb = new StringBuffer(); 

			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			
			md5 = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			md5 = null; 
		}
		return md5;
	}
	
	public static void send(String email, String link) {
		String host = "smtp.gmail.com";
		String subject = "JTalk 회원 인증 메일";
		String fromName = "JTalk Administrator";
		String from = "jtalkmaster@gmail.com";
		String to1 = email;
		
		String content = "<a href = 'http://localhost:8181/JTalk/auth.action?"
				+ "email=" + email + "&link=" + link + "'>회원 인증</a>";
		try {
			Properties props = new Properties();
			props.put("mail.stmp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, "jsl1q2w3e");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html; charset = utf-8");
			
			Transport.send(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
