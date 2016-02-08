

package com.hethi.utils;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.messaging.support.MessageBuilder;

import com.google.gson.Gson;

import com.hethi.domain.iPost;


public class Hethi_ServiceInterfacePackage implements Hethi_SeviceInterface {
	
	public String startProcess(String data) {
		
		String response="null";
    	
    	 System.out.println("recieveid data : " + data);
    	
    	 ApplicationContext context = new ClassPathXmlApplicationContext("/sp/core/hethi-context.xml");		        
	        // Create new document here 
	    
    	 InboundGateway document = context.getBean("inboundGateway",InboundGateway.class);
    	 
	        
	        
	        JSONObject json;
			try {
				
				json = (JSONObject)new JSONParser().parse(data);			
				
			String customer_id =json.get("customer_id").toString();
			String efs_uin =json.get("efs_uin").toString();
			String sfs_uin =json.get("sfs_uin").toString();
			String current_channel =json.get("current_channel").toString();
			String din="1";
			String uid="1";
			int version=1;
			String user_id="RNT01";
			System.out.println("data pushing to : " + current_channel);
			
			
//			String msg="{\"customer_id\":\"\",\"tfs_uin\":\"\",\"efs_uin\":\"\",\"sfs_uin\":\"\",\"current_channel\":\"\",\"next_queue\":\"\",\"next_channel\":\"\",\"exception_queue\":\"\",\"exception_channel\":\"\",\"uid\":\"\",\"din\":\"\",\"version\":\"\",\"source_document_path_http\":\"\",\"source_document_path_local\":\"\",\"document_name\":\"\",\"description\":\" \",\"user_id\":\"runtime\"}";
			
			
			
			
			
			
			
			
			
			//assign json to class 
//			iPost ipost = new Gson().fromJson(msg, iPost.class);
			
			
	        iPost ipost=new iPost();
	        ipost.log("New Web Request Recieved ");
	        ipost.setCustomer_id(customer_id);
	        ipost.setEfs_uin(efs_uin);
	        ipost.setSfs_uin(sfs_uin);
	        ipost.setCurrent_channel(current_channel);
	        ipost.setNext_channel(current_channel);
	        ipost.setNext_queue(sfs_uin);
	        ipost.setDin(din);
	        ipost.setUid(uid);
	        ipost.setVersion(version);
	        ipost.setUser_id(user_id);
	        

	        
	     
	       org.springframework.messaging.Message   <String> messageData= MessageBuilder.withPayload( ipost.toString())
              .setHeader("NextQue",current_channel)
              .build();
	       
	       response = document.post(messageData);
	        System.out.println("\n response : " + response);
    	
	      return response;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "Failed to read json data";
			}
    }
}