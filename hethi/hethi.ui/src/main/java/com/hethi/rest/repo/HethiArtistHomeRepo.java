package com.hethi.rest.repo;

import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.hethi.rest.utility.QueryExecutors;

import ch.qos.logback.core.net.SyslogOutputStream;

public class HethiArtistHomeRepo {
	public String load_jobs(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
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

	public String load_uploaded_files(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
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

	public String Saveformdata(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
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
	
	

	public String load_cserviceplays(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
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

	public String load_customer_uploaded_forms(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
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

	public String previewDocument(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
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

	public String load_users(String sql)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
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
