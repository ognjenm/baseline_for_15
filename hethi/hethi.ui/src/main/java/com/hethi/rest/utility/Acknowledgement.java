package com.hethi.rest.utility;

public class Acknowledgement {
	
	public String successfullyReceived(String Cus_id,String fileoldname)
	{
		try
		{
			
		QueryExecutors executor = new QueryExecutors();
		System.out.println("call mail here ");
    	EmailNotificationService im=new EmailNotificationService();	        	
    	System.out.println("inside mail here ");
    	//System.out.println("check the String value ==> "+file_id+" "+uid+" "+ to+" "+customer+" "+cid+" "+uid); 
    	String tosql="SELECT business_email FROM hethi.dcustomer where customer_id ="+"2"+"";
    	
    	   String to=executor.executeMyQuery(tosql);
    	   System.out.println("TO mail address===> "+to);
    	   String msg_sub = "your "+fileoldname+" file has been successfully received";
           String subject="Hethi Acknowledgement Form ";
           String msg="Thank You  "+msg_sub;
           String body="<!DOCTYPE html><html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>Hethi Registration</title><style type='text/css'>body, .header h1, .header h2, p{margin: 0; padding: 0;}.top-message p, .bottom-message p {color: #3f4042; font-size: 12px; font-family: Arial, Helvetica, sans-serif;}.header h1{color: #000000; font-family: 'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; font-size: 24px;}.header h2{color: #444444; font-family: Arial,Helvetica,sans-serif;font-size: 12px}.header p {color: #000000; font-family: 'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; font-size: 12px;}h3 {font-size: 28px;color: #444444;font-family: Arial,Helvetica,sans-serif}h4 {font-size: 22px;color: #4A72Af;font-family: Arial,Helvetica,sans-serif}h5 {font-size: 18px;color: #444444;font-family: Arial,Helvetica,sans-serif;line-height: 1.5;}p {font-size: 12px;color: #444444;font-family:'Lucida Gr Sans','Lucida Sans Unicode',sans-serif; line-height: 1.5;}li {font-size: 12px;color: rgba(21, 24, 80, 0.85);font-family:'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; line-height: 1.5;margin-left: 0px}h1,h2,h3,h4,h5,h6 {margin: 0 0 0.8em 0;}</style></head><body><table width='60%' align='center' cellpadding='0' cellspacing='0' bgcolor=e4e4e4><tr><td><table class='top-message' cellpadding='20' cellspacing='0' width='600' align='center'><tr><td align='center'></td></tr></table><table class='main' cellpadding='0' cellspacing='15' bgcolor='ffffff' width='600' align='center' bgcolor='white' style='background-color: #E7EDF1'><tr><td width='570' align='center' style='background-color: #f5f5f5'><br><h3>Hethi</h3>business $implified</td></tr> <tr><td><table class='header'><tr><td width='570' bgcolor='E7EDF1'><h2>Welcome to hethi business network</h2></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 5px;padding-bottom: 10px'>"+msg+"<br><p>Thankyou for taking a moment to connect with Hethi</p></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 5px;padding-bottom: 10px'></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 0px; padding-bottom: 20px'><br><br><br><span>Thankyou ,</span><br><span>Team Hethi</span></td></tr></table></td></tr><tr><td></td></tr></table><table class='bottom-message' cellpadding='20' cellspacing='0' width='600' align='center'><tr><td align='center'><p>You are recieving this email because you signed up for</p><p><a href='#'>Unsubscribe instantly</a> | <a href='#'>Forward</a></p></td></tr></table></td></tr></table></body></html>";
           String filename="";     
           System.out.println("Are you mail here ");
           boolean ms=im.sendMail(to, subject, body, filename); 		       
           String res="";
           if(ms==true)
           {
        	   res="Success";
           }
           else
           {
        	   res="Error";
           }
           System.out.println("acknowledgement json result==> "+res);
        	return res;
          
           
		}
		catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
	
	public String corruptedFile(String Cus_id,String fileoldname)
	{
		try
		{
			
		QueryExecutors executor = new QueryExecutors();
		System.out.println("call mail here ");
    	EmailNotificationService im=new EmailNotificationService();	        	
    	System.out.println("inside mail here ");
    	//System.out.println("check the String value ==> "+file_id+" "+uid+" "+ to+" "+customer+" "+cid+" "+uid); 
    	String tosql="SELECT business_email FROM hethi.dcustomer where customer_id ="+"2"+"";
    	
    	   String to=executor.executeMyQuery(tosql);
    	   System.out.println("TO mail address===> "+to);
    	   String msg_sub = "Sorry . your "+fileoldname+" file has been corrupted. Please Re-send your attachment ";
           String subject="Hethi Acknowledgement Form ";
           String msg="Thank You  "+msg_sub;
           String body="<!DOCTYPE html><html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>Hethi Registration</title><style type='text/css'>body, .header h1, .header h2, p{margin: 0; padding: 0;}.top-message p, .bottom-message p {color: #3f4042; font-size: 12px; font-family: Arial, Helvetica, sans-serif;}.header h1{color: #000000; font-family: 'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; font-size: 24px;}.header h2{color: #444444; font-family: Arial,Helvetica,sans-serif;font-size: 12px}.header p {color: #000000; font-family: 'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; font-size: 12px;}h3 {font-size: 28px;color: #444444;font-family: Arial,Helvetica,sans-serif}h4 {font-size: 22px;color: #4A72Af;font-family: Arial,Helvetica,sans-serif}h5 {font-size: 18px;color: #444444;font-family: Arial,Helvetica,sans-serif;line-height: 1.5;}p {font-size: 12px;color: #444444;font-family:'Lucida Gr Sans','Lucida Sans Unicode',sans-serif; line-height: 1.5;}li {font-size: 12px;color: rgba(21, 24, 80, 0.85);font-family:'Lucida Grande','Lucida Sans','Lucida Sans Unicode',sans-serif; line-height: 1.5;margin-left: 0px}h1,h2,h3,h4,h5,h6 {margin: 0 0 0.8em 0;}</style></head><body><table width='60%' align='center' cellpadding='0' cellspacing='0' bgcolor=e4e4e4><tr><td><table class='top-message' cellpadding='20' cellspacing='0' width='600' align='center'><tr><td align='center'></td></tr></table><table class='main' cellpadding='0' cellspacing='15' bgcolor='ffffff' width='600' align='center' bgcolor='white' style='background-color: #E7EDF1'><tr><td width='570' align='center' style='background-color: #f5f5f5'><br><h3>Hethi</h3>business $implified</td></tr> <tr><td><table class='header'><tr><td width='570' bgcolor='E7EDF1'><h2>Welcome to hethi business network</h2></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 5px;padding-bottom: 10px'>"+msg+"<br><p>Thankyou for taking a moment to connect with Hethi</p></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 5px;padding-bottom: 10px'></td></tr><tr><td width='570' bgcolor='E7EDF1' style='padding-top: 0px; padding-bottom: 20px'><br><br><br><span>Thankyou ,</span><br><span>Team Hethi</span></td></tr></table></td></tr><tr><td></td></tr></table><table class='bottom-message' cellpadding='20' cellspacing='0' width='600' align='center'><tr><td align='center'><p>You are recieving this email because you signed up for</p><p><a href='#'>Unsubscribe instantly</a> | <a href='#'>Forward</a></p></td></tr></table></td></tr></table></body></html>";
           String filename="";     
           System.out.println("Are you mail here ");
           boolean ms=im.sendMail(to, subject, body, filename); 		       
           String res="";
           if(ms==true)
           {
        	   res="Success";
           }
           else
           {
        	   res="Error";
           }
           System.out.println("acknowledgement json result==> "+res);
        	return res;
          
           
		}
		catch(Exception e){
			System.out.println(e);
		}
		return null;
	}

}
