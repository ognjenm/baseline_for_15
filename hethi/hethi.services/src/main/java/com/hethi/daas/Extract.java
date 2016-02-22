package com.hethi.daas;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.google.gson.Gson;
import com.hethi.domain.iPost;
import com.hethi.utils.Log;
import com.hethi.utils.QueryExecutors;

public class Extract {

	public Message<String> Extract(String data) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, IllegalArgumentException, InvocationTargetException, SQLException,
			FileNotFoundException, IOException, JSONException {

		String messageContent = data;
		Message<String> msg;
		String SEPARATOR = "-----------------------";
		String log = SEPARATOR + "inside_daas_Extract_channel" + SEPARATOR;
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
		String uploadid = ipost.getUid();
		String customerid = ipost.getCustomer_id();
		
		String process_id=ipost.getSfs_uin();
		String file_id="0";
		String sub_process_id="1";
		String status="1";
		String user_id="1";	
		
        Log logger=new Log();
		logger.log(customerid,uploadid, file_id, process_id, sub_process_id,status,user_id);


		/* get image and pdf location from db */
		ArrayList<ArrayList> fileLocationList = getPdflocation(uploadid, customerid);
		/* iterate image and pdf location */
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

		ArrayList<Map<String, String>> arrayList = fileLocationList.get(0);
		System.out.println("Total no of files  " + arrayList);

		int count = 1;
		String efs_data = "";

		for (Map<String, String> mapObj : arrayList) {
			
			 file_id= mapObj.get("file_id");
			 status="1";	
			 logger.log(customerid,uploadid, file_id, process_id, sub_process_id,status,user_id);
			
			
			// System.out.println("row " + count + " .. " + mapObj);
			String dbimgvalue = mapObj.get("file_location").replace("http://localhost:5050/", "/");
			imageFullPath = imageAbsPath + dbimgvalue;
			String dbimgfileid = mapObj.get("file_id");
			String dbimgefsuin = mapObj.get("efs_uin");
			System.out.println("efss_ uin   +" + dbimgefsuin);
			String pdfFullPath = imageFullPath.substring(0, imageFullPath.lastIndexOf(".")) + ".pdf";

			/* Call MXSDList method for geting MXSD file path */
			 status="2";	
			 logger.log(customerid,uploadid, file_id, process_id, sub_process_id,status,user_id);

			String mxsdList = getMXSDList(dbimgefsuin, customerid, uploadid);
			
			
			
			System.out.println("MXSDLIST path Result =======> " + mxsdList);

			File currentDirFile = new File(".");
			String helper = currentDirFile.getAbsolutePath();
			String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');

			System.out.println("currentDir " + currentDir.replace("hethi.services/", "hethi.ui/"));
			String pathFile = currentDir.replace("hethi.services/", "hethi.ui/") + "src/web/client/"
					+ mxsdList.substring(mxsdList.lastIndexOf("/images") + 1, mxsdList.length());

			/* Convert XML to JSON file */

			String jsonMXSD = XMLtoJsonConverter.convertXMLToJson(pathFile);

			System.out.println("MXSDLIST Result =======> " + mxsdList);

			/* get mxmlJson Object for json file */

			String mxsdjsonObject = ReadJson.jsonHandler(jsonMXSD, pdfFullPath, imageFullPath);

			System.out.println("MXSDLIST Json Result =======> " + mxsdjsonObject);
			//org.json.simple.JSONObject json = (org.json.simple.JSONObject) new JSONParser().parse(mxsdjsonObject);

			List<Map<String, String>> ixsddata = ReadJson.ixsdFieldHandler(mxsdjsonObject);
			Map<String, String> jsonmap = new HashMap<String,String>();
			
//			ixsddata.add(jsonmap);
			
			Gson gson = new Gson();
			String jsonStringFirst = gson.toJson(ixsddata);	
			JSONArray jArray=(JSONArray)new JSONParser().parse(jsonStringFirst);
			System.out.println("Json First string new =====>=====>  " + jsonStringFirst);
			
			Map<String,String> outputString=new HashMap<String,String>();
			for(int index=0;index<jArray.size();index++){
				JSONObject jsonObj1=(JSONObject)jArray.get(index);
				Extract ex=new Extract();
				outputString=ex.parse(jsonObj1, outputString);
			}
			String sql="select din from ixsd_cefs100101 where datetime=(select ifnull((select max(datetime) from ixsd_cefs100101),1))";
			QueryExecutors execu=new QueryExecutors();
			String din=execu.executeMyQuery(sql);
			din=String.valueOf(Integer.parseInt(din)+1);
			outputString.put("efs_uin","cefs100101");
			outputString.put("version","1");
			outputString.put("uid",uploadid);
			outputString.put("din",din);
			String outputJsonString=gson.toJson(outputString);
			System.out.println("final json string =="+outputJsonString);
			QueryExecutors exec = new QueryExecutors(); 
			String res=exec.savePOStencilData(outputJsonString); //
            System.out.println("Final result in Extract class ------> "+res);
//			JSONObject object = new JSONObject();
//			object.put("json", ixsddata);
//			

			//object.accumulateAll(ixsddata);
			
			// Map<String, String> map= ixsddata.get(0);
			
//			String jsonString = gson.toJson(object);

//			System.out.println("Json string new =====>=====>  " + jsonString);
//			for (Map<String, String> odj11 : ixsddata) {
//				System.out.println("Map list value   ======> " + odj11);
//			}

			// JSONObject jsonObj = new JSONObject(mxsdjsonObject);
			/*
			 * System.out.println(jsonObj.get("")); String xml =
			 * XML.toString(jsonObj); System.out.println(XML.toString(jsonObj));
			 * 
			 * System.out.println("Xml is ==== > \n " + xml);
			 * 
			 * XML file is insert to Database
			 * 
			 * String query = "{call cmxsd_efs_storage('" + customerid + "','" +
			 * xml + "')}";
			 * 
			 * QueryExecutors queryObj = new QueryExecutors();
			 * 
			 * @SuppressWarnings("rawtypes") ArrayList<ArrayList> resultList =
			 * queryObj.callProcedure(query); ArrayList<Map<String,String>>
			 * arrayObj=resultList.get(0);
			 */

			/*
			 * Map<String, String> output = new HashMap<String, String>();
			 * 
			 * 
			 * org.json.simple.JSONObject mxsd=(org.json.simple.JSONObject)
			 * json.get("mxsd"); org.json.simple.JSONObject
			 * form=(org.json.simple.JSONObject) mxsd.get("form");
			 * org.json.simple.JSONObject header=(org.json.simple.JSONObject)
			 * form.get("header"); org.json.simple.JSONObject
			 * group=(org.json.simple.JSONObject) header.get("group"); int
			 * flag=0; JSONArray field=null; org.json.simple.JSONObject
			 * field1=null; try{ field=(JSONArray) group.get("field"); }
			 * catch(Exception e){ flag=1;} if(flag == 1){ try{
			 * field1=(org.json.simple.JSONObject) group.get("field"); }
			 * catch(Exception e){ flag=2;} } org.json.simple.JSONObject
			 * object=null; if(flag==0){ for(int k=0;k<field.size();k++){
			 * object=(org.json.simple.JSONObject)field.get(k); Extract
			 * extract=new Extract(); extract.parse(object, output); } } else
			 * if(flag == 1){ Extract extract=new Extract();
			 * extract.parse((JSONObject) group.get("field"), output); }
			 * 
			 * 
			 * 
			 * output.put("efs_uin","ces100101"); output.put("version","1");
			 * output.put("uid",uploadid); //Gson gson = new Gson(); String
			 * headerText=gson.toJson(output);
			 * System.out.println("header..."+headerText); // String
			 * outputJsonString=gson.toJson(output); QueryExecutors exec = new
			 * QueryExecutors(); // String
			 * res=exec.savePOStencilData(outputJsonString); //
			 * System.out.println("Final result in Extract class ------> "+res);
			 * 
			 */
            
            
			 status="3";	
			 logger.log(customerid,uploadid, file_id, process_id, sub_process_id,status,user_id);

		}
		
		
		

		String next_channel = "baas.workflow";
		ipost.setNext_channel(next_channel);

		String playload = ipost.toString();
		msg = MessageBuilder.withPayload(playload).setHeader("NextQue", ipost.getNext_channel()).build();
		return msg;

	}

