package com.hethi.utils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class QueryExecutors {
	
	private String url = "jdbc:mysql://server:3306/hethi";
	private String user = "root";
	private String password = "password";
    
	@SuppressWarnings({ "rawtypes"})
	public ArrayList<ArrayList> callProcedure(String query)
			throws InstantiationException, IllegalAccessException, 
			ClassNotFoundException, SQLException{
		
	    ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
	    ArrayList<Map> resultList = null;
	    Connection conn=null;
	    try{
	    	
	    	conn = DriverManager.getConnection(url, user, password);
	        CallableStatement stm = conn.prepareCall(query);
	        boolean results = stm.execute();
	        int index=0;
	        while (results) {
	        	resultList = new ArrayList<Map>();
	        	ResultSet rs=stm.getResultSet();
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
		 		        	singleRow.put(rsmd.getColumnLabel(i),rs.getString(i));
		 		       	    i++;
		 		       	}
		 		        if(index==1)
                           singleRow.put("result", "Success");
		 		        resultList.add(singleRow);
		 	        }
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
}
