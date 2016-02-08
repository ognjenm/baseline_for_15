package com.hethi.domain;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import com.google.gson.Gson;


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
}
