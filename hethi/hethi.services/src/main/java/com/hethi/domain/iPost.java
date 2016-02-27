package com.hethi.domain;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import com.google.gson.Gson;
import com.hethi.utils.QueryExecutors;


public class iPost {
	
	private String customer_id;
	private String tfs_uin; 
    private String efs_uin;  
    
   
	private String sfs_uin;
    private String current_channel;
    
	private String next_queue;
    private String next_channel;
    
	private String exception_queue;
    private String exception_channel;
    
    private String uid; 
    private String din;
    private int version;  
    
    private String source_document_path_http;
    private String document_name;
    private String source_document_path_local;     
    private String user_id;   
	private String description;
    
    

    
    public iPost(){
    	
    	this.customer_id="";
        this.tfs_uin="";
        this.efs_uin="";
        this.sfs_uin="";  
        this.current_channel="";
        this.next_queue="";
        this.next_channel="";
        this.exception_queue="";
        this.exception_channel="";
        this.uid="";
        this.din="";
        this.version=0;
    	this.source_document_path_http = "";
    	this.source_document_path_local="";
    	this.document_name="";  
    	this.description="";    	
    	this.user_id="";
    	
    	 Gson gson=new Gson();
	     String data=gson.toJson(this);
	     System.out.println(data);
    	 
    }
    public iPost(String Data) {
    	
    	JSONParser parser=new JSONParser();
    	
    	Object iPostDataParse;
		try {
			iPostDataParse = parser.parse(Data);
			JSONObject ip = (JSONObject) iPostDataParse;
			
	        this.customer_id=(String)ip.get("customer_id");
	        
	        this.tfs_uin=(String)ip.get("tfs_uin");
	        this.efs_uin=(String)ip.get("efs_uin");
	        this.sfs_uin=(String)ip.get("sfs_uin");  
	        
	        this.current_channel=(String)ip.get("current_channel");
	        this.next_queue=(String)ip.get("next_queue");
	        this.next_channel=(String)ip.get("next_channel");
	        this.exception_queue=(String)ip.get("exception_queue");
	        this.exception_channel=(String)ip.get("exception_channel");
	        
	        
			
	        this.uid=(String)ip.get("uid");
	        this.din=(String)ip.get("din");
	        this.version=Integer.parseInt(ip.get("version").toString()) ;
	        
	    	this.source_document_path_http = (String)ip.get("source_document_path_http");
	    	this.source_document_path_local=(String)ip.get("source_document_path_local");
	    	this.document_name=(String)ip.get("document_name");
	    	

	    	this.description=(String)ip.get("description");
	    	
	    	this.user_id=(String)ip.get("user_id");
	    	
	    	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    }
    

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getTfs_uin() {
			return tfs_uin;
	}

	public void setTfs_uin(String tfs_uin) {
			this.tfs_uin = tfs_uin;
	}

	public String getEfs_uin() {
		return efs_uin;
	}

	public void setEfs_uin(String efs_uin) {
		this.efs_uin = efs_uin;
	}

	public String getSfs_uin() {
		return sfs_uin;
	}

	public void setSfs_uin(String sfs_uin) {
		this.sfs_uin = sfs_uin;
	}

	public String getCurrent_channel() {
		return current_channel;
	}

	public void setCurrent_channel(String current_channel) {
		this.current_channel = current_channel;
	}

	public String getNext_queue() {
		return next_queue;
	}

	public void setNext_queue(String next_queue) {
		this.next_queue = next_queue;
	}

	public String getNext_channel() {
		return next_channel;
	}

	public void setNext_channel(String next_channel) {
		this.next_channel = next_channel;
	}

	public String getException_queue() {
		return exception_queue;
	}

	public void setException_queue(String exception_queue) {
		this.exception_queue = exception_queue;
	}

	public String getException_channel() {
		return exception_channel;
	}

	public void setException_channel(String exception_channel) {
		this.exception_channel = exception_channel;
	}
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getDin() {
		return din;
	}

	public void setDin(String din) {
		this.din = din;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getSource_document_path_http() {
		return source_document_path_http;
	}

	public void setSource_document_path_http(String source_document_path_http) {
		this.source_document_path_http = source_document_path_http;
	}

	public String getDocument_name() {
		return document_name;
	}

	public void setDocument_name(String document_name) {
		this.document_name = document_name;
	}

	public String getSource_document_path_local() {
		return source_document_path_local;
	}

	public void setSource_document_path_local(String source_document_path_local) {
		this.source_document_path_local = source_document_path_local;
	}



    public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void stackDescription(String description) {
		 Calendar cal = Calendar.getInstance();
	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SSS");
	        String dt=sdf.format(cal.getTime());
		this.description = this.description+" {\"log\":\""+description+"\",\"time\":\""+dt+"\"},";
	}
	public void log(String description) {
		 Calendar cal = Calendar.getInstance();
	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SSS");
	        String dt=sdf.format(cal.getTime());
		this.description = this.description+" {\"log\":\""+description+"\",\"time\":\""+dt+"\"},";
	}
  
    
    @Override
    public String toString() {
    	 Gson gson=new Gson();
	     return gson.toJson(this);   	
      
    }
    
    
// **********************   start boolean parser methods for rule   **************************************;
    
    
	public boolean home(String jsonString) throws InstantiationException, IllegalAccessException,
	   ClassNotFoundException, SQLException, IOException, ParseException, java.text.ParseException, ScriptException{
		
		JSONObject jsonOb=(JSONObject)new JSONParser().parse(jsonString);
		String operation=jsonOb.get("expression_type").toString();
		String sql="select * from rule_operations where operation_name='"+operation+"'";
		QueryExecutors exec=new QueryExecutors();
		ArrayList<ArrayList> resultArray=exec.callProcedure(sql);
		ArrayList<Map<String,String>> array2=resultArray.get(0);
		Map<String,String> mapObj=array2.get(0);
		String operationType=mapObj.get("operation_type");
		String expression=mapObj.get("operation_expression");
		String exp_inputs=mapObj.get("expression_input");
		if(operationType.equals("computation")){
			return computationExpression(jsonOb, expression,exp_inputs);
		}
		else{
			return lookupExpression(jsonOb, expression,exp_inputs);
		}
	}
	public  boolean computationExpression(JSONObject jsonString,String expression,String exp_inputs) throws InstantiationException, IllegalAccessException,
	   ClassNotFoundException, SQLException, IOException, ParseException, java.text.ParseException, ScriptException{
		
		ScriptEngineManager mgr = new ScriptEngineManager();
     ScriptEngine engine1 = mgr.getEngineByName("javascript");
     ScriptEngine engine = mgr.getEngineByName("groovy");
     String[] inputArray=exp_inputs.split(",");
     int flag=0,exceptionFlag=0;
     JSONObject ouputFields=null;
     JSONObject jsonObject=jsonString;
     String expression_type=jsonObject.get("expression_type").toString();
     JSONArray inputFields=(JSONArray) new JSONParser().parse(String.valueOf(jsonObject.get("inputs")));
     JSONObject customInputs=(JSONObject) new JSONParser().parse(jsonObject.get("custom_inputs").toString());
     try{
        ouputFields=(JSONObject) new JSONParser().parse(jsonObject.get("output").toString());
     }
     catch(Exception e){ exceptionFlag=1; }
     if(searchArray(inputFields, engine, engine1, inputArray,flag) == 0 && exceptionFlag == 0){
     	
     }
     searchObj(ouputFields, engine, engine1, inputArray,flag);
     flag=0;
 	searchObj(customInputs, engine, engine1, inputArray,flag);
     JSONObject expressionObj=(JSONObject)new JSONParser().parse(expression);
     expression=expressionObj.get(expression_type).toString();
     expression=expression.replace("\\", "");
     System.out.println(expression);
     boolean value=(boolean) engine.eval(expression);
	    return value;
	}
	public boolean lookupExpression(JSONObject jsonString,String operation,String exp_inputs) throws InstantiationException, IllegalAccessException,
	   ClassNotFoundException, SQLException, IOException, ParseException, java.text.ParseException{
		
		JSONObject jsonObject=(jsonString);
		JSONArray inputFields=(JSONArray)jsonObject.get("inputs");
		String condition="",value="",column="",table="";
		String[] inputArray=exp_inputs.split(",");
		for(int i=0;i<inputFields.size();i++){
			JSONObject json=(JSONObject)inputFields.get(i);
			value="";column="";
			for (Iterator iterator = ((HashMap)json ).keySet().iterator(); iterator.hasNext();){
				String key = (String) iterator.next();
				for(int j=0;j<inputArray.length;j++){
					if(key.lastIndexOf(inputArray[j]) > -1){
						value=json.get(key).toString();
					}
					else if(key.equals("mxml1")){
						column=json.get(key).toString();
					}
					else if(key.startsWith("lookup")){
						table=json.get(key).toString();
					}
				}
			}
			if(i==0)
			    condition=condition+" "+column+"=\""+value+"\"";
			else
				condition=condition+" and "+column+"=\""+value+"\"";
		}
		String sql="select * from "+table+" where "+condition +";";
		System.out.println(sql);
		return executeQuery(sql);
	}
	public boolean executeQuery(String sql){
		try{
			Connection conn=null;
			conn = DriverManager.getConnection("jdbc:mysql://server:3306/hethi", "root", "password");
			Statement st=conn.createStatement();
			ResultSet rst =st.executeQuery(sql);
			if(rst.next()){
			   return true;
			}
		}
		catch(Exception e){
			
		}
		return  false;
	}
	public int searchArray(JSONArray inputFields,ScriptEngine engine,ScriptEngine engine1,String[] inputArray,int flag) throws NumberFormatException, ScriptException{
		
		int status;
		String table="";
		for(int i=0;i<inputFields.size();i++){
			status=0;
     	JSONObject json=(JSONObject)inputFields.get(i);
     	if(!json.get("lookuptable").toString().equals("")) {
     		table=json.get("lookuptable").toString();
     		status = 1;
     	}
     	for (Iterator iterator = ((HashMap)json ).keySet().iterator(); iterator.hasNext();){
 			String key = (String) iterator.next();
 			System.out.println(key);
 			for(int j=0;j<inputArray.length;j++){
 				if(key.lastIndexOf(inputArray[j]) > -1){
 					flag=1;
 					if(inputArray[j].startsWith("mxml")){
 						status++;
 						if(status == 1){
 							String sql="select "+json.get(key).toString()+" from "+table;
 						}
 					}
 					
 					engine1.put(key, json.get(key).toString());
 					if(!(boolean) engine1.eval("isNaN("+key+")")){
 						engine.put(key, Integer.parseInt(json.get(key).toString()));
 					}
 					else{
 						try{
 							SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
 						    Date date = dt.parse(json.get(key).toString());
 						    SimpleDateFormat dt1 = new SimpleDateFormat("yyyy/MM/dd");
 							engine.put(key, dt1.format(date).toString());
 						}
 						catch(Exception e){
 							engine.put(key, json.get(key).toString());
 						}
 					}
 				}
 			}
 		}
     }
		return flag;
	}
	public int searchObj(JSONObject json,ScriptEngine engine,ScriptEngine engine1,String[] inputArray,int flag) throws NumberFormatException, ScriptException{
		for (Iterator iterator = ((HashMap)json ).keySet().iterator(); iterator.hasNext();){
			String key = (String) iterator.next();
			for(int j=0;j<inputArray.length;j++){
				if(inputArray[j].equals(key)){
					flag=1;
					engine1.put(key, json.get(key).toString());
					if(!(boolean) engine1.eval("isNaN("+key+")")){
						engine.put(key, Integer.parseInt(json.get(key).toString()));
					}
					else{
						try{
							SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
						    Date date = dt.parse(json.get(key).toString());
						    SimpleDateFormat dt1 = new SimpleDateFormat("yyyy/MM/dd");
							engine.put(key, dt1.format(date).toString());
						}
						catch(Exception e){
							engine.put(key, json.get(key).toString());
						}
					}
				}
			}
		}
		return flag;
	}
	
    
// **********************   end boolean parser methods for rule   **************************************;
	    
    
    
    
    
    
    
}
