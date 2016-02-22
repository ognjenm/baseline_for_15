package com.hethi.daas;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;

import org.json.simple.parser.ParseException;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;
import com.hethi.utils.Log;
import com.hethi.utils.QueryExecutors;

import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

public class Fullextract {

	public Message<String> Fullextract(String data)
			throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException,
			IllegalArgumentException, InvocationTargetException, SQLException, IOException, MagicParseException,
			MagicMatchNotFoundException, MagicException, TesseractException {

		String messageContent = data;
		Message<String> msg;
		String SEPARATOR = "-----------------------";
		String log = SEPARATOR + "inside_daas_Fullextract_channel" + SEPARATOR;
		System.out.println(" \n ");
		System.out.println("" + SEPARATOR);
		System.out.println(log);
		System.out.println("" + SEPARATOR);
		System.out.println(" \n ");
		System.out.println(" \n ");

		iPost ipost = new iPost(data);	  
		
		ipost.stackDescription(log);
		ipost.setSfs_uin(ipost.getNext_queue());
		ipost.setCurrent_channel(ipost.getNext_channel());

		String uid = String.valueOf(Integer.parseInt(ipost.getUid()));
		String cusid = ipost.getCustomer_id();

		ArrayList<ArrayList> fileLocationList = getImgFile(cusid, uid);
		
		String process_id=ipost.getSfs_uin();
		String file_id="0";
		String sub_process_id="1";
		String status="1";
		String user_id="1";	
		
        Log logger=new Log();
		logger.log(cusid,uid, file_id, process_id, sub_process_id,status,user_id);


		/**
		 * get image path from static source
		 * 
		 * TODO call imagepath using WebService(WS)
		 */

		Properties properties = new Properties();
		try {

			properties.load(new FileInputStream(new File("src/main/resources/config/application.properties")));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String imageAbsPath = properties.getProperty("imageSourcePath");

		String imageFullPath = "";

		/* iterator the db value */

		int i = 0;
		// int count = fileLocationList.size();
		ArrayList<Map<String, String>> arrayList = fileLocationList.get(0);

		int count = 1;
		for (Map<String, String> mapObj : arrayList) {
			
			 file_id=mapObj.get("file_id");
			 sub_process_id="1";
			 status="1";
			 logger.log(cusid,uid, file_id, process_id, sub_process_id,status,user_id);
			
			
			/*
			 * System.out.println("row " + count + " .. " + mapObj);
			 * System.out.println("exact image path=" +
			 * mapObj.get("file_location"));
			 */
			String dbimgvalue = mapObj.get("file_location").substring(
					mapObj.get("file_location").lastIndexOf("/images"), mapObj.get("file_location").length());
			String dbimgfileid = mapObj.get("file_id");

			// System.out.println("333333333333" + dbimgfileid);
			imageFullPath = imageAbsPath + dbimgvalue;
			System.out.println("check img location in db value   ***  " + imageFullPath);
			

			 status="2";
			 logger.log(cusid,uid, file_id, process_id, sub_process_id,status,user_id);

			ImageProcessesingServices.getFullOCR(imageFullPath);

			String updateSql = "{call save_update_fullocr_pdf('" + uid + "'," + "'" + cusid + "'," + "'" + dbimgfileid
					+ "')}";
			QueryExecutors queryObj = new com.hethi.utils.QueryExecutors();
			queryObj.callProcedure(updateSql);
			
			
			 status="3";
			 logger.log(cusid,uid, file_id, process_id, sub_process_id,status,user_id);
			 

			// System.out.println("*****************----------***************************");
			count++;

		}

		// imageProcessesingServices.getFullOCR(File filename)

		System.out.println("Full extract complet ***************************");

		String next_channel = "daas.classify";
		String sfs_uin = "csfs100103";
		ipost.setSfs_uin(sfs_uin);
		ipost.setNext_queue(sfs_uin);
		ipost.setNext_channel(next_channel);

		String playload = ipost.toString();
		msg = MessageBuilder.withPayload(playload).setHeader("NextQue", ipost.getNext_channel()).build();
		return msg;

	}
	
	/* get image path from db */

	public ArrayList<ArrayList> getImgFile(String cusid, String uid)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException,
			MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {

		String sql = "{call load_img_fullextract('" + uid + "'," + "'" + cusid + "')}";
		// System.out.println("load_img_fullextract.." + sql);
		QueryExecutors queryObj = new QueryExecutors();
		@SuppressWarnings("rawtypes")
		ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
		// System.out.println("#########" + resultList);
		ArrayList<ArrayList> fileLocationList = resultList;
		return resultList;

		/* TEST METHOD */

		/*
		 * Properties properties = new Properties(); try { File currentDirFile =
		 * new File("."); String helper = currentDirFile.getAbsolutePath();
		 * String currentDir = helper.substring(0,
		 * helper.lastIndexOf('.')).replace('\\', '/'); properties.load(new
		 * FileInputStream(new
		 * File("src/main/resources/config/application.properties"))); } catch
		 * (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * String imageAbsPath=properties.getProperty("imageSourcePath");
		 * 
		 * String imageFullPath="";
		 * 
		 * 
		 * int i=0; //int count = fileLocationList.size();
		 * ArrayList<Map<String,String>> arrayList=fileLocationList.get(0);
		 * System.out.println("Total no of files  "+ arrayList);
		 * 
		 * int count=1; for(Map<String,String> mapObj: arrayList) {
		 * System.out.println("row "+count+" .. "+mapObj); String dbimgvalue =
		 * mapObj.get("file_location").replace("http://localhost:5050/", "/");
		 * String dbimgfileid = mapObj.get("file_id");
		 * //System.out.println("@@@@@@@@@"+imageAbsPath+dbimgvalue);
		 * System.out.println("333333333333"+dbimgfileid);
		 * imageFullPath=imageAbsPath+dbimgvalue; System.out.println(
		 * "check img location in db value   ***  " +imageFullPath);
		 * 
		 * 
		 * ImageProcessesingServices.getFullOCR(imageFullPath);
		 * 
		 * String updateSql = "{call save_update_fullocr_pdf('"
		 * +uid+"',"+"'"+cusid+"',"+"'"+dbimgfileid+"')}";
		 * queryObj.callProcedure(updateSql); System.out.println(
		 * "*****************----------***************************"); count++;
		 * 
		 * }
		 */

	}

	/*
	 * public static void main(String args[]) throws InstantiationException,
	 * IllegalAccessException, ClassNotFoundException, SQLException,
	 * IOException, MagicParseException, MagicMatchNotFoundException,
	 * MagicException, TesseractException {
	 * 
	 * Fullextract fe=new Fullextract();
	 * 
	 * fe.getImgFile( "1","138"); System.out.println("end");
	 * 
	 * }
	 */

}
