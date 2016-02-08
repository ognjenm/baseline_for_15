package com.hethi.staas;

import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;

public class Staas {
	
	public  Message<String> staas(String data) {
		

		 Message<String> msg;
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println("Inside Staas channel method");
		 System.out.println(""+SEPARATOR);	
		 System.out.println("data messaged to Staas_Que");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+data);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("Inside_Staas");
	         String nextQue= "StaaS.MetaData";//create_document_channel
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
		
	}

}
