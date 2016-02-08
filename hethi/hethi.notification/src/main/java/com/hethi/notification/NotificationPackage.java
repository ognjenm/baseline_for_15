

package com.hethi.notification;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.codec.binary.Base64;
import org.springframework.util.Base64Utils;


public class NotificationPackage implements NotificationInterface {
//    public String notify(String data) {
//	
//		System.out.println("inside notification services");
//		System.out.println(data);
//		String to,subject,body,filename;
//		to=
//		
//		this.sendMail(to, subject, body, filename);
//		return data;
//	 
//    }
    
    public boolean notify(String to,String subject,String body,String filename){
    	
    	String cryptedEmail="aGV0aGl0ZXN0MkBnbWFpbC5jb20=";		//"Y3Jvbnljb2RldmVsb3BlcnNAZ21haWwuY29t";
    	String cryptedPass="aGV0aGl0ZXN0bWFpbA==";		//"Y3JvbnljbzIwMTI=";
		byte[] emailByte= Base64.decodeBase64(cryptedEmail.getBytes());    	
		byte[] passByte= Base64.decodeBase64(cryptedPass.getBytes());
		
		final String user=new String(emailByte);		
	    final String password=new String(passByte);
	    
	    
	    
//		final String user="cronycodevelopers@gmail.com";//change accordingly  
//	    final String password="xxxxxxxx";//change accordingly  
	    
	    
	    Properties properties = System.getProperties();  
	    properties.setProperty("mail.smtp.host", "smtp.gmail.com"); 
	    properties.put("mail.smtp.starttls.enable", "true");
	    properties.put("mail.smtp.auth", "true");  
	  
	    Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	    	protected PasswordAuthentication getPasswordAuthentication() {  
	           return new PasswordAuthentication(user,password);  
	        }  
	    });  

	    try{
	        MimeMessage message = new MimeMessage(session);  
	        message.setFrom(new InternetAddress(user));  
	        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	        message.setSubject(subject);  
//	        message.setContent(body, "text/html");
	        BodyPart messageBodyPart1 = new MimeBodyPart(); 
	        messageBodyPart1.setContent(body, "text/html");
//	        messageBodyPart1.setText(body);  
	        
	    
	        Multipart multipart = new MimeMultipart();  
	        multipart.addBodyPart(messageBodyPart1);  
	    
	        File f = new File(filename);
	        if(f.exists() && !f.isDirectory()) { 
	        	MimeBodyPart messageBodyPart2 = new MimeBodyPart(); 	            
		        DataSource source = new FileDataSource(filename);  
		        messageBodyPart2.setDataHandler(new DataHandler(source));  
		        messageBodyPart2.setFileName(filename);  
	        	multipart.addBodyPart(messageBodyPart2);  
	        }
	        else{
	    	   System.out.println("sending mail without attachment...");
	        }
	        message.setContent(multipart );  
	        Transport.send(message);  
	        System.out.println("message sent to "+to); 
	        return true;
	    }
        catch (MessagingException ex) {
        	 System.out.println("unable to send message to "+to);
        	ex.printStackTrace();
        
	    return false;
	  }  
   }
}