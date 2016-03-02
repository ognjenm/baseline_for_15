package com.hethi.rest.repo;

import java.util.ArrayList;

import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.hethi.rest.utility.QueryExecutors;

public class AppHomeRepo {

	public String register(String sql) throws ParseException {
		Gson gson = new Gson();
		String queryOutput = "[[{\"result\":\"Nodata\"}]]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(resultList));
			return queryOutput = gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[[{\"result\":\"Error\"}]]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
	public String complete_registration(String sql) throws ParseException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Nodata\"}]";
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
	
	public String updateProfile(String sql) throws ParseException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Nodata\"}]";
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
	
	public String updateRoleByAdmin(String sql) throws ParseException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Nodata\"}]";
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

	public String signIn(String query) throws ParseException {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Nodata\"}]";
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
		public String loadRuleRepo(String query) throws ParseException {
    		Gson gson = new Gson();
    		String queryOutput = "[{\"result\":\"Nodata\"}]";
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
}
