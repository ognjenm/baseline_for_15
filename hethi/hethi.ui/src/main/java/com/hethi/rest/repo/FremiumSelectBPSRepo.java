package com.hethi.rest.repo;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.hethi.rest.utility.QueryExecutors;

public class FremiumSelectBPSRepo {
	public String load_existing_bps(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Nodata\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(queryOutput));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String load_all_bps(String sql) {
		Gson gson = new Gson();
		String queryOutput = "[{\"result\":\"Nodata\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(queryOutput));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}

	public String load_hethi_services(String sql) {
		Gson gson = new Gson();
		System.out.println(sql);
		String queryOutput = "[{\"result\":\"Nodata\"}]";
		try {
			QueryExecutors queryObj = new QueryExecutors();
			@SuppressWarnings("rawtypes")
			ArrayList<ArrayList> resultList = queryObj.callProcedure(sql);
			System.out.println(gson.toJson(queryOutput));
			return gson.toJson(resultList);
		} catch (Exception e) {
			queryOutput = "[{\"result\":\"Error\"}]";
		}
		System.out.println(queryOutput);
		return queryOutput;
	}
}
