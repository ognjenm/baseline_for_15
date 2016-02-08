package com.hethi.commonfunctions;

import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;

public class ExitWorkflow {
	
	public  Message<String> exit_from_workflow(String data) {
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println("inside exit_channel method exit_from_workflow ");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside exit_channel method exit_from_workflow ");
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .build();
		 return msg;
		
	}

}
