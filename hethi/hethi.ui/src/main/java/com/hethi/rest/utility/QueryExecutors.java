package com.hethi.rest.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
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
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.hethi.daas.Mapping.ClassifyModel;
import com.hethi.rest.repo.WorkflowRepo;



public class QueryExecutors {
	
	static final String url,user,password;
	
	static{
		Properties prop = new Properties();
		InputStream input = null;
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		try {
			input = new FileInputStream(currentDir + "src/main/resources/application.properties");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		try {
			prop.load(input);
		} catch (IOException e) {
			e.printStackTrace();
		}
		url = prop.getProperty("spring.datasource.url");
		user = prop.getProperty("spring.datasource.username");
		password = prop.getProperty("spring.datasource.password");
	}
	
	@SuppressWarnings({ "rawtypes" })
	
    public ArrayList<ArrayList> callProcedure(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
	
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			CallableStatement stm = conn.prepareCall(query);
			boolean results = stm.execute();
			int index = 0;
			while (results) {
				resultList = new ArrayList<Map>();
				ResultSet rs = stm.getResultSet();
				ResultSetMetaData rsmd = rs.getMetaData();
				int numberOfColumns = rsmd.getColumnCount();
				Map<String, String> singleRow = null;
				int i;
				if (rs.next()) {
					rs.beforeFirst();
					while (rs.next()) {
						index++;
						i = 1;
						singleRow = new HashMap<String, String>();
						while (i <= numberOfColumns) {
							singleRow.put(rsmd.getColumnLabel(i), rs.getString(i));
							i++;
						}
						if (index == 1)
							singleRow.put("result", "Success");
						System.out.println(singleRow+" map");
						resultList.add(singleRow);
					}
					System.out.println(resultList+" resultList");
					resultSet.add(resultList);
				} else {
					singleRow = new HashMap<String, String>();
					singleRow.put("result", "No Data");
					resultList.add(singleRow);
					resultSet.add(resultList);
				}
				results = stm.getMoreResults();
			}
			stm.close();
			conn.close();
			System.out.println(resultSet+" resultSet");
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}

	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> executeInsertOrUpdate(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			CallableStatement stm = conn.prepareCall(query);
			int record = stm.executeUpdate();
			resultList = new ArrayList<Map>();
			Map<String, String> singleRow = new HashMap<String, String>();
			if (record > 0) {
				singleRow.put("result", "Success");
			} else if (record == 0) {
				singleRow.put("result", "No Data");
			} else {
				singleRow.put("result", "Error");
			}
			resultList.add(singleRow);
			resultSet.add(resultList);
			stm.close();
			conn.close();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}

	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> getTableMetaData(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			resultList = new ArrayList<Map>();
			Map<String, String> singleRow = null;
			int index = 1;
			singleRow = new HashMap<String, String>();
			singleRow.put("result", "Success");
			resultList.add(singleRow);
			resultSet.add(resultList);
			resultList = new ArrayList<Map>();
			while (index <= numberOfColumns) {
				singleRow = new HashMap<String, String>();
				singleRow.put("column", rsmd.getColumnName(index));
				resultList.add(singleRow);
				index++;
			}
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}

	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> getDynamicTableData(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			resultList = new ArrayList<Map>();
			Map<String, String> singleRow = null;
			int index = 1;
			if (rs.next()) {
				singleRow = new HashMap<String, String>();
				singleRow.put("result", "Success");
				resultList.add(singleRow);
				resultSet.add(resultList);
				resultList = new ArrayList<Map>();
				singleRow = new HashMap<String, String>();
				rs.first();
				while (index <= numberOfColumns) {
					singleRow.put("column", rs.getString(index));
					resultList.add(singleRow);
					singleRow = new HashMap<String, String>();
					index++;
				}

				resultSet.add(resultList);
			} else {
				Map<String, String> singleRow1 = new HashMap<String, String>();
				singleRow1.put("result", "No Data");
				resultList.add(singleRow1);
				resultSet.add(resultList);
			}

			conn.close();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}

	public ArrayList<String> checkRecord(String query) throws IOException, SQLException {
		String returnFlag = "No data";
		String[] abc = null;
		ArrayList<String> list = new ArrayList<String>();
		
		Map<String, String> returnMap = new HashMap<String, String>();
		// load a properties file
		
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				int index = 1;
				rs.beforeFirst();
				int i = 0;
				while (rs.next()) {
					list.add(rs.getString(index));
					index++;
					i++;

				}
			} else {

			}

		} catch (Exception e) {

		}
		conn.close();
		return list;
	}

	public Map<String, String> getData(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		Map<String, String> singleRow = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			resultList = new ArrayList<Map>();

			int index = 1;
			singleRow = new HashMap<String, String>();
			singleRow.put("result", "Success");
			resultList.add(singleRow);
			resultSet.add(resultList);
			resultList = new ArrayList<Map>();
			while (index <= numberOfColumns) {
				singleRow = new HashMap<String, String>();
				singleRow.put(rsmd.getColumnName(index), rs.getString(index));
				resultList.add(singleRow);
				index++;
			}
			resultSet.add(resultList);
			conn.close();
			return singleRow;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return singleRow1;
		}
	}

	public ArrayList<ArrayList> getIxsdMetaData(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			resultList = new ArrayList<Map>();
			Map<String, String> singleRow = null;
			int index = 1;
			singleRow = new HashMap<String, String>();
			singleRow.put("result", "Success");
			resultList.add(singleRow);
			resultSet.add(resultList);
			resultList = new ArrayList<Map>();
			while (index <= numberOfColumns) {
				singleRow.put(rsmd.getColumnName(index), "");
				resultList.add(singleRow);
				index++;
			}
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}
	
	public Object invokeMethod(String propertName,Object classObj,Method method1,String input) throws NumberFormatException, IllegalAccessException,
	IllegalArgumentException, InvocationTargetException, ParseException{
		String variable=null;
	
		for(final Method method : classObj.getClass().getDeclaredMethods()){
			if(method.getName().endsWith(propertName) && method.getName().startsWith("get"))
				variable=method.getGenericReturnType().toString();
		//System.out.println("Exception variable===========>"+variable);
		}
		System.out.println(input);
		if(variable.equals("String")){
			if(input.equals(null) || input.equals(""))
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
		    {
		    	timestamp = dateFormat.format(date);
		    }
		    else
		    {
				timestamp = input;
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		Date parsedDate = df.parse(timestamp);
    		Timestamp times=new Timestamp(parsedDate.getTime());
    		method1.invoke(classObj, times);
		    }
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

	public void insertClassifyStatus(String sql) 
	{
		System.out.println("Inside DB");
	   // ArrayList<ClassifyModel> indexs = new ArrayList<ClassifyModel>();
	   
	    try {
	    	Connection conn=null;
			conn = DriverManager.getConnection(url, user, password);
	        Statement statement = conn.createStatement();
	        statement.executeUpdate(sql); 
	        conn.close();
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	}	

	 	

	
	
	
	
	@SuppressWarnings("null")
	public ArrayList<ClassifyModel> getAllUfs_UInByCustomer(String sql) 
	{
		System.out.println("Inside DB");
	    ArrayList<ClassifyModel> indexs = new ArrayList<ClassifyModel>();
	    Connection c;
	    try {
	    	Connection conn=null;
			conn = DriverManager.getConnection(url, user, password);
	        Statement statement = conn.createStatement();
	        ResultSet rs = statement.executeQuery(sql);
	        while (rs.next()) {
	        	ClassifyModel index = new ClassifyModel();
	        	index.setCustomer_id(rs.getInt("Customer_id"));
	        	index.setData_expected_content(rs.getString("data_expected_content"));
	        	index.setData_position_height(rs.getString("Data_position_height"));
	        	index.setData_position_left(rs.getString("Data_position_left"));
	        	index.setData_position_top(rs.getString("Data_position_top"));
	        	index.setData_position_width(rs.getString("Data_position_width"));
	        	index.setEfs_uin(rs.getString("Efs_uin"));
	        	indexs.add(index);
	        }

	        rs.close();
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return indexs;
	}
	
		
	
	
<<<<<<< .mine
	
||||||| .r88
	
>>>>>>> .r127
=======

>>>>>>> .r111
}