	public static String getMXSDList(String dbimgefsuin, String customerid, String uploadid)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

		//String sqltemp = "{call load_classify_templ_apply('" + dbimgefsuin + "'," + "'" + customerid + "','" + uploadid	+ "')}";
		QueryExecutors queryObj = new QueryExecutors();
		@SuppressWarnings("rawtypes")
		String sqlmxsd = "Select  cindexclassifystencil.eFS_XSD_location,  cindexclassifystencil.efs_uin From  cindexclassifystencil Where  cindexclassifystencil.form_stencid = (select max(cindexclassifystencil.form_stencid) from cindexclassifystencil where cindexclassifystencil.efs_uin='"
				+ dbimgefsuin + "')";
		String res = queryObj.executeMyQuery(sqlmxsd);
		return res;

	}

	public ArrayList<ArrayList> getPdflocation(String uid, String customerid)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

		String sql = "{call load_pdf_location('" + uid + "'," + "'" + customerid + "')}";
		QueryExecutors queryObj = new QueryExecutors();
		@SuppressWarnings("rawtypes")
		ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
		return resultList;

	}

	public static Map<String, String> parse(JSONObject json, Map<String, String> out) throws JSONException {
		
		JSONParser parser = new JSONParser();
		// Object obj = parser.parse(new FileReader("simple.json"));
		JSONObject jsonObject = (JSONObject) json;
		for (Iterator iterator = jsonObject.keySet().iterator(); iterator.hasNext();)
		{
			String key = (String) iterator.next();
			//System.out.println("json key == "+jsonObject.get(key));
			
				out.put(key, jsonObject.get(key).toString());
		}
		return out;
	}

	/*
	 * public static void main(String[] args) throws InstantiationException,
	 * IllegalAccessException, ClassNotFoundException, SQLException,
	 * FileNotFoundException, IOException, ParseException, JSONException {
	 * 
	 * String mxsdList = getMXSDList("cefs100101", "1", "86");
	 * System.out.println("mxsd " + mxsdList); File currentDirFile = new
	 * File("."); String helper = currentDirFile.getAbsolutePath(); String
	 * currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\',
	 * '/');
	 * 
	 * System.out.println("currentDir " + currentDir.replace("hethi.services/",
	 * "hethi.ui/")); String pathFile = currentDir.replace("hethi.services/",
	 * "hethi.ui/") + "src/web/client/" +
	 * mxsdList.substring(mxsdList.lastIndexOf("/images") + 1,
	 * mxsdList.length()); System.out.println("pathFile " + pathFile);
	 * 
	 * // String ss = //
	 * mxsdList.substring(0,mxsdList.lastIndexOf("/images")).replace(oldChar, //
	 * newChar) String imageFullPath = "D:/Feb_11/invoice_1.jpg"; String
	 * pdfFullPath = "D:/Feb_11/invoice_1.pdf"; // String jsonstring =
	 * "D:/jsonst.json"; String jsonstring =
	 * XMLtoJsonConverter.convertXMLToJson(pathFile);
	 * ReadJson.jsonHandler(jsonstring, pdfFullPath, imageFullPath);
	 * 
	 * }
	 */

}
