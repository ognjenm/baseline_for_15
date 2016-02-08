package com.hethi.oaas;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;



public class DataDelivery {
	public  Message<String> deliverData(String data) {
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println("inside data delivery channel method oaas.");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside  data delivery_channel oaas");
	         String nextQue= "exit_channel";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
		
	}
	

}
