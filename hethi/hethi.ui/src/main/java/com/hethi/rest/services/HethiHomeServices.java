package com.hethi.rest.services;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.Map;
import java.util.Properties;

import org.apache.catalina.util.Base64;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.hethi.daas.ImageIO.ImageProcessesingServices;
import com.hethi.daas.OCR.PDFImageProcessing;

import com.hethi.rest.repo.HethiHomeRepo;
import com.hethi.rest.utility.EmailNotificationService;
import com.hethi.rest.utility.ExtractArchive;
import com.hethi.rest.utility.ExtractZipFiles;
import com.hethi.rest.utility.QueryExecutors;

import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

public class HethiHomeServices {
	HethiHomeRepo homeRepo=new HethiHomeRepo();
	public String bpaas_load_home_content(){
		String query ="{ call bpaas_load_home_content() }";
		System.out.println(query);
		return homeRepo.bpaas_load_home_content(query);
	}
	
	@SuppressWarnings({ "rawtypes", "static-access"})
	public  String UploadFile(MultipartFile file,
	    	int customer_id,String efs_uin,int user_id) throws IOException, NumberFormatException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, ParseException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException{
		    Long today=new Date().getTime();
	        String fileName=file.getOriginalFilename();
			String name=fileName.substring(0,fileName.lastIndexOf('.')).concat(today.toString());
			fileName=name.concat(fileName.substring(fileName.lastIndexOf('.'),fileName.length()));
			String folderName=fileName.substring(0, fileName.lastIndexOf('.'));
	        String fileType=fileName.substring(fileName.lastIndexOf('.')+1,fileName.length());
	        ExtractZipFiles extract=new ExtractZipFiles(); 
	        ArrayList<String> str=extract.readFile();
	       	String baseUrl=str.get(0);
	       	String filepath=str.get(1);
			String uploadedFileLocation=filepath+"/"+fileName;
			QueryExecutors object1=new QueryExecutors();
	        String sql="{ call store_uploaded_document('"+fileName+"','"+fileType+"','"+file.getSize()+"','"+customer_id+"')}";
	        System.out.println(sql);
	        ArrayList<ArrayList> resultList=object1.callProcedure(sql);
	       	Gson gson=new Gson();
	       	extract.writeToFile(file.getInputStream(),uploadedFileLocation);
	        
	       	String JSONData=gson.toJson(resultList.get(0).get(0));
			JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
			String result=null;
			
			if(fileType.equals("rar")){
	       		ExtractArchive extr=new ExtractArchive();
	       		result=extr.extractArchive(uploadedFileLocation, filepath,baseUrl,Integer.parseInt(json.get("upload_id").toString()),customer_id,efs_uin,user_id,today);
	       	}
			else if(fileType.equals("zip")){
	        	result=extract.unzipFile(uploadedFileLocation,filepath+"/"+folderName,Integer.parseInt(json.get("upload_id").toString()),
	        			customer_id,efs_uin,user_id,baseUrl,fileName);
	        }
//	        else if(fileType.equals("pdf"))
//	        {
//	        	int i= uploadedFileLocation.lastIndexOf("/images/");
//	        	String host=uploadedFileLocation.substring(0,i);
//	        	String file_path=uploadedFileLocation.substring(i,uploadedFileLocation.length());
//	        	String fullPath=baseUrl+file_path;
//	        	PDFImageProcessing pdfImg=new PDFImageProcessing();
//	        	fullPath=pdfImg.ConvertPdfToImage("src/web/client"+fullPath.substring(fullPath.indexOf("/images"),fullPath.length()));
//	        	fullPath=baseUrl+file_path.replace(".pdf", ".jpg");
//	        	System.out.println("JPG Path"+ fullPath);
////	        	System.out.println("Pdf Path IS "+"src/web/client"+fullPath.substring(fullPath.indexOf("/images"),fullPath.length()));
////	            ImageProcessesingServices.getFullOCR(new File("src/web/client"+fullPath.substring(fullPath.indexOf("/images"),fullPath.length())));
//
//	           	String sql1="{ call store_uploaded_document_files('"+json.get("upload_id")+"','"+customer_id+"',"
//	        			+ "'"+efs_uin+"','"+user_id+"','"+fileName+"','"+fileType+"','"+file.getSize()+"','"+fullPath+"')}";
//	           	System.out.println(sql1);
//	           	ArrayList<ArrayList> resultList1=object1.callProcedure(sql1);
//	           	result=gson.toJson(resultList1);
//	        }
			else
	        {
	        	int i= uploadedFileLocation.lastIndexOf("/images/");
	        	String file_path=uploadedFileLocation.substring(i,uploadedFileLocation.length());
	        	String fullPath=baseUrl+file_path;
	        	System.out.println("Pdf Path IS "+"src/web/client"+fullPath.substring(fullPath.indexOf("/images"),fullPath.length()));
	        	String sourcePath= "src/web/client"
						+ fullPath.substring(fullPath.indexOf("/images"), fullPath.length());
				
						if(sourcePath.endsWith(".pdf")){
							PDFImageProcessing pdfImg=new PDFImageProcessing();
							try {
								pdfImg.convertPdfToImage("", sourcePath, null, "jpg", 1, 1, "rgb");
								fullPath=fullPath.replace(".pdf", ".jpg");
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						else{
							ImageProcessesingServices.getFullOCR("src/web/client"+fullPath.substring(fullPath.indexOf("/images"),fullPath.length()));
						}
	           	String sql1="{ call store_uploaded_document_files('"+json.get("upload_id")+"','"+customer_id+"',"
	        			+ "'"+efs_uin+"','"+user_id+"','"+fileName+"','"+fileType+"','"+file.getSize()+"','"+fullPath+"')}";
	           	System.out.println(sql1);
	           	ArrayList<ArrayList> resultList1=object1.callProcedure(sql1);
	           	result=gson.toJson(resultList1);	        	
	        }
	        System.out.println(result);
			return result;
	}
	public String listDocument(String JSONData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
	      JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
		  String sql="{ call listuploadeddocument('"+json.get("status")+"',"
					+ "'"+json.get("userid")+"') }";
		  System.out.println(sql);
		  return homeRepo.listDocument(sql);
	}
	public String updatedocumentqueue(String JSONData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
	       JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
		   String sql = "{ call documentstatusupdate('"+json.get("upload_id")+"',"
		 		+ "'"+json.get("file_id")+"','"+json.get("nextqueue")+"',"
		 		+ "'"+json.get("user_id")+"') }";
		   System.out.println(sql);
		   return homeRepo.updatedocumentqueue(sql);
	}
	
	public String load_userlist(String JSONData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
	       JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
		   String sql = "{ call load_artistlist('"+json.get("customer_id")+"') }";
		   System.out.println(sql);
		   return homeRepo.load_userlist(sql);
	}
	
	public String load_roletasklist(String JSONData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
	       JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
		   String sql = "{ call load_task_list_by_user('"+json.get("customer_id")+"','"+json.get("role_id")+"') }";
		   System.out.println(sql);
		   return homeRepo.load_roletasklist(sql);
	}
	
	public String assign_task(String JSONData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
	       JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
		   String sql = "{ call assign_task_by_user('"+json.get("customer_id")+"','"+json.get("user_id")+"','"+json.get("upload_id")+"',"
		   		+ "'"+json.get("file_id")+"','"+json.get("job_id")+"','"+json.get("next_job_id")+"') }";
		   System.out.println(sql);
		   return homeRepo.load_roletasklist(sql);
	}
	
	public String disableRule(String JSONData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
	       JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
		   String sql = "{ call disableRule('"+json.get("efs_uin")+"','"+json.get("rule_uin")+"','"+json.get("ruleset_id")+"') }";
		   System.out.println(sql);
		   return homeRepo.disableRule(sql);
	}
	
	public String addPlatformUser(String JSONData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
	       JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
		   String sql = "{ call addPlatformUser('"+json.get("customer_id")+"','"+json.get("username")+"',"
		   		+ "'"+json.get("role")+"') }";
		   System.out.println(sql);
		   String data=homeRepo.addPlatformUser(sql);
		   JSONArray arr= (JSONArray) new JSONParser().parse(data);
	       JSONArray arr1= (JSONArray)arr.get(0);
	       JSONObject jsonD = (JSONObject) arr1.get(0);
	       if(jsonD.get("result").toString().equals("Success")){
	    	   EmailNotificationService im=new EmailNotificationService();
//	           String user_id=jsonD.get("userId").toString();
//	           String address_id=jsonD.get("addressId").toString();
	           String customer="Hethi-Admin";
	           String to=json.get("username").toString();
	           String str=jsonD.toJSONString();
	    	   String   bytesEncoded = Base64.encode(str .getBytes());
	    	   System.out.println("ecncoded value is " + new String(bytesEncoded ));
	    	   String qString=new String(bytesEncoded );
	    				 qString = qString.replace('=', '-').replace(' ', '_').replace("=+$","|");
	    				 
	    	   System.out.println("query string value is " +qString);
	    	   Properties prop = new Properties();
	    	   System.out.println("domain="+prop.getProperty("domain"));
	    	   String domain = "http:localhost:4141";
	           String verificationUrl=domain+"/verifyUser?q="+qString;
	           String subject="Hethi Customer Registration ";
	           String msg="Thank You  "+customer+", please click the below to your  to confirm cloudplug";
	           String body="<!DOCTYPE html><html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>Hethi Registration</title><style type='text/css'>body, .header h1, .header h2, p{margin: 0; padding: 0;}.top-message p, .bottom-message p {color: #3f4042; font-size: 12px; font-family: Arial, Helvetica, sans-serif;}.header h1{color: #000000; font-family: 'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; font-size: 24px;}.header h2{color: #444444; font-family: Arial,Helvetica,sans-serif;font-size: 12px}.header p {color: #000000; font-family: 'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; font-size: 12px;}h3 {font-size: 28px;color: #444444;font-family: Arial,Helvetica,sans-serif}h4 {font-size: 22px;color: #4A72Af;font-family: Arial,Helvetica,sans-serif}h5 {font-size: 18px;color: #444444;font-family: Arial,Helvetica,sans-serif;line-height: 1.5;}p {font-size: 12px;color: #444444;font-family:'Lucida Gr Sans','Lucida Sans Unicode',sans-serif; line-height: 1.5;}li {font-size: 12px;color: rgba(21, 24, 80, 0.85);font-family:'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; line-height: 1.5;margin-left: 0px}h1,h2,h3,h4,h5,h6 {margin: 0 0 0.8em 0;}</style></head><body><table width='60%' align='center' cellpadding='0' cellspacing='0' bgcolor=e4e4e4><tr><td><table class='top-message' cellpadding='20' cellspacing='0' width='600' align='center'><tr><td align='center'></td></tr></table><table class='main' cellpadding='0' cellspacing='15' bgcolor='ffffff' width='600' align='center' bgcolor='white' style='background-color: #E7EDF1'><tr><td width='570' align='center' style='background-color: #f5f5f5'><br><h3>Hethi</h3>business $implified</td></tr> <tr><td><table class='header'><tr><td width='570' bgcolor='E7EDF1'><h2>Welcome to hethi business network</h2></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 5px;padding-bottom: 10px'>"+msg+"<br><p>Thankyou for taking a moment to connect with Hethi</p></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 5px;padding-bottom: 10px'><p>To complete your  registration  please  follow the link</p></td></tr><tr><td width='570' bgcolor='E7EDF1'><a href="+verificationUrl+"> <b>click here to complete the registration</b></a></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 0px; padding-bottom: 20px'><br><br><br><span>Thankyou ,</span><br><span>Team Hethi</span></td></tr></table></td></tr><tr><td></td></tr></table><table class='bottom-message' cellpadding='20' cellspacing='0' width='600' align='center'><tr><td align='center'><p>You are recieving this email because you signed up for</p><p><a href='#'>Unsubscribe instantly</a> | <a href='#'>Forward</a></p></td></tr></table></td></tr></table></body></html>";
	           String filename="";        	
	           boolean ms=im.sendMail(to, subject, body, filename); 
	           String res="";
	           if(ms==true)
	        	   res="Success";
	           else
	        	   res="Error";
	           jsonD.put("result", res);
	        	
	           return jsonD.toJSONString();
	       }
//		   return homeRepo.addPlatformUser(sql);
		return data;
	}
	
	public String loadAvailableRoles(String jsonData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		   JSONObject json = (JSONObject)new JSONParser().parse(jsonData);
    	   String sql = "{ call loadAvailableRoles('"+json.get("customer_id")+"')}";
		   System.out.println(sql);
		   return homeRepo.loadAvailableRoles(sql);
	}
	
	public String complete_user_registration(String jsonData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		   JSONObject json = (JSONObject)new JSONParser().parse(jsonData);
 	   String sql = "{ call complete_user_registration('"+json.get("userData")+"')}";
		   System.out.println(sql);
		   return homeRepo.complete_user_registration(sql);
	}
	
	public String saveNewRule(String JSONData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		 JSONObject json = (JSONObject)new JSONParser().parse(JSONData);
	       String statement=json.get("rule_condition").toString().replace("\'", "\\\"");
	       String action=json.get("rule_action").toString().replace("\'", "\\\"");
	       String failure=json.get("rule_failure").toString().replace("\'", "\\\"");
	       String query="select ifnull((select max(`cstandardrules`.`rule_uin`) from `hethi`.`cstandardrules`),'rule1000') as rule_uin";
           String rule_uin=""; 
           int flag=0;
           int ruleId=1;
	       try {
	    	   QueryExecutors queryObj=new QueryExecutors();
			   @SuppressWarnings("rawtypes")
			   ArrayList<ArrayList> resultList=queryObj.callProcedure(query);
			   Map<String,String> mapObj=(Map<String, String>) resultList.get(0).get(0);
			   rule_uin=mapObj.get("rule_uin");
			   ruleId=Integer.parseInt(rule_uin.substring(4, rule_uin.length()))+1;
			   
	       }
	       catch(Exception e){
	    	   flag=1;
	    	   e.printStackTrace();
	       }
	     
	       
	       int status=0;
	       if(json.get("rule_status").toString().equals("true"))
	    	   status=1;
	       rule_uin=rule_uin.substring(0, 4)+ruleId;
		   String sql = "{ call save_new_rule('"+rule_uin+"','"+json.get("ruleset_id")+"',"
		   		+ "'"+json.get("rule_name")+"','"+json.get("rule_desc")+"','"+json.get("rule_efs")+"',"
		   		+ "'"+json.get("rule_type")+"','"+statement+"','"+action+"','"+failure+"'"
		   		+ "'"+json.get("rule_effective_startdate")+"','"+json.get("rule_effective_enddate")+"',"
		   		+ "'"+status+"',"
		   		+ "'"+json.get("lastUpUser")+"') }";
		   System.out.println(sql);
		   return homeRepo.saveNewRule(sql);
	}


}
