package com.jtalk.core;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MemberCore {
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
		final String fromEmail = "jtalkmaster@gmail.com";
		final String password = "jsl1q2w3e";
		final String toEmail = email;
		
		String subject = "JTalk 회원 인증 메일";
		String content = "<a href = 'http://localhost:8181/JTalk/pages/auth/action.html?"
				+ "email=" + email + "&link=" + link + "' target='_blank'>회원 인증</a>";
		try {
			Properties props = new Properties();
			// SSL 사용하는 경우
			props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
			props.put("mail.smtp.socketFactory.port", "465"); //SSL Port
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
			props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
			props.put("mail.smtp.port", "465"); //SMTP Port
			
			Authenticator auth = new Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(fromEmail, password);
	            }
	        };
	        
			Session session = Session.getInstance(props, auth);
			
			MimeMessage msg = new MimeMessage(session);
			msg.addHeader("Content-type", "text/html; charset = UTF-8");
			msg.addHeader("format", "flowed");
			msg.addHeader("Content-Transfer-Encoding", "8bit");
			
			msg.setFrom(new InternetAddress(fromEmail, "관리자"));
			
			msg.setSubject(subject, "UTF-8");
			msg.setContent(content, "text/html; charset = UTF-8");
			msg.setSentDate(new java.util.Date());
			
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
			Transport.send(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
