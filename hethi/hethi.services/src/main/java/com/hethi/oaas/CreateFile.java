package com.hethi.oaas;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;



public class CreateFile {
	public  Message<String> createDocument(String data) {
		 Message<String> msg;
		 String messageContent=data;
		 String fileName,filePath;
		 JSONParser parser=new JSONParser();	 
			Object obj;
			try {
				obj = parser.parse(data);
				JSONObject jsonObject = (JSONObject) obj;
				fileName=jsonObject.get("clientID").toString()+"_"+jsonObject.get("industry").toString().toLowerCase()+"_"+jsonObject.get("document").toString().toLowerCase()+".json";
				filePath="src/main/resources/"+fileName;
		
			 File file= new File(filePath);        
		        if(file.exists()){
		            file.createNewFile();
		        }        
		     
		        
		        
		         String SEPARATOR = "-----------------------";
				 System.out.println(" \n ");
				 System.out.println(""+SEPARATOR);
				 System.out.println("inside cretate document channel ");
				 System.out.println(""+SEPARATOR);
				 System.out.println("document successfully created "); 		 
				 System.out.println(""+SEPARATOR);
				 System.out.println("file successfully saved at "+filePath); 		 
				 System.out.println(""+SEPARATOR);
				 System.out.println(" \n ");
				 
				 JSONObject json_ob =new JSONObject();
				 json_ob.put("fileName",fileName);
				 json_ob.put("filePath",filePath);
				 json_ob.put("fileContent",data);				 
				 String content=json_ob.toJSONString();	
				  iPost ipost=new iPost(data);
			         ipost.stackDescription("inside  document_create_channel");
			         String nextQue= "data_delivery_channel";
				        String datas = ipost.toString();
				        msg= MessageBuilder.withPayload(datas)
			                 .setHeader("NextQue",nextQue)
			                 .build();
				 return msg;
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		 
		 
		return null;
		
	}
	

}
