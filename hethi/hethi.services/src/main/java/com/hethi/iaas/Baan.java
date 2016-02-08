package com.hethi.iaas;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.drools.KnowledgeBase;
import org.drools.runtime.StatefulKnowledgeSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;
import com.hethi.utils.RuleExecutors;
import com.hethi.utils.ServicePlayQueue;

public class Baan {
	
	public  Message<String> Baan(String data) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException  {
		 String messageContent=data;
		 Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 String log=SEPARATOR+" inside_iaas_Baan_channel "+SEPARATOR;
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(log);
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		    iPost ipost=new iPost(data);
	        ipost.stackDescription(log);
	        ipost.setSfs_uin(ipost.getNext_queue());
	        ipost.setCurrent_channel(ipost.getNext_channel());
	        
			String next_channel= "exit_channel";		
			ipost.setNext_channel(next_channel);
			
			
			ServicePlayQueue pq =new ServicePlayQueue();
			String result=pq.NextServicePlay(ipost.toString());
			

		
		JSONArray jsonArray=(JSONArray)new JSONParser().parse(result);
		

		JSONArray responseOne=(JSONArray)jsonArray.get(0); //current queue, next queue, exception queue
		JSONArray responseTwo=(JSONArray)jsonArray.get(1); //rules to apply for this queue (array);
		
		JSONObject queueJson=(JSONObject)responseOne.get(0);
		System.out.println(" queueJson :" +queueJson.toString());
		System.out.println(" ruleJson :" +responseTwo.toString());
		
		String response=queueJson.get("result").toString();
		
		if(response.equalsIgnoreCase("Success")){		    
				  
				  next_channel=queueJson.get("next_channel").toString();
				  String next_queue=queueJson.get("next_queue").toString();
				  
				  String exception_channel=queueJson.get("exception_channel").toString();	
				  String exception_queue=queueJson.get("exception_queue").toString();
				  
				  if(next_queue != null && !next_queue.isEmpty()){
					  
					  ipost.setNext_queue(next_queue);
					  ipost.setNext_channel(next_channel);
				  }
				  
				  if(exception_queue != null && !exception_queue.isEmpty()){
					  
					  ipost.setException_queue(exception_queue);
					  ipost.setException_channel(exception_channel);
				  }
				 	  			  
				  
		}
		else
		{		
			ipost.stackDescription("No next proceess found from database");				
		}

		Configuration config=new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		SessionFactory factory=config.buildSessionFactory();
		Session session=factory.openSession();
		Transaction trans=session.beginTransaction();
		String queryOutput= "[{\"result\":\"No data\"}]";
		
//		reading all  objects for form 
		
		ArrayList<String> formObjList=pq.listFilesToInsert(ipost.getEfs_uin());
		ArrayList<Object> formObjects= new ArrayList<Object>();
		 
		String importFormsPackage="";
		
		int formObjCount=0;
		while(formObjCount<formObjList.size()){		
			
			
			String fileName=formObjList.get(formObjCount).toString();		
			String className = "com.hethi.rest.model."+fileName;
			importFormsPackage=importFormsPackage+"import "+className+"; \n";
			Object classObj = Class.forName(className).newInstance();
			String hql="from "+fileName.toLowerCase()+" where din=:Din   order by  version  desc , lastupdtm  desc ";
			Query queryResult = session.createQuery(hql);
			queryResult.setMaxResults(1);
			queryResult.setParameter("Din", "1");
			List<Object> allUsers=queryResult.list();
			Iterator<Object> it=allUsers.iterator();
			ArrayList<Map<String,String>> arrayString=new ArrayList<Map<String,String>>();
			while(it.hasNext()){
				 classObj=it.next();
				 Map<String,String> returnMap=pq.readElements(classObj);
				 arrayString.add(returnMap);
			}
//			Gson gson=new Gson();
//			queryOutput=gson.toJson(arrayString);
//			System.out.println("queryOutput "+queryOutput);	
			
			formObjects.add(classObj);		
			formObjCount++;
		}
		

		
		

		JSONObject checkRuleJson=(JSONObject)responseTwo.get(0);
		String hasCheckRule= (String)checkRuleJson.get("result");
	  
		
	    if(hasCheckRule != null && !hasCheckRule.isEmpty()){
	    	
	    	ipost.stackDescription("No rule to apply");		
	    	
	    }
	    else
	    {
	    	
	        ipost.stackDescription("Applying rules");   	
	    	
	    	Iterator i = responseTwo.iterator();
	    	
	        String main_packages="package com.hethi.daas.service;" ;
	        String sub_packages="import com.hethi.domain.iPost;  \n ";
	               sub_packages=sub_packages+importFormsPackage;
	               sub_packages=sub_packages+"import java.sql.Timestamp; \n";
	               sub_packages=sub_packages+"import java.util.Date; \n";
	        
	        
	        String rule= main_packages+"\n";
	        	   rule=rule+sub_packages+"\n \n ";
	        	   
	        while (i.hasNext()) {
	        	
	            JSONObject row = (JSONObject) i.next();            

	           
	            String rule_name=  (String)row.get("rule_name");
	            String rule_condition = (String)row.get("rule_condition");
	            String rule_action= (String)row.get("rule_action");
	     
	            	   rule=rule + "\t rule \" "+rule_name+"\" \n \n ";
	            	   rule=rule + "\t \t when   \n ";
	            	   rule=rule + "\t \t \t \t   "+rule_condition+" \n \n ";
	            	   rule=rule + "\t \t then   \n ";
	            	   rule=rule + "\t \t \t \t   "+rule_action+" \n \n ";
	            	   rule=rule + "\t end \n"; 
	         }

	        System.out.println("rule Text : \n"+rule);

	        
	        KnowledgeBase kbase;
	    		try {
	    			
	    			RuleExecutors ruleObj =new RuleExecutors();
	    			kbase = ruleObj.readKnowledgeBase(rule);    			
	    			StatefulKnowledgeSession ksession = kbase.newStatefulKnowledgeSession();
	    	        ksession.insert(ipost);
	    	        for(int formI=0;formI<formObjects.size();formI++){
	    	        	ksession.insert(formObjects.get(formI));
	    	        }    	        
	    	        ksession.fireAllRules();     	      
	    		       
	    		} catch (Exception e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    			ipost.stackDescription("Error on rule string , Please check the rule");	
	    			ipost.stackDescription("Put Into Exception Queue :"+ipost.getException_channel());	
	    			ipost.setNext_channel(ipost.getException_channel());
	    			ipost.setNext_channel(ipost.getException_queue());
	    			
	    			
	    		}
	    }
		
	    try {
			finalize();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    
	    for(int formI=0;formI<formObjects.size();formI++){
	    	session.flush();     
	       session.clear();
	       //session.save(formObjects.get(formI));
	       Map<String,String> returnMap=pq.readElements(formObjects.get(formI));
	       System.out.println("final_result ="+returnMap);
	       
	  }

	    trans.commit();	
	    session.close();
	    
	    
			 String playload = ipost.toString();
		        msg= MessageBuilder.withPayload(playload)
	             .setHeader("NextQue",ipost.getNext_channel())
	             .build();
		        return msg;
		 
		}
	


}
