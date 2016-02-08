package com.hethi.rest.repo;

import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.hethi.rest.utility.QueryExecutors;

public class HethiHomeRepo {
	public String bpaas_load_home_content(String query){
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
	    try {
	        QueryExecutors queryObj=new QueryExecutors();
	        @SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList=queryObj.callProcedure(query);
	        System.out.println(gson.toJson(resultList));
	        return gson.toJson(resultList);
	    }
	    catch(Exception e){
	    	queryOutput = "[{\"result\":\"Error\"}]";
	    }
	    System.out.println(queryOutput);
	    return queryOutput;
	}
	
	public String listDocument(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
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
	
	public String updatedocumentqueue(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
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
	
	public String load_userlist(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
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
	
	public String load_roletasklist(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
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
	
	public String disableRule(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
		try {
			 
			 QueryExecutors queryObj=new QueryExecutors();
			 @SuppressWarnings("rawtypes")
			 ArrayList<ArrayList> resultList=queryObj.executeInsertOrUpdate(sql);
			 System.out.println(gson.toJson(resultList));
			 return gson.toJson(resultList);
		}
	    catch(Exception e){
	    	queryOutput = "[{\"result\":\"Error\"}]";
	    }
		System.out.println(queryOutput);
	    return queryOutput;
	}
	
	public String addPlatformUser(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
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
	
	public String loadAvailableRoles(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
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
	
	public String complete_user_registration(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
		try {
			 
			 QueryExecutors queryObj=new QueryExecutors();
			 @SuppressWarnings("rawtypes")
			 ArrayList<ArrayList> resultList=queryObj.executeInsertOrUpdate(sql);
			 System.out.println(gson.toJson(resultList));
			 return gson.toJson(resultList);
		}
	    catch(Exception e){
	    	queryOutput = "[{\"result\":\"Error\"}]";
	    }
		System.out.println(queryOutput);
	    return queryOutput;
	}
	
	public String saveNewRule(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
		try {
			 
			 QueryExecutors queryObj=new QueryExecutors();
			 @SuppressWarnings("rawtypes")
			 ArrayList<ArrayList> resultList=queryObj.executeInsertOrUpdate(sql);
			 System.out.println(gson.toJson(resultList));
			 return gson.toJson(resultList);
		}
	    catch(Exception e){
	    	queryOutput = "[{\"result\":\"Error\"}]";
	    }
		System.out.println(queryOutput);
	    return queryOutput;
	}
	
	public String assign_task(String sql) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
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

}
