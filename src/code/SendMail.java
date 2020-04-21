package code;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


public class SendMail {

	public boolean SendMails(String recepient,String subject,String message) {
				
		final String fromAddress="rajeshc2245@gmail.com";
		final String password="9490858687";
		
		Properties proper=new Properties();
		proper.put("mail.smtp.host","smtp.gmail.com");
		proper.put("mail.smtp.ssl.enable","true");
		proper.put("mail.smtp.auth","true");
		
		Session sess=Session.getInstance(proper, new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromAddress,password);				
			}
		});
		
		Message mess=new MimeMessage(sess);
		try {
			mess.setFrom(new InternetAddress(fromAddress));
			mess.setRecipient(RecipientType.TO, new InternetAddress(recepient));
			mess.setContent(message,"text/plain");
			mess.setSubject(subject);
			
			Transport.send(mess);
			return true;
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	
		return false;
	}
	
}
