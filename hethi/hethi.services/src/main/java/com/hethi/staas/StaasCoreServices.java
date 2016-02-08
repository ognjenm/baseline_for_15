package com.hethi.staas;

import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;

public class StaasCoreServices {

		public  Message<String> staasMetaData(String data) {
			

			 Message<String> msg;
			 String SEPARATOR = "-----------------------";
			 System.out.println(" \n ");
			 System.out.println(""+SEPARATOR);
			 System.out.println("Inside Staas Meta Data channel method");
			 System.out.println(""+SEPARATOR);	
			 System.out.println("data messaged to Staas_Que");
			 System.out.println(""+SEPARATOR);
			 System.out.println("messageContent :"+data);			 
			 System.out.println(""+SEPARATOR);
			 System.out.println(" \n ");
			 System.out.println(" \n ");
			 
			  iPost ipost=new iPost(data);
		         ipost.stackDescription("Inside_Staas_MetaData");
		         String nextQue= "StaaS.Image";
			        String datas = ipost.toString();
			        msg= MessageBuilder.withPayload(datas)
		                 .setHeader("NextQue",nextQue)
		                 .build();
			 return msg;
			
		}
		
			
			public  Message<String> staasImage(String data) {
				

				 Message<String> msg;
				 String SEPARATOR = "-----------------------";
				 System.out.println(" \n ");
				 System.out.println(""+SEPARATOR);
				 System.out.println("Inside Staas Image channel method");
				 System.out.println(""+SEPARATOR);	
				 System.out.println("data messaged to Staas_Que");
				 System.out.println(""+SEPARATOR);
				 System.out.println("messageContent :"+data);			 
				 System.out.println(""+SEPARATOR);
				 System.out.println(" \n ");
				 System.out.println(" \n ");
				 
				  iPost ipost=new iPost(data);
			         ipost.stackDescription("Inside_Staas_Image");
			         String nextQue= "Aaas_Channel";
				        String datas = ipost.toString();
				        msg= MessageBuilder.withPayload(datas)
			                 .setHeader("NextQue",nextQue)
			                 .build();
				 return msg;
				
			}

}
