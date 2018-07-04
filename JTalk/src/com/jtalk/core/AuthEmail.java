package com.jtalk.core;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

public class AuthEmail {
	
	private static HttpServletRequest request;
	
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
	
	public static void send(String email, String name, String input, String command) throws Exception {
		final String fromEmail = "jtalkmaster@gmail.com";
		final String password = "jsl1q2w3e";
		final String toEmail = email;
		String subject = null;
		String content = null;
		String logo = "https://i.imgur.com/qQTkKor.png";
		String team = "KLM Studio";

		if(command.equals("insert")) {
			
			String ip = getCurrentEnvironmentNetworkIp(); // 현재 IP가져오기
			
			//String ip = getWebIp(); //공인IP 가져오기
			String port = String.valueOf(request.getLocalPort());
			String url = "http://" + ip +":" + port +"/JTalk/pages/auth/auth.html?email=" + email + "&link=" + input;
			subject = "[J-Talk] 이메일 주소를 인증하세요.";
			content = "<center><table cellpadding='8' cellspacing='0' style='*width: 540px; padding: 0; width: 100% !important; background: #ffffff; margin: 0; background-color: #ffffff;'border='0'><tbody><tr><td valign='top'><table align='center'cellpadding='0'cellspacing='0'style='border-radius: 4px; -webkit-border-radius: 4px; border: 1px #dceaf5 solid; -moz-border-radius: 4px;'border='0'><tbody><tr><td colspan='3'height='6'></td></tr><tr style='line-height: 0px;'><td align='center'width='100%'style='font-size: 0px;'height='1'><img width='250px'style='max-height: 93px;width: 250px; margin-top: 30px;'src='" + logo+ "'></td></tr><tr><td><table align='center'cellpadding='0'cellspacing='0'style='line-height: 25px;'border='0'><tbody><tr><td colspan='3'height='30'></td></tr><tr><td width='36'></td><td align='left'valign='top'width='454'style='color: #444444; border-collapse: collapse; font-size: 11pt; max-width: 454px;'>안녕하세요, " + name+ "님<br><br>J-Talk 서비스를 이용하려면 먼저 이메일 주소를 인증해야 합니다.<br><br><center><a style='border-radius: 3px; font-size: 15px; color: white; border: 1px #1373b5 solid; box-shadow: inset 0 1px 0 #6db3e6, inset 1px 0 0 #48a1e2; text-decoration: none; padding: 14px 7px 14px 7px; : 210px; max-: 210px; margin: 6px auto; display: block; background-color: #007ee6; text-align: center;'href='" + url +  "' target='_blank'>이메일 인증</a></center><br>감사합니다.<br>" + team + "팀 드림</td><td width='36'></td></tr><tr><td colspan='3'height='36'></td></tr></tbody></table></td></tr></tbody></table><table align='center'cellpadding='0'cellspacing='0'border='0'><tbody><tr><td height='10'></td></tr><tr><td style='padding: 0; border-collapse: collapse;'><table align='center'cellpadding='0'cellspacing='0'border='0'><tbody><tr style='color: #a8b9c6; font-size: 11px; font-family: proxima_nova, Arial, Verdana, Sans Serif; -webkit-text-size-adjust: none;'><td align='left' width='400'></td><td align='right' width='128'>©2017 J-Talk</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></center>";
		}else if(command.equals("find")) {
			subject = "[J-Talk] 임시 비밀번호를 안내드립니다.";
			content = "<center><table cellpadding='8' cellspacing='0' style='*width: 540px; padding: 0; width: 100% !important; background: #ffffff; margin: 0; background-color: #ffffff;'border='0'><tbody><tr><td valign='top'><table align='center'cellpadding='0'cellspacing='0'style='border-radius: 4px; -webkit-border-radius: 4px; border: 1px #dceaf5 solid; -moz-border-radius: 4px;'border='0'><tbody><tr><td colspan='3'height='6'></td></tr><tr style='line-height: 0px;'><td align='center'width='100%'style='font-size: 0px;'height='1'><img width='250px'style='max-height: 93px;width: 250px; margin-top: 30px;'src='" + logo+ "'></td></tr><tr><td><table align='center'cellpadding='0'cellspacing='0'style='line-height: 25px;'border='0'><tbody><tr><td colspan='3'height='30'></td></tr><tr><td width='36'></td><td align='left'valign='top'width='454'style='color: #444444; border-collapse: collapse; font-size: 11pt; max-width: 454px;'>안녕하세요, " + name+ "님<br><br>회원님의 요청에 따라 J-Talk계정의 임시비밀번호를 보내 드립니다.<br><br>임시 비밀번호 : "+ input + "</center><br><br>고객님 본인이 보낸 이력이 아닐 경우, 문의 부탁드립니다.<br>보다 안전하고 편리한 서비스를 만들기 위해 항상 노력하겠습니다.<br><br>감사합니다.<br>" + team + "팀 드림</td><td width='36'></td></tr><tr><td colspan='3'height='36'></td></tr></tbody></table></td></tr></tbody></table><table align='center'cellpadding='0'cellspacing='0'border='0'><tbody><tr><td height='10'></td></tr><tr><td style='padding: 0; border-collapse: collapse;'><table align='center'cellpadding='0'cellspacing='0'border='0'><tbody><tr style='color: #a8b9c6; font-size: 11px; font-family: proxima_nova, Arial, Verdana, Sans Serif; -webkit-text-size-adjust: none;'><td align='left' width='400'></td><td align='right' width='128'>©2017 J-Talk</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></center>";
		}
		
		try {
			Properties props = new Properties();
			// SSL 사용하는 경우
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.auth","true");
			props.put("mail.smtp.port", "587");
			
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
			
			msg.setFrom(new InternetAddress(fromEmail, "J-TALK"));
			
			msg.setSubject(subject, "UTF-8");
			msg.setContent(content, "text/html; charset = UTF-8");
			msg.setSentDate(new java.util.Date());
			
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
			Transport.send(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static HttpServletRequest getRequest() {
		return request;
	}

	public static void setRequest(HttpServletRequest request) {
		AuthEmail.request = request;
	}
	
	public static String getCurrentEnvironmentNetworkIp(){
        Enumeration netInterfaces = null;
        try {
            netInterfaces = NetworkInterface.getNetworkInterfaces();
        } catch (SocketException e) {
            return getLocalIp();
        }

        while (netInterfaces.hasMoreElements()) {
            NetworkInterface ni = (NetworkInterface)netInterfaces.nextElement();
            Enumeration address = ni.getInetAddresses();
            if (address == null) {
                return getLocalIp();
            }
            while (address.hasMoreElements()) {
                InetAddress addr = (InetAddress)address.nextElement();
                if (!addr.isLoopbackAddress() && !addr.isSiteLocalAddress() && !addr.isAnyLocalAddress() ) {
                    String ip = addr.getHostAddress();
                    if( ip.indexOf(".") != -1 && ip.indexOf(":") == -1 ){
                        return ip;
                    }
                }
            }
        }
        return getLocalIp();
    }

    public static String getLocalIp(){
        try {
            return InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException e) {
            return null;
        }
    }

    public static String getWebIp() {
    	String ip = null;
		
		try (java.util.Scanner s = new java.util.Scanner(new java.net.URL("https://api.ipify.org").openStream(), "UTF-8").useDelimiter("\\A")) {
			ip = s.next();
		} catch (java.io.IOException e) {
		    e.printStackTrace();
		}
		return ip;
    }
}
