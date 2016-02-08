package com.hethi.iaas;

import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;

public class IaasCoreServices {
	
	public  Message<String> iaasSap(String data) {
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Iaas Sap channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Iaas_Sap_channel");
	         String nextQue= "IaaS.Lawson";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}

	public  Message<String> iaasLawson(String data) {
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Iaas Lawson channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Iaas_Lawson_channel");
	         String nextQue= "IaaS.OracleFusion";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> iaasOracleFusion(String data) {
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Iaas Oracle fusion channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Iaas_Oracle_Fusion_channel");
	         String nextQue= "IaaS.BAAN";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> iaasBaan(String data) {
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Iaas baan channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Iaas_Baan_channel");
	         String nextQue= "Staas_Channel";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
}
