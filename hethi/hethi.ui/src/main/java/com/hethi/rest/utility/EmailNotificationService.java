package com.hethi.rest.utility;

import java.io.File;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hethi.rest.interfaces.NotificationInterface;
import com.hethi.rest.interfaces.WorkflowInterface;

import javax.activation.*;

public class EmailNotificationService {
	
	public boolean sendMail(String to, String subject, String body, String filename) {

		AbstractApplicationContext context = new ClassPathXmlApplicationContext(
				"/spring/hethi-notification-services.xml");
		NotificationInterface test = (NotificationInterface) context.getBean("getNotificationBean");
		return test.notify(to, subject, body, filename);

		// final String user="hareesh.p.balakrishnan@gmail.com";//change
		// accordingly
		// final String password="hareesh";//change accordingly
		// Properties properties = System.getProperties();
		// properties.setProperty("mail.smtp.host", "smtp.gmail.com");
		// properties.put("mail.smtp.starttls.enable", "true");
		// properties.put("mail.smtp.auth", "true");
		//
		// Session session = Session.getDefaultInstance(properties,
		// new javax.mail.Authenticator() {
		// protected PasswordAuthentication getPasswordAuthentication() {
		// return new PasswordAuthentication(user,password);
		// }
		// });
		//
		// try{
		// MimeMessage message = new MimeMessage(session);
		// message.setFrom(new InternetAddress(user));
		// message.addRecipient(Message.RecipientType.TO,new
		// InternetAddress(to));
		// message.setSubject(subject);
		//
		// BodyPart messageBodyPart1 = new MimeBodyPart();
		// messageBodyPart1.setText(body);
		// MimeBodyPart messageBodyPart2 = new MimeBodyPart();
		//
		// DataSource source = new FileDataSource(filename);
		// messageBodyPart2.setDataHandler(new DataHandler(source));
		// messageBodyPart2.setFileName(filename);
		//
		// Multipart multipart = new MimeMultipart();
		// multipart.addBodyPart(messageBodyPart1);
		//
		// File f = new File(filename);
		// if(f.exists() && !f.isDirectory()) {
		// multipart.addBodyPart(messageBodyPart2);
		// }
		// else{
		// System.out.println("File or path invalid...sending mail without
		// attachment...");
		// }
		// message.setContent(multipart );
		// Transport.send(message);
		// System.out.println("message sent....");
		// return true;
		// }
		// catch (MessagingException ex) {ex.printStackTrace();
		// return false;
		// }
	}
}
