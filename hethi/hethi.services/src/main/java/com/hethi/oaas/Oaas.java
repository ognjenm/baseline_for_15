package com.hethi.oaas;

import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;

public class Oaas {
	public  Message<String> oaas(String data) {
		
		 String messageContent=data;
		 Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Oaas channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Oaas_channel");
	         String nextQue= "OaaS.HML";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}

}
