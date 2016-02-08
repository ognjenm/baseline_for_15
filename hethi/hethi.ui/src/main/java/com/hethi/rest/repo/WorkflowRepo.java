package com.hethi.rest.repo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.hethi.rest.utility.FileOperations;
import com.hethi.rest.utility.QueryExecutors;

public class WorkflowRepo {
	
	public String reorderRulesSetSequence(String query){
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
	
	
	public String loadFormRules(String query) {
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

	public String createLookUpStorage(String query) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Success\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(query);
			System.out.println(queryOutput);
			return queryOutput;
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String searchLookUpStorage(String query) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Success\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.getTableMetaData(query);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[[{\"result\":\"Error\"}]]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String searchReferenceData(String query) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Success\"}]";
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

	public String searchIxsdContent(JSONObject json) throws Throwable {
		String queryOutput = "[{\"result\":\"No data\"}]";
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();

		try {
			FileOperations fileObject = new FileOperations();
			String fileName = fileObject.selectFile(json.get("table_name").toString(), json.get("efs_uin").toString());
			int index = 0;
			while (index == 0) {
				try {
					String className = "com.hethi.rest.model." + fileName;
					Object classObj = Class.forName(className).newInstance();
					String hql = "from " + fileName.toLowerCase() + " where din=:Din";
					Query queryResult = session.createQuery(hql);
					queryResult.setParameter("Din", json.get("din").toString());
					List<Object> allUsers = queryResult.list();
					Iterator<Object> it = allUsers.iterator();
					ArrayList<Map<String, String>> arrayString = new ArrayList<Map<String, String>>();
					while (it.hasNext()) {
						classObj = it.next();
						FileOperations repo = new FileOperations();
						Map<String, String> returnMap = repo.readElements(classObj);
						arrayString.add(returnMap);
					}
					Gson gson = new Gson();
					queryOutput = gson.toJson(arrayString);
					finalize();
					System.out.println(queryOutput);
					index++;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {

		}
		session.close();
		return queryOutput;
	}

	public String searchIxsdData() throws Throwable {
		String queryOutput = "[{\"result\":\"No data\"}]";
		ArrayList<ArrayList> result = new ArrayList<ArrayList>();
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();

		try {
			FileOperations fileObject = new FileOperations();
			ArrayList<String> fileNames = fileObject.listFilesToSelect();
			int index = 0;
			ArrayList<Map<String, String>> arrayString = new ArrayList<Map<String, String>>();
			while (index < fileNames.size()) {
				try {
					String className = "com.hethi.rest.model." + fileNames.get(index).toString();
					Object classObj = Class.forName(className).newInstance();
					String hql = "from " + fileNames.get(index).toString().toLowerCase();
					System.out.println(hql);
					Query queryResult = session.createQuery(hql);
					List<Object> allUsers = queryResult.list();
					Iterator<Object> it = allUsers.iterator();

					while (it.hasNext()) {
						classObj = it.next();
						FileOperations repo = new FileOperations();
						Map<String, String> returnMap = repo.readElements(classObj);
						arrayString.add(returnMap);
					}
					finalize();
					index++;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			Gson gson = new Gson();
			String query = "select user_id,user_name,customer_id from duser";
			QueryExecutors executors = new QueryExecutors();
			ArrayList<ArrayList> username = executors.callProcedure(query);
			String duser = gson.toJson(username.get(0));
			System.out.println(duser);
			result.add(arrayString);
			result.add(username.get(0));
			queryOutput = gson.toJson(result);
			System.out.println(queryOutput);
		} catch (Exception e) {

		}
		session.close();
		return queryOutput;
	}

	public String searchEfsuinForDin(String din) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			FileOperations fileObject = new FileOperations();
			ArrayList<String> fileNames = fileObject.listFilesToSelect();
			int index = 0;
			ArrayList<Map<String, String>> arrayString = new ArrayList<Map<String, String>>();
			QueryExecutors queryObj = new QueryExecutors();

			Map<String, String> column = null;
			while (index < fileNames.size()) {
				column = new HashMap<String, String>();
				String sql = "select efs_uin from " + fileNames.get(index).toString() + " where din=" + din;
				ArrayList<String> returnFlag = queryObj.checkRecord(sql);
				if (returnFlag.size() > 0) {
					String efs_uin = fileNames.get(index).toString().replace("_", " ").split(" ")[1];
					String query = "select form_type_decription_short from uicflob inner join ciconnector_efs on ciconnector_efs.efslob_id =uicflob.efslob_id where  ciconnector_efs.efs_uin='"
							+ efs_uin + "'";
					ArrayList<String> result = queryObj.checkRecord(query);
					String newSql = "select dupload_file.file_name,dupload_file.file_location,dupload_file.efs_uin from dupload_file inner join ixsd_"
							+ efs_uin + " on ixsd_" + efs_uin + ".uid =dupload_file.upload_id where  ixsd_" + efs_uin
							+ ".din='" + din + "' ";
					ArrayList<ArrayList> newResult = queryObj.callProcedure(newSql);
					Map<String, String> array = (Map<String, String>) (newResult.get(0).get(newResult.size() - 1));
					column.put("efs_uin", efs_uin);
					column.put("form_type", result.get(0));
					column.put("file_name", array.get("file_name"));
					column.put("file_location", array.get("file_location"));
					Gson gsonObj = new Gson();
					column.put("files", gsonObj.toJson(newResult.get(0)));
					arrayString.add(column);
				}
				index++;
			}
			System.out.println(gson.toJson(arrayString));
			return gson.toJson(arrayString);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String saveTfsUin(String query) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.executeInsertOrUpdate(query);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String select_ixsd_efs(String query) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.getIxsdMetaData(query);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String change_mxsd_tree(String query) {
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

	public String select_efs_template(String query) {
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

	
	

	public String reorderWorkSetSequence(String query){
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
	
	public String select_efs_templateg(String query){
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


	public String reorderRulesSequence(String query) {

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
	
	
	public String load_rules_by_sfs(String query){
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
	
	public String add_new_rules_for_sfs(String query){
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
	
	public String delete_rules_for_sfs(String query){
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
	

	public String saveSequence(String query){
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
	
	public String updateWorkset(String query){
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
	
	public String updateRuleset(String query){
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
	
	public String load_cbaas_workflow_rule(String query){
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
	public String enableRulesStatus(String query){
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
	    try {
	        QueryExecutors queryObj=new QueryExecutors();
	        @SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList=queryObj.executeInsertOrUpdate(query);
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
 
