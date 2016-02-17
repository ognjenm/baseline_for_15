package com.hethi.utils;

import java.sql.SQLException;
import java.util.ArrayList;

public class Log {
	
	public void log(String Cus_id, String uid, String file_id, String process_id, String sub_process_id) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException
	
	{
		
		String sql = "{ call log_insert_todb('" + Cus_id + "'," + "'" + uid + "'," + "'" + file_id + "'," + "'" + process_id + "'," + "'" + sub_process_id + "') }"; 
		QueryExecutors queryObj = new QueryExecutors();
		@SuppressWarnings("rawtypes")
	 ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
		
		System.out.println("Success message  "+resultList);
		
	}

}
