package com.hethi.daas;

import java.io.Reader;
import java.io.StringReader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.drools.KnowledgeBase;
import org.drools.KnowledgeBaseFactory;
import org.drools.builder.KnowledgeBuilder;
import org.drools.builder.KnowledgeBuilderError;
import org.drools.builder.KnowledgeBuilderErrors;
import org.drools.builder.KnowledgeBuilderFactory;
import org.drools.builder.ResourceType;
import org.drools.io.Resource;
import org.drools.io.ResourceFactory;
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

import com.google.gson.Gson;
import com.hethi.domain.iPost;
import com.hethi.utils.RuleExecutors;
import com.hethi.utils.ServicePlayQueue;
import com.hethi.rest.model.exception;

public class Inventory {
	
	public  Message<String> Inventory(String data) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException  {
		
		
		 String l = "*************************************************************************************************************";
		String messageContent=data;
		 Message<String> msg;	
		 String SEPARATOR = "-----------------------";
		 String log=SEPARATOR+"inside_daas_Inventory_channel"+SEPARATOR;		
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
		
		List<Object> parrentResultSet = null;
		Object MasterclassObj;	
		
		int formObjCount=0;
		int maxResultset=0;
		
		while(formObjCount<formObjList.size()){		
			
			String fileName=formObjList.get(formObjCount).toString();		
			String className = "com.hethi.rest.model."+fileName;	
			
			Object classObj = Class.forName(className).newInstance();
			String hql="from "+fileName.toLowerCase()+" where din=:Din  and version=:Version order by  version  desc , lastupdtm  desc ";
			
			Query queryResult = session.createQuery(hql);
			queryResult.setParameter("Din",ipost.getDin());
			queryResult.setParameter("Version",ipost.getVersion());
			List<Object> resultSet=queryResult.list();
			
			System.out.println(l);
			System.out.println("formObjCount: "+formObjCount+"; from  :"+className);
			System.out.println(l);
			System.out.println("Start Processing Form " +fileName);
			System.out.println(l);
			System.out.println("| hql          :"+hql);
			System.out.println("| Din		   :"+ipost.getDin());
			System.out.println("| Version 	   :"+ipost.getVersion());
			System.out.println("| Object Name  :"+classObj.getClass().toString());
			System.out.println(l);
			System.out.println("| No of rows   :"+resultSet.size());
			System.out.println(l);
			System.out.println("| hql resultSet:"+resultSet.toString());
			System.out.println(l);
			
			if(resultSet.size()>maxResultset){
				maxResultset=resultSet.size();
				parrentResultSet=resultSet;
				MasterclassObj = classObj;
			}
			Iterator<Object> it=resultSet.iterator();
			
			
			
			
			
	
			int rc=1;
			while(it.hasNext()){
				
				System.out.println("Start Processing Row :"+l);
				System.out.println("formObjCount:"+formObjCount+",RowCount:"+rc);
				System.out.println(l);
				classObj=it.next();
				Gson gson=new Gson();
				String json = gson.toJson(classObj);
				System.out.println(l);		                
	            System.out.println("| Processing Row Data  |  "+json+"  |");
	            System.out.println(l);	
	            rc=rc+1;
				System.out.println("End Processing Row :"+l);
				System.out.println(l);		
			}
			
			formObjects.add(classObj);		
			formObjCount++;
			System.out.println(l);
			System.out.println("End  Processing Form "+fileName);
			System.out.println(l);
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
			ArrayList<String> ObjForRuleList=pq.listFilesToInsert(ipost.getEfs_uin());
			int ObjCount=0;
			String importFormsPackage="";
			while(ObjCount<ObjForRuleList.size()){		
				
				String fileName=ObjForRuleList.get(ObjCount).toString();		
				String className = "com.hethi.rest.model."+fileName;			
				importFormsPackage=importFormsPackage+"import "+className+"; \n";
				ObjCount=ObjCount+1;
			}
	        String main_packages="package com.hethi.daas.service;" ;
	        String sub_packages="import com.hethi.domain.iPost;  \n";
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
	    	        Iterator<Object> RowCount=parrentResultSet.iterator();
	    	        ipost.stackDescription(l);
	    	        ipost.stackDescription("Number of rows to  apply rule :" +maxResultset);
	    	        ipost.stackDescription(l);
	    	        int c=1;
	    	        while(RowCount.hasNext()){

	    	        	   ipost.stackDescription("rule applying  row :"+c);
	    				    MasterclassObj=RowCount.next();
	    				    String MasterclassName=MasterclassObj.getClass().toString();
	    				    
	    				    Gson gson=new Gson();
	     				    String MasterclassJson = gson.toJson(MasterclassObj);
	     				    
	    	                System.out.println(l);		                
	    	                System.out.println("| Masterclass Obj Rows Data  |  "+MasterclassJson+"  |");
	    	                System.out.println(l);	 
	    	                
	    	                
	    	                for(int formI=0;formI<formObjects.size();formI++){
	    	                	
	    	                	Object childClassOB=formObjects.get(formI);	                	
	    	                	String ChildclassName=childClassOB.getClass().toString();	
	    	                	String ChildclassJson=gson.toJson(childClassOB);
	    	                	if(MasterclassName.equals(ChildclassName)){
	    	                		
	    	                		System.out.println("| Both classes are same so ignore this row !  |"+ChildclassName+"|"+MasterclassName+"  |");
	    	                	}
	    	                	else
	    	                	{ 

	    	                		System.out.println("| Master data inserting into rule  |  "+MasterclassJson+"  |");
	    	                		System.out.println("| Child data inserting into rule   |  "+ChildclassJson+"   |");
	    	                		
	    	                		ksession.insert(ipost);
	    	                		ksession.insert(MasterclassObj);
	    	                		ksession.insert(childClassOB);
	    	                		
	    	                	  
	    	                	}
	    	                	
	    	                	
	    	    	        }
	    	                
	    	                ksession.fireAllRules(); 
	    	                ipost.stackDescription("rule applying completed for  row number "+c);	
	    	                ipost.stackDescription(l);
	    	                c=c+1;
	    	                exception exceptionOB =new  exception(ipost);
	    	                
//	    	                Session tempSession=factory.openSession();
//	    	        		Transaction tempTrans=tempSession.beginTransaction();
//	    	        		tempSession.flush();     
// 	    	     	        tempSession.clear();
//	    	        		tempSession.save(exceptionOB);
//
//	    	        		tempSession.getTransaction().commit();
//	    	        		tempSession.close();
	    	        		

	    	               

	    	        }
    
	    		       
	    		} catch (Exception e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    			ipost.stackDescription("Error on rule string , Please check the rule");	
	    			ipost.stackDescription("Put Into Exception Queue :"+ipost.getException_channel());	
	    			ipost.setNext_channel(ipost.getException_channel());
	    			
	    			
	    		}
	    }
		
	    try {
			finalize();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    
//	    for(int formI=0;formI<formObjects.size();formI++){
//	    	session.flush();     
//	       session.clear();
//	       session.save(formObjects.get(formI));
//	       Map<String,String> returnMap=pq.readElements(formObjects.get(formI));
//	       System.out.println("final_result ="+returnMap);
//	       
//	  }

	    trans.commit();	
	    session.close();
	    factory.close();
	    
	    
	    
			 String playload = ipost.toString();
		        msg= MessageBuilder.withPayload(playload)
	             .setHeader("NextQue",ipost.getNext_channel())
	             .build();
		        return msg;
		 
		}
	


}
