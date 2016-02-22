package com.hethi.rest.repo;

import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

import com.hethi.rest.utility.FileOperations;
import com.hethi.rest.utility.QueryExecutors;

public class WorkflowRepo {

	public String reorderRulesSetSequence(String query) {
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

	public String searchIxsdContentLineitem(JSONObject json) throws Throwable {
		String queryOutput = "[{\"result\":\"No data\"}]";
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();

		try {
			FileOperations fileObject = new FileOperations();
			Gson gson = new Gson();
			String fileName = fileObject.selectFile(json.get("table_name").toString(), json.get("efs_uin").toString());
			int index = 0;
			int version;

			while (index == 0) {
				try {

					String className = "com.hethi.rest.model." + fileName;
					System.out.println("class name line item ===> " + className);
					Object classObj = Class.forName(className).newInstance();

					QueryExecutors queryObj = new QueryExecutors();
					@SuppressWarnings("rawtypes")

					ArrayList<ArrayList> resultList = queryObj.callProcedure(
							"Select max(version)as version FROM hethi.ixsd_cefs100101_lineitem where din="
									+ json.get("din").toString() + ";");
					String json2 = gson.toJson(resultList.get(0).get(0));
					System.out.println(json2);
					JSONObject jsonD = (JSONObject) new JSONParser().parse(json2);
					version = Integer.valueOf((String) jsonD.get("version"));
					System.out.println("json version string ==> " + version);
					System.out.println(version + "resultvalue==> " + jsonD.toJSONString());

					String hql = "from " + fileName.toLowerCase() + " where din=:Din and version = " + version;
					System.out.println("select line item query in workfolow rep===> " + hql);
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
					// Gson gson = new Gson();
					queryOutput = gson.toJson(arrayString);
					finalize();
					System.out.println("Line item result ====> " + queryOutput);
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
					System.out.println("class name line item ===> " + className);
					Object classObj = Class.forName(className).newInstance();
					String hql = "from " + fileName.toLowerCase() + " where din=:Din";
					System.out.println("select line item query in workfolow rep===> " + hql);
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
					System.out.println("Line item result ====> " + queryOutput);
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

	/*
	 * public String updateIxsdContent(JSONObject json) throws Throwable {
	 * System.out.println("=============>Enter Last insert"); String queryOutput
	 * = "[{\"result\":\"No data\"}]"; Configuration config = new
	 * Configuration(); config.configure("hibernate/hibernate.cfg.xml");
	 * SessionFactory factory = config.buildSessionFactory(); Session session =
	 * factory.openSession(); Transaction trans = session.beginTransaction();
	 * 
	 * try { System.out.println("=============>Enter Try block "); JSONArray
	 * table_json_rootObj = (JSONArray) json.get("table");
	 * System.out.println("first==>"+table_json_rootObj.toString()); JSONArray
	 * linitem_json_rootObj = (JSONArray) json.get("linitem");
	 * System.out.println("secont==>"+linitem_json_rootObj.toString()); String
	 * tabelclsname = ""; String lineitemclsname="";
	 * 
	 * 
	 * for(int i=0;i<table_json_rootObj.size();i++){ JSONObject json_data =
	 * (JSONObject) table_json_rootObj.get(i); String key
	 * =String.valueOf(json_data.get("key")); String value
	 * =String.valueOf(json_data.get("value")); //System.out.println(key);
	 * //System.out.println(value); if(key.equals("efs_uin")){ tabelclsname =
	 * value; System.out.println("tabelclsname===>"+tabelclsname);
	 * 
	 * }
	 * 
	 * }
	 * 
	 * 
	 * 
	 * for(int i=0;i<linitem_json_rootObj.size();i++){ JSONObject json_data =
	 * (JSONObject) linitem_json_rootObj.get(i); String key
	 * =String.valueOf(json_data.get("key")); String value
	 * =String.valueOf(json_data.get("value")); //System.out.println(key);
	 * //System.out.println(value); if(key.equals("efs_uin")){ lineitemclsname =
	 * value; System.out.println("tabelclsname===>"+lineitemclsname);
	 * 
	 * }
	 * 
	 * }
	 * 
	 * Gson gson = new Gson();
	 * 
	 * Map<String,String> tableString=new HashMap<String,String>();
	 * Map<String,String> returnString=new HashMap<String,String>(); for(int
	 * index=0;index<table_json_rootObj.size();index++){ JSONObject
	 * jsonObj1=(JSONObject)table_json_rootObj.get(index); WorkflowRepo ex=new
	 * WorkflowRepo(); tableString=ex.parse(jsonObj1,tableString); //
	 * System.out.println("return ......."+tableString); Set keys =
	 * tableString.keySet();
	 * 
	 * for (Iterator i = keys.iterator(); i.hasNext(); ) { String key = (String)
	 * i.next(); String value = (String) tableString.get(key);
	 * //System.out.println("key="+key+" and value="+value);
	 * returnString.put(key, value); // System.out.println("now ="
	 * +returnString); }
	 * 
	 * 
	 * }
	 * 
	 * String outputJsonTable=gson.toJson(returnString); System.out.println(
	 * "final jsonTable string =="+outputJsonTable);
	 * 
	 * 
	 * Map<String,String> lineitemString=new HashMap<String,String>();
	 * Map<String,String> lineitemString1=new HashMap<String,String>(); for(int
	 * index=0;index<linitem_json_rootObj.size();index++){ JSONObject
	 * jsonObj1=(JSONObject)linitem_json_rootObj.get(index); WorkflowRepo ex=new
	 * WorkflowRepo(); lineitemString= ex.parse(jsonObj1,lineitemString); //
	 * System.out.println("return value==="+lineitemString); Set keys =
	 * lineitemString.keySet();
	 * 
	 * for (Iterator i = keys.iterator(); i.hasNext(); ) { String key = (String)
	 * i.next(); String value = (String) lineitemString.get(key);
	 * lineitemString1.put(key, value); } } String
	 * outputJsonlineitem=gson.toJson(lineitemString1); System.out.println(
	 * "final jsonlineitem string =="+outputJsonlineitem);
	 * 
	 * 
	 * //System.out.println("tabelclsname===>"+tabelclsname);
	 * 
	 * 
	 * //FileOperations fileObject = new FileOperations(); //String
	 * lineitemfileName =
	 * fileObject.selectFile(json.get("table_name").toString(),
	 * json.get("efs_uin").toString()); //String tablefileName =
	 * fileObject.selectFile(table_json_rootObj.get("table_name").toString(),
	 * table_json_rootObj.get("efs_uin").toString());
	 * 
	 * System.out.println("linitem_json_rootObj==>"+linitem_json_rootObj);
	 * System.out.println("table_json_rootObj==>"+table_json_rootObj);
	 * 
	 * Session tempSession=factory.openSession(); Transaction
	 * tempTrans=tempSession.beginTransaction();
	 * 
	 * 
	 * //System.out.println("lineitemfileName ==> "+lineitemfileName);
	 * //System.out.println("tablefileName ==> "+tablefileName);
	 * 
	 * int index = 0; while (index == 0) { try { String className =
	 * "com.hethi.rest.model.ixsd_" + tabelclsname; Object classObj =
	 * Class.forName(className).newInstance();
	 * 
	 * classObj = new Gson().fromJson(outputJsonTable.toString(),
	 * classObj.getClass());
	 * 
	 * 
	 * tempSession.flush(); tempSession.clear(); tempSession.save(classObj);
	 * 
	 * tempSession.getTransaction().commit(); tempSession.close();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } try { String className =
	 * "com.hethi.rest.model.ixsd_" + lineitemclsname+"_lineitem"; Object
	 * classObj = Class.forName(className).newInstance(); classObj = new
	 * Gson().fromJson(outputJsonlineitem.toString(), classObj.getClass());
	 * 
	 * tempSession.flush(); tempSession.clear(); tempSession.save(classObj);
	 * 
	 * tempSession.getTransaction().commit(); tempSession.close(); } catch
	 * (Exception e) { e.printStackTrace(); }
	 * 
	 * } } catch (Exception e) {
	 * 
	 * } session.close(); return queryOutput; }
	 */

	public static String updateIxsdContent(String json1) throws InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException, org.json.simple.parser.ParseException {
		QueryExecutors fileObject = new QueryExecutors();
		String queryOutput = "[{\"result\":\"No data\"}]";
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		SessionFactory factory = config.buildSessionFactory();
		System.out.println("received in hibernate=" + json1);

		JSONObject json = (JSONObject) new JSONParser().parse(json1);
		// System.out.println("efs_uin="+json.get("efs_uin").toString());
		try {

			/* divide tha json class for insert */

			JSONArray table_json_rootObj = (JSONArray) json.get("table");
			System.out.println("Table value   ==>" + table_json_rootObj);
			JSONArray linitem_json_rootObj = (JSONArray) json.get("linitem");
			System.out.println("line item Table value   ==>" + linitem_json_rootObj);
			String tabelclsname = "";
			String lineitemclsname = "";

			/* Find the bean class name for insert */

			for (int i = 0; i < table_json_rootObj.size(); i++) {
				JSONObject json_data = (JSONObject) table_json_rootObj.get(i);
				String key = String.valueOf(json_data.get("key"));
				String value = String.valueOf(json_data.get("value"));
				// System.out.println(key);
				// System.out.println(value);
				if (key.equals("efs_uin")) {
					tabelclsname = value;
					System.out.println("tabelclsname===>" + tabelclsname);
				}
			}

			for (int i = 0; i < linitem_json_rootObj.size(); i++) {
				JSONArray json_data_Array = (JSONArray) linitem_json_rootObj.get(i);
				for (int j = 0; j < json_data_Array.size(); j++) {
					JSONObject json_data = (JSONObject) json_data_Array.get(j);
					String key = String.valueOf(json_data.get("key"));
					String value = String.valueOf(json_data.get("value"));
					if (key.equals("efs_uin")) {
						lineitemclsname = value;
						System.out.println("linetabelclsname===>" + lineitemclsname);

					}
				}

			}

			/* Restructured Json And insert for insert static in db */

			Gson gson = new Gson();

			Map<String, String> tableString = new HashMap<String, String>();
			Map<String, String> returnString = new HashMap<String, String>();

			for (int index = 0; index < table_json_rootObj.size(); index++) {
				JSONObject jsonObj1 = (JSONObject) table_json_rootObj.get(index);
				WorkflowRepo ex = new WorkflowRepo();
				tableString = WorkflowRepo.parse(jsonObj1, tableString);
				Set keys = tableString.keySet();

				for (Iterator i = keys.iterator(); i.hasNext();) {
					String key = (String) i.next();
					String value = (String) tableString.get(key);
					// System.out.println("key="+key+" and value="+value);
					returnString.put(key, value);
					// System.out.println("now ="+returnString);
				}

			}

			String outputJsonTable = gson.toJson(returnString);
			JSONObject tableobj = (JSONObject) new JSONParser().parse(outputJsonTable);
			System.out.println("final jsonTable string ==" + outputJsonTable);

			ArrayList<String> fileNames1 = fileObject.listFilesToInsert(tableobj.get("efs_uin").toString());
			int index11 = 0;
			while (index11 < fileNames1.size()) {
				// System.out.println(fileNames.get(index).toString() + " is the
				// table name");
				String className = "com.hethi.rest.model." + fileNames1.get(index11).toString();
				Object classObj = Class.forName(className).newInstance();
				Object classNewObj = null;
				int flag = 0;
				for (final Method method : classObj.getClass().getDeclaredMethods()) {
					if (method.getName().startsWith("get")) {
						String propertyName = method.getName().substring(3, method.getName().length());
						String jsonKey = propertyName.toLowerCase();
						// System.out.println("before iterate ="+jsonKey);
						flag = 0;

					}
				}
				// System.out.println("full json ====>==>"+json.toJSONString());
				for (final Method method : classObj.getClass().getDeclaredMethods()) {
					String propertyName = method.getName().substring(3, method.getName().length());
					String jsonKey = propertyName.toLowerCase();
					// System.out.println("json keyvalue==<>==<>===>"+jsonKey);
					if (method.getName().startsWith("set")) {
						String input = null;
						try {
							input = tableobj.get(jsonKey).toString();
							// System.out.println("input value1=====>"+input);
							method.invoke(classObj, input);
							classNewObj = classObj;
						} catch (Exception e) {
							QueryExecutors operands = new QueryExecutors();
							classNewObj = operands.invokeMethod(propertyName, classObj, method, input);

						}
					}
				}

				Session tempSession = factory.openSession();
				Transaction tempTrans = tempSession.beginTransaction();
				tempSession.flush();
				tempSession.clear();
				tempSession.save(classNewObj);
				tempSession.getTransaction().commit();
				tempSession.close();

				index11++;
			}

			/* Restructured Json And insert for insert Dynamic table (line item) in db */
			
			Map<String, String> lineitemString = new HashMap<String, String>();
			Map<String, String> lineitemString1 = new HashMap<String, String>();
			// System.out.println("linitem_json_rootObj.size()-1====>"+linitem_json_rootObj.size());

			for (int index = 0; index < linitem_json_rootObj.size(); index++) {
				JSONArray jsonObjarray = (JSONArray) linitem_json_rootObj.get(index);

				for (int index1 = 0; index1 < jsonObjarray.size() - 1; index1++) {
					lineitemString1 = new HashMap<String, String>();
					JSONObject jsonObj1 = (JSONObject) jsonObjarray.get(index1);

					lineitemString = WorkflowRepo.parse(jsonObj1, lineitemString);
					System.out.println("return value===" + lineitemString);
					Set keys = lineitemString.keySet();

					for (Iterator i = keys.iterator(); i.hasNext();) {
						String key = (String) i.next();
						String value = (String) lineitemString.get(key);
						lineitemString1.put(key, value);

					}

				}

				String outputJsonlineitem = gson.toJson(lineitemString1);
				JSONObject lineobj = (JSONObject) new JSONParser().parse(outputJsonlineitem);
				System.out.println("final jsonlineitem string ==>" + lineobj.toString());

				ArrayList<String> fileNames = fileObject.listFilesToInsert(lineobj.get("efs_uin").toString());
				int index1 = 0;
				System.out.println("fileNames size  ==> " + fileNames);

				while (index1 < fileNames.size()) {					
					String className = "com.hethi.rest.model." + fileNames1.get(index11).toString();
					Object classObj = Class.forName(className).newInstance();
					Object classNewObj = null;
					int flag = 0;
					for (final Method method : classObj.getClass().getDeclaredMethods()) {
						if (method.getName().startsWith("get")) {
							String propertyName = method.getName().substring(3, method.getName().length());
							String jsonKey = propertyName.toLowerCase();
							// System.out.println("before iterate ="+jsonKey);
							flag = 0;

						}
					}
					
					for (final Method method : classObj.getClass().getDeclaredMethods()) {
						String propertyName = method.getName().substring(3, method.getName().length());
						String jsonKey = propertyName.toLowerCase();					
						if (method.getName().startsWith("set")) {
							String input = null;
							try {
								input = lineobj.get(jsonKey).toString();							
								method.invoke(classObj, input);
								classNewObj = classObj;
							} catch (Exception e) {
								QueryExecutors operands = new QueryExecutors();
								classNewObj = operands.invokeMethod(propertyName, classObj, method, input);

							}
						}
					}

					Session tempSession = factory.openSession();
					Transaction tempTrans = tempSession.beginTransaction();
					tempSession.flush();
					tempSession.clear();
					tempSession.save(classNewObj);
					tempSession.getTransaction().commit();
					tempSession.close();

					index11++;
				}

			}

			factory.close();

			return "[{\"result\":\"Success\"}]";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return queryOutput;
	}

	private static Map<String, String> parse(JSONObject json1, Map<String, String> tableString) throws JSONException {

		JSONParser parser = new JSONParser();
		// Object obj = parser.parse(new FileReader("simple.json"));
		JSONObject jsonObject = (JSONObject) json1;
		String keys = "", value = "";

		for (Iterator iterator = jsonObject.keySet().iterator(); iterator.hasNext();) {
			String key = (String) iterator.next();
			// System.out.println("json key == "+jsonObject.get(key));
			// System.out.println(key);
			if (key.equals("key"))
				keys = jsonObject.get(key).toString();
			else if (key.equals("value"))
				value = jsonObject.get(key).toString();

		}
		tableString.put(keys, value);

		// System.out.println("map key == "+tableString);
		return tableString;

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
					System.out.println("select data=========>==>=>" + hql);
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
			System.out.println("select data=========>==>=>Out" + queryOutput);
		} catch (Exception e) {

		}
		session.close();
		return queryOutput;
	}

	public String searchIxsdDataException() throws Throwable {
		String queryOutput = "[{\"result\":\"No data\"}]";
		ArrayList<ArrayList> result = new ArrayList<ArrayList>();
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();

		try {
			FileOperations fileObject = new FileOperations();
			ArrayList<String> fileNames = fileObject.listFilesToSelectException();
			int index = 0;
			ArrayList<Map<String, String>> arrayString = new ArrayList<Map<String, String>>();
			while (index < fileNames.size()) {
				try {
					String className = "com.hethi.rest.model." + fileNames.get(index).toString();
					Object classObj = Class.forName(className).newInstance();
					String hql = "from " + fileNames.get(index).toString().toLowerCase();
					System.out.println("select data in " + hql);
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

			result.add(arrayString);
			queryOutput = gson.toJson(result);
			System.out.println("select data out===>" + queryOutput);
		} catch (Exception e) {

		}
		session.close();
		return queryOutput;
	}

	public String searchEfsuinForDinExction(String din) {
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

	public String reorderWorkSetSequence(String query) {
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

	public String select_efs_templateg(String query) {
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

	public String load_rules_by_sfs(String query) {
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

	public String add_new_rules_for_sfs(String query) {
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

	public String delete_rules_for_sfs(String query) {
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

	public String saveSequence(String query) {
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

	public String updateWorkset(String query) {
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

	public String updateRuleset(String query) {
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

	public String load_cbaas_workflow_rule(String query) {
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

	public String enableRulesStatus(String query) {
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

}
