package com.hethi.utils;

import java.sql.SQLException;
import java.util.ArrayList;

public class Log {
	
	public void log(String Cus_id, String uid, String file_id, String process_id, String sub_process_id,String status_code,String user_code) 	
	{
		
		String sql = "{ call upload_file_logging('" + Cus_id + "'," + "'" + uid + "'," + "'" + file_id + "'," + "'" + process_id + "'," + "'" + sub_process_id +  "'," + "'" + status_code +  "'," + "'" + user_code + "') }";
		QueryExecutors queryObj = new QueryExecutors();
		@SuppressWarnings("rawtypes")
		ArrayList<ArrayList> resultList;
		try {
			resultList = queryObj.callProcedure(sql);
			System.out.println("Logger.Log sql  :"+sql);
			System.out.println("Success message  "+resultList);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		

		
	}

}
