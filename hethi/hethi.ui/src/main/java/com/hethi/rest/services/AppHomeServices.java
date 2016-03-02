package com.hethi.rest.services;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.catalina.util.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.RequestBody;

import com.hethi.rest.repo.AppHomeRepo;
import com.hethi.rest.utility.EmailNotificationService;

public class AppHomeServices {
	AppHomeRepo homeRepo = new AppHomeRepo();

	public String register(String jsonData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(jsonData);
		String sql = "{ call hethi_registration('" + json.get("data") + "')}";
		System.out.println(sql);
        String data= homeRepo.register(sql);
        JSONArray arr= (JSONArray) new JSONParser().parse(data);
        JSONArray arr1= (JSONArray)arr.get(0);
    	JSONObject jsonD = (JSONObject) arr1.get(0);
        
        if(jsonD.get("result").toString().equals("Success")){
        	System.out.println("call mail here ");
        	EmailNotificationService im=new EmailNotificationService();
        	String to=jsonD.get("email").toString();
        	String customer=jsonD.get("customer").toString();
        	String cid=jsonD.get("cid").toString();
        	String uid=jsonD.get("uid").toString();

    		String str=jsonD.toJSONString();
    		String   bytesEncoded = Base64.encode(str .getBytes());
    		 System.out.println("ecncoded value is " + new String(bytesEncoded ));
    		 String qString=new String(bytesEncoded );
    				 qString = qString.replace('=', '-').replace(' ', '_').replace("=+$","|");
    				 
    		System.out.println("query string value is " +qString);
    		 Properties prop = new Properties();
    			InputStream input = null;
    			File currentDirFile = new File(".");
    			String helper = currentDirFile.getAbsolutePath();
    			String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
    			input = new FileInputStream(currentDir + "src/main/resources/application.properties");

    			// load a properties file
    			prop.load(input);
    			String domain = prop.getProperty("domain");
        	String verificationUrl=domain+"/verify?q="+qString;
        	String subject="Hethi Customer Registration ";
        	String msg="Thank You  "+customer+", please click the below to your  to confirm cloudplug";
        	String body="<!DOCTYPE html><html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>Hethi Registration</title><style type='text/css'>body, .header h1, .header h2, p{margin: 0; padding: 0;}.top-message p, .bottom-message p {color: #3f4042; font-size: 12px; font-family: Arial, Helvetica, sans-serif;}.header h1{color: #000000; font-family: 'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; font-size: 24px;}.header h2{color: #444444; font-family: Arial,Helvetica,sans-serif;font-size: 12px}.header p {color: #000000; font-family: 'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; font-size: 12px;}h3 {font-size: 28px;color: #444444;font-family: Arial,Helvetica,sans-serif}h4 {font-size: 22px;color: #4A72Af;font-family: Arial,Helvetica,sans-serif}h5 {font-size: 18px;color: #444444;font-family: Arial,Helvetica,sans-serif;line-height: 1.5;}p {font-size: 12px;color: #444444;font-family:'Lucida Gr Sans','Lucida Sans Unicode',sans-serif; line-height: 1.5;}li {font-size: 12px;color: rgba(21, 24, 80, 0.85);font-family:'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; line-height: 1.5;margin-left: 0px}h1,h2,h3,h4,h5,h6 {margin: 0 0 0.8em 0;}</style></head><body><table width='60%' align='center' cellpadding='0' cellspacing='0' bgcolor=e4e4e4><tr><td><table class='top-message' cellpadding='20' cellspacing='0' width='600' align='center'><tr><td align='center'></td></tr></table><table class='main' cellpadding='0' cellspacing='15' bgcolor='ffffff' width='600' align='center' bgcolor='white' style='background-color: #E7EDF1'><tr><td width='570' align='center' style='background-color: #f5f5f5'><br><h3>Hethi</h3>business $implified</td></tr> <tr><td><table class='header'><tr><td width='570' bgcolor='E7EDF1'><h2>Welcome to hethi business network</h2></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 5px;padding-bottom: 10px'>"+msg+"<br><p>Thankyou for taking a moment to connect with Hethi</p></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 5px;padding-bottom: 10px'><p>To complete your  registration  please  follow the link</p></td></tr><tr><td width='570' bgcolor='E7EDF1'><a href="+verificationUrl+"> <b>click here to complete the registration</b></a></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 0px; padding-bottom: 20px'><br><br><br><span>Thankyou ,</span><br><span>Team Hethi</span></td></tr></table></td></tr><tr><td></td></tr></table><table class='bottom-message' cellpadding='20' cellspacing='0' width='600' align='center'><tr><td align='center'><p>You are recieving this email because you signed up for</p><p><a href='#'>Unsubscribe instantly</a> | <a href='#'>Forward</a></p></td></tr></table></td></tr></table></body></html>";
        	String filename="";        	
        	boolean ms=im.sendMail(to, subject, body, filename);        	
        	jsonD.put("mail_status", ms);
        	
        	return jsonD.toJSONString();
        	
        }
        

          
		return data;
		
	}

	public String complete_registration(@RequestBody String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call complete_registration('" + json.get("userData") + "') }";
		System.out.println(query);
		return homeRepo.complete_registration(query);
	}

	
	public String updateProfile(String jsonData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(jsonData);
		String sql = "{ call hethi_profile_updation('" + json.get("data") + "')}";
		System.out.println(sql);


		return homeRepo.updateProfile(sql);
	}
	
	public String updateRoleByAdmin(String jsonData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(jsonData);
		String sql = "{ call updateRoleByAdmin('" + json.get("userData") + "')}";
		System.out.println(sql);


		return homeRepo.updateRoleByAdmin(sql);
	}


	public String signIn(@RequestBody String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call hethi_authentication('" + json.get("username") + "','" + json.get("password") + "') }";
		System.out.println(query);
		return homeRepo.signIn(query);
	}

		public String loadRuleRepo(@RequestBody String JSONData) throws ParseException {
    		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
    		String query = "{ call loadRuleRepo('" + json.get("rule_uin") + "') }";
    		System.out.println(query);
    		return homeRepo.loadRuleRepo(query);
    	}

}
