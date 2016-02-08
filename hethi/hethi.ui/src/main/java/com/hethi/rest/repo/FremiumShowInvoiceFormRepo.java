package com.hethi.rest.repo;

import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.hethi.rest.utility.QueryExecutors;

public class FremiumShowInvoiceFormRepo {
	public String load_current_forms(String sql)
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

	public String load_all_forms(String sql)
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
