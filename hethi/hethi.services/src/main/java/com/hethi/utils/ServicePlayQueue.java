package com.hethi.utils;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.hethi.domain.iPost;

public class ServicePlayQueue {
	public String NextServicePlay(String data) {
		 iPost ipost=new iPost(data);
		
		String CID=ipost.getCustomer_id();
		String EFS_UIN=ipost.getEfs_uin();
		String SFS_UIN="csfs100101";
		
		String sql = "{ call load_next_serviceplay('"+CID+"','"+EFS_UIN+"','"+SFS_UIN+"') }";
		System.out.println(sql);
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"Nodata\"}]";
		try {
			 QueryExecutors queryObj=new QueryExecutors();
			 @SuppressWarnings("rawtypes")
			 ArrayList<ArrayList> resultList=queryObj.callProcedure(sql);
			 System.out.println(gson.toJson(resultList));
			 return gson.toJson(resultList);
		}
	    catch(Exception e){
	    	queryOutput = "[{\"result\":\"Error\"}]";
	    }
		System.out.println(queryOutput);
	    return queryOutput;
		
	
		
	}
	public Map<String,String> readElements(Object classObj) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
	    //System.out.println("2222222222222222222222"+classObj.getClass());
		Method[] methods =classObj.getClass().getDeclaredMethods();
	    Map<String,String> jsonMap=new HashMap<String,String>();
	    for (Method method : methods) {
	        String name = method.getName();
	        String propertyName=method.getName().substring(3, method.getName().length());
			String jsonKey=propertyName.toLowerCase();
			if(classObj.getClass().getName().contains("l"))
			//System.out.println("******jsonKey*********"+jsonKey);
	        if (name.startsWith("get") && !name.equalsIgnoreCase("getClass") ) {
	        	if (jsonKey.equals(classObj.getClass().toString()+"_lineitem")) {
	        		
		        }
	        	else
	        	{
	        		
	        		String value = "";
	 	           
	                value = String.valueOf(method.invoke(classObj));
	                jsonMap.put(jsonKey, value);
	          
	        	}
	            
	        }
	    }
	    return jsonMap;
	}
	public ArrayList<String> listFilesToInsert(String form){
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File folder=new File(currentDir+"src/main/java/com/hethi/rest/model");
		ArrayList<String> fileNames=new ArrayList<String>();
		for(final File fileEntry:folder.listFiles()){
			if(fileEntry.getName().startsWith("ixsd_"+form) && !(fileEntry.getName().endsWith("exception.java"))){
				fileNames.add(fileEntry.getName().split(".java")[0]);
			}
		}
		return fileNames;
	}
	public ArrayList<String> listObjectsForRules(String form){
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File folder=new File(currentDir+"src/main/java/com/hethi/rest/model");
		ArrayList<String> fileNames=new ArrayList<String>();
		for(final File fileEntry:folder.listFiles()){
			if(fileEntry.getName().startsWith("ixsd_"+form) ){
				fileNames.add(fileEntry.getName().split(".java")[0]);
			}
		}
		return fileNames;
	}
	public Object getExceptionObject(iPost ipost) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		Object classObj = null;
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File folder=new File(currentDir+"src/main/java/com/hethi/rest/model");
		for(final File fileEntry:folder.listFiles()){
			if(fileEntry.getName().startsWith("ixsd_"+ipost.getEfs_uin()) && (fileEntry.getName().endsWith("exception.java"))){
				String fileName=fileEntry.getName().split(".java")[0];		
				String className = "com.hethi.rest.model."+fileName;	
				 classObj = Class.forName(className).newInstance();
			}
		}
		
		return classObj;
	}
}
