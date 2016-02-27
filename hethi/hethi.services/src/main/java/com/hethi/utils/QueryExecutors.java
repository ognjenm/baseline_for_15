package com.hethi.utils;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.hethi.daas.ClassifyModel;




public class QueryExecutors {
	
	private String url = "jdbc:mysql://user-pc:3306/hethi";
	private String user = "root";
	private String password = "root";
    
	@SuppressWarnings({ "rawtypes"})
	public ArrayList<ArrayList> callProcedure(String query)
			throws InstantiationException, IllegalAccessException, 
			ClassNotFoundException, SQLException{
		
	    ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
	    ArrayList<Map> resultList = null;
	    Connection conn=null;
	    try{
	    	System.out.println(query);
	    	conn = DriverManager.getConnection(url, user, password);
	        CallableStatement stm = conn.prepareCall(query);
	        boolean results = stm.execute();
	        int index=0;
	        while (results) {
	        	
	        	resultList = new ArrayList<Map>();
	        	ResultSet rs=stm.getResultSet();
//	        	System.out.println(rs.getRowId("eFS_XSD"));
	   	        ResultSetMetaData rsmd =rs.getMetaData();
		        int numberOfColumns = rsmd.getColumnCount();
		        Map <String,String> singleRow = null;
		        int i;
		        if(rs.next()){
		        	 rs.beforeFirst();
                     while(rs.next()){
                    	index++; 
		        		i=1;
		        		singleRow = new HashMap<String,String>();
		 		        while(i<=numberOfColumns){
		 		        	System.out.println(rs.getString(i));
		 		        	singleRow.put(rsmd.getColumnLabel(i),rs.getString(i));
		 		        	System.out.println(singleRow+" singleRow");
		 		       	    i++;
		 		       	}
		 		        if(index==1)
                           singleRow.put("result", "Success");
		 		        resultList.add(singleRow);
		 	        }
                     System.out.println("resut list="+resultList);
		        	resultSet.add(resultList);
		        }
		        else{
		        	singleRow = new HashMap<String,String>();
		        	singleRow.put("result", "No Data");
				    resultList.add(singleRow);
				    resultSet.add(resultList);
		        }
		        results = stm.getMoreResults();
	        }
	        stm.close();
	        conn.close();
	        System.out.println("reultset="+resultSet);
	        return resultSet;
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    	Map <String,String> singleRow1=new HashMap<String,String>();
	    	singleRow1.put("result","Error");
	    	resultList.add(singleRow1);
	    	resultSet.add(resultList);
	    	conn.close();
	    	return resultSet;
	    }
	}
	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> executeInsertOrUpdate(String query)
			throws InstantiationException, IllegalAccessException, 
			ClassNotFoundException, SQLException{
	    System.out.println("ffffff"+query);
	    ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
	    ArrayList<Map> resultList = null;
	    Connection conn=null;
	    try{
	    	conn = DriverManager.getConnection(url, user, password);
	        CallableStatement stm = conn.prepareCall(query);
	        int record=stm.executeUpdate();
	        resultList = new ArrayList<Map>();
	        Map <String,String> singleRow = new HashMap<String,String>();
	        if(record>0){
	        	singleRow.put("result", "Success");
 		    }
	        else if(record==0){
	        	singleRow.put("result", "No Data");
	        }
	        else{
	        	singleRow.put("result", "Error");
	        }
	        resultList.add(singleRow);
	        resultSet.add(resultList);
	        stm.close();
	        conn.close();
	        return resultSet;
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    	Map <String,String> singleRow1=new HashMap<String,String>();
	    	singleRow1.put("result","Error");
	    	resultList.add(singleRow1);
	    	resultSet.add(resultList);
	    	conn.close();
	    	return resultSet;
	    }
	}
	public String executeMyQuery(String sql){
		//System.out.println(sql);
		String result = null;
		System.out.println("query is Start now");
		try{
			System.out.println("query is try now");
			Connection conn=null;
			conn = DriverManager.getConnection(url, user, password);
			Statement st=conn.createStatement();
			ResultSet rst =st.executeQuery(sql);
			//System.out.println(rst);
			while(rst.next())
			{
			result=rst.getString(1);
			System.out.println("result set is --- > "+result);
			}
			System.out.println("the vaue is ----- >"+result);
			
			
		}
		catch(Exception e){
			
		}
		return  result;
	}
	
	
	public String savePOStencilData(String json1)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, org.json.simple.parser.ParseException {
		String queryOutput = "[{\"result\":\"No data\"}]";
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		SessionFactory factory = config.buildSessionFactory();
		System.out.println("received in hibernate="+json1);
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
        JSONObject json=(JSONObject) new JSONParser().parse(json1);
//        System.out.println("efs_uin="+json.get("efs_uin").toString());
		try {
			QueryExecutors fileObject = new QueryExecutors();
			ArrayList<String> fileNames = fileObject.listFilesToInsert(json.get("efs_uin").toString());
			int index = 0;
			while (index < fileNames.size()) {
//				System.out.println(fileNames.get(index).toString() + " is the table name");
				String className = "com.hethi.rest.model." + fileNames.get(index).toString();
				Object classObj = Class.forName(className).newInstance();
				Object classNewObj = null;
				int flag=0;
				for (final Method method : classObj.getClass().getDeclaredMethods()) {
					if(method.getName().startsWith("get")){
						String propertyName = method.getName().substring(3, method.getName().length());
						String jsonKey = propertyName.toLowerCase();
						System.out.println("before iterate ="+jsonKey);
						flag=0;
						for (Iterator iterator = json.keySet().iterator(); iterator.hasNext();)
						{
							String key = (String) iterator.next();
							
							if(jsonKey.equals(key)){
								System.out.println("json key == "+key);
								flag = 1;
								break;
							}
							else
								flag=0;
							System.out.println(key+" with "+flag);
						}
						if(flag == 0){
							json.put(jsonKey, "");
							System.out.println("full json ====>==>"+jsonKey+" "+json.toJSONString());
						}
					}
				}
//				System.out.println("full json ====>==>"+json.toJSONString());
				for (final Method method : classObj.getClass().getDeclaredMethods()) {
					String propertyName = method.getName().substring(3, method.getName().length());
					String jsonKey = propertyName.toLowerCase();
					if (method.getName().startsWith("set")) {
						String input = null;
						try {
							input = json.get(jsonKey).toString();
							method.invoke(classObj, input);
							classNewObj = classObj;
						} catch (Exception e) {
							QueryExecutors operands = new QueryExecutors();
							classNewObj = operands.invokeMethod(propertyName, classObj, method, input);

						}
					}
				}
				session.save(classNewObj);
				
				index++;
			}
			trans.commit();
			session.close();
			return "[{\"result\":\"Success\"}]";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return queryOutput;
	}
	
	public Object invokeMethod(String propertName,Object classObj,Method method1,String input) throws NumberFormatException, IllegalAccessException,
	IllegalArgumentException, InvocationTargetException, ParseException{
		String variable=null;
		for(final Method method : classObj.getClass().getDeclaredMethods()){
			if(method.getName().endsWith(propertName) && method.getName().startsWith("get"))
				variable=method.getGenericReturnType().toString();
//			System.out.println("variable=="+variable);
		}
		System.out.println(input);
		if(variable.equals("String")){
			if(input==null || input.equals(""))
				input="";
			method1.invoke(classObj, input);
		}
		if(variable.equals("int")){
			if(input==null || input.equals(""))
				input="0";
			int inputNumber=Integer.parseInt(input);
			method1.invoke(classObj, inputNumber);
		}
		else if(variable.equals("long")){
			if(input==null  || input.equals(""))
				input="0";
			long inputNumber=Long.parseLong(input);
			method1.invoke(classObj, inputNumber);
		}
		else if(variable.equals("float")){
			if(input==null ||  input.equals(""))
				input="0.0";
			float inputNumber=Float.parseFloat(input);
			method1.invoke(classObj, inputNumber);
		}
		else if(variable.equals("double")){
			if(input==null  || input.equals(""))
				input="0.0";
			double inputNumber=Double.parseDouble(input);
			method1.invoke(classObj, inputNumber);
		}
		else if(variable.equals("class java.sql.Timestamp")){
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    Date date = new Date();
		    String timestamp=null;
//		    System.out.println(input);
		    if(input.equals(null) || input.equals(""))
		    	timestamp = dateFormat.format(date);
		    else
				timestamp = input;
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		Date parsedDate = df.parse(timestamp);
    		Timestamp times=new Timestamp(parsedDate.getTime());
    		method1.invoke(classObj, times);
		}
		else if(variable.equals("class java.util.Date")){
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    Date date = new Date();
		    String timestamp=null;
		    if(input.equals(null) || input.equals(""))
		    	timestamp = dateFormat.format(date);
		    else
				timestamp = input;
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    		Date parsedDate = df.parse(timestamp);
    		Timestamp times=new Timestamp(parsedDate.getTime());
    		method1.invoke(classObj, times);
		}
		return classObj;
	}
	
	public ArrayList<String> listFilesToInsert(String form){
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		String filepath=currentDir+"src/main/java/com/hethi/rest/model";
		System.out.println("filepath=="+filepath);
		File folder=new File(filepath);
		ArrayList<String> fileNames=new ArrayList<String>();
		for(final File fileEntry:folder.listFiles()){
			System.out.println("filename="+fileEntry.getName());
			if(fileEntry.getName().endsWith(form+".java") || fileEntry.getName().endsWith(form+"_lineitem.java")){
				System.out.println("just adding="+fileEntry.getName().split(".java")[0]);
				fileNames.add(fileEntry.getName().split(".java")[0]);
			}
		}
		System.out.println(fileNames);
		return fileNames;
	}

	
	

	/**
	 * 
	 * for classification alone
	 * 
	 * 
	 */
	
	
	@SuppressWarnings("null")
	public ArrayList<ClassifyModel> getAllUfs_UInByCustomer(String sql) 
	{
//		System.out.println("Inside DB");
//	    ArrayList<ClassifyModel> indexs = new ArrayList<ClassifyModel>();
//	    Connection c;
//	    try {
//	    	Connection conn=null;
//			conn = DriverManager.getConnection(url, user, password);
//	        Statement statement = conn.createStatement();
//	        ResultSet rs = statement.executeQuery(sql);
//	        while (rs.next()) {
//	        	ClassifyModel index = new ClassifyModel();
//	        	index.setCustomer_id(rs.getInt("Customer_id"));
//	        	index.setData_expected_content(rs.getString("data_expected_content"));
//	        	index.setData_position_height(rs.getString("Data_position_height"));
//	        	index.setData_position_left(rs.getString("Data_position_left"));
//	        	index.setData_position_top(rs.getString("Data_position_top"));
//	        	index.setData_position_width(rs.getString("Data_position_width"));
//	        	index.setEfs_uin(rs.getString("Efs_uin"));
//	        	indexs.add(index);
//	        }
//
//	        rs.close();
//	    } catch (Exception e) {
//	        System.out.println(e);
//	    }
	    return null;
	}
	
	
	
	
	
}
