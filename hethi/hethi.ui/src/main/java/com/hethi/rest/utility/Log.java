package com.hethi.rest.utility;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Log {
	
	public void log(String Cus_id, String uid, String file_id, String process_id, String sub_process_id,String status_code,String user_code) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException
	
	{
		
		String sql = "{ call upload_file_logging('" + Cus_id + "'," + "'" + uid + "'," + "'" + file_id + "'," + "'" + process_id + "'," + "'" + sub_process_id +  "'," + "'" + status_code +  "'," + "'" + user_code + "') }";
		QueryExecutors queryObj = new QueryExecutors();
		@SuppressWarnings("rawtypes")
	    ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);		
		System.out.println("Logger.Log sql  :"+sql);
		System.out.println("Success message  "+resultList);
		
	}

}
