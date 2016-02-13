package com.hethi.rest.repo;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.hethi.rest.utility.FileOperations;
import com.hethi.rest.utility.HibernateMappingFile;
import com.hethi.rest.utility.PojoGenerator;
import com.hethi.rest.utility.QueryExecutors;

import javassist.CannotCompileException;
import javassist.NotFoundException;

public class StencilRepo {
	public ArrayList<ArrayList> generate_stencil(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		QueryExecutors queryObj = new QueryExecutors();
		try {
			// ArrayList<ArrayList> resultList=queryObj.callProcedure(sql);
			// System.out.println(gson.toJson(resultList));
			return queryObj.callProcedure(sql);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryObj.callProcedure(sql);
	}
	public ArrayList<ArrayList> preview_by_form(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		QueryExecutors queryObj = new QueryExecutors();
		try {
			// ArrayList<ArrayList> resultList=queryObj.callProcedure(sql);
			// System.out.println(gson.toJson(resultList));
			return queryObj.callProcedure(sql);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryObj.callProcedure(sql);
	}

	public String saveMxmlData(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		QueryExecutors queryObj = new QueryExecutors();
		try {
			ArrayList<ArrayList> resultList = queryObj.executeInsertOrUpdate(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String previewEfs(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		QueryExecutors queryObj = new QueryExecutors();
		try {
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String listAllDocuments(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		QueryExecutors queryObj = new QueryExecutors();
		try {
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String savePOStencilData(JSONObject json)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		String queryOutput = "[{\"result\":\"No data\"}]";
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();

		try {
			FileOperations fileObject = new FileOperations();
			ArrayList<String> fileNames = fileObject.listFilesToInsert(json.get("efs_uin").toString());
			int index = 0;
			while (index < fileNames.size()) {
				System.out.println(fileNames.get(index).toString() + " is the table name");
				String className = "com.hethi.rest.model." + fileNames.get(index).toString();
				Object classObj = Class.forName(className).newInstance();
				Object classNewObj = null;
				

				for (final Method method : classObj.getClass().getDeclaredMethods()) {
					String propertyName = method.getName().substring(3, method.getName().length());
					String jsonKey = propertyName.toLowerCase();
					if (method.getName().startsWith("set")) {
						String input = null;
						try {
							input = json.get(jsonKey).toString();
							method.invoke(classObj, input);
							classNewObj = classObj;
						} catch (Exception e) {
							FileOperations operands = new FileOperations();
							classNewObj = operands.invokeMethod(propertyName, classObj, method, input);

						}
					}
				}
				session.save(classNewObj);
				trans.commit();
				index++;
			}
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return queryOutput;
	}

	public String createFormLookUpTable(JSONArray jsonArray) throws NotFoundException, CannotCompileException,
			InstantiationException, IllegalAccessException, IOException {
		Map<Class<?>, String> props = new HashMap<Class<?>, String>();
		int index = 0;
		Class<?> className = null;
		while (index < jsonArray.size()) {
			JSONObject json = (JSONObject) jsonArray.get(index);
			if (json.get("type").toString().equals("Integer"))
				className = Integer.class;
			else if (json.get("type").toString().equals("String"))
				;
			className = String.class;
			props.put(className, json.get("column").toString());
			index++;
		}
		JSONObject json = (JSONObject) jsonArray.get(0);
		PojoGenerator.createClass("com.hethi.rest.model." + json.get("table").toString(), props);
		HibernateMappingFile.createXML("src/main/resources/hibernate/" + json.get("table").toString(),
				json.get("table").toString(), jsonArray);

		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		config.addResource(
				"./hibernate/" + json.get("table").toString() + "/" + json.get("table").toString() + ".hbm.xml");
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		return "Created";
	}

	public String saveMxsd(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"No data\"}]";
		QueryExecutors queryObj = new QueryExecutors();
		try {
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
