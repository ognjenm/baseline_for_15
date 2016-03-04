package com.hethi.rest.repo;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.hethi.rest.utility.QueryExecutors;

public class AdminHomeRepo {

	public String bpaas_load_customer_list(String query) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(query);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	
	public String loadEfsUin(String sql){
		Gson gson = new Gson();
		String queryOutput= "[{\"result\":\"No data\"}]";
		try {
			 QueryExecutors queryObj=new QueryExecutors();
			 @SuppressWarnings("rawtypes")
			 ArrayList<ArrayList> resultList=queryObj.getTableMetaData(sql);
			 System.out.println(gson.toJson(resultList));
			 return gson.toJson(resultList);
		}
	    catch(Exception e){
	    	queryOutput = "[{\"result\":\"Error\"}]";
	    }
		System.out.println(queryOutput);
	    return queryOutput;
	}


	public String getCcoreservices(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {

			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String getCcoreservicePlays(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String uploadReferenceData(ArrayList<String[]> resultData, String customer_id, String lookup_type) {
		String queryOutput = "[{\"result\":\"Success\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			for (int i = 0; i < resultData.size(); i++) {
				String[] row = resultData.get(i);
				String column = "";
				for (int j = 0; j < row.length; j++) {
					if (j == 0)
						column = column + "\'" + row[j] + "\'";
					else
						column = column + ",\'" + row[j] + "\'";
				}
				String sql = "insert into " + customer_id + "_" + lookup_type + "_lookup values(" + column + ")";
				System.out.println(sql);
				ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			}
			return queryOutput;
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String loadCustomerUsers(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String loadRulesPackages(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String saveRulesPackages(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.executeInsertOrUpdate(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String saveRulesWorkset(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String saveRulesSet(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String deleteRulesPackage(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.executeInsertOrUpdate(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String deleteRulesWorkSet(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.executeInsertOrUpdate(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String deleteRulesSet(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.executeInsertOrUpdate(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	
	public String load_uploads_by_status(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	
	public String load_uploaded_files_by_upload_id(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	public String load_all_forms_with_owner_and_template(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	public String assign_form_to_file(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	public String load_all_master_data(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	public String load_dashboard_data(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	public String load_all_process_and_sub_process(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	
	public String create_new_cformowner(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	
	
	public String create_new_efs_uin(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	
	
}
