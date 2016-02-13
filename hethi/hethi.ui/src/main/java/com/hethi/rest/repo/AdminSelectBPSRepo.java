package com.hethi.rest.repo;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.hethi.rest.utility.QueryExecutors;

public class AdminSelectBPSRepo {
	
	public String loadOfferService(String sql) {
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
		System.out.println("@@@@@@@@@@@@"+gson.toJson(queryOutput));
		return queryOutput;
	

	}
	
	
	public String hethiOfferService(String sql) {
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
		System.out.println(gson.toJson(queryOutput));
		return queryOutput;
	

	}
	
	
	public String loadArtistList(String sql) {
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
		System.out.println(gson.toJson(queryOutput));
		return queryOutput;
	}

	public String saveCustomerServiceplay(String sql) {
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
		System.out.println(gson.toJson(queryOutput));
		return queryOutput;

	}

	public String assignToArtist(String sql) {
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
		System.out.println(gson.toJson(queryOutput));
		return queryOutput;

	}
	
	public String offer_assingnTo_artist(String sql) {
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
		System.out.println(gson.toJson(queryOutput));
		return queryOutput;

	}

}
