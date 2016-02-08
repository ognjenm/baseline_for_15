package com.hethi.rest.services;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.hethi.rest.repo.FremiumSelectBPSRepo;

public class FremiumSelectBPSServices {
	FremiumSelectBPSRepo bpsRepo = new FremiumSelectBPSRepo();

	public String load_existing_bps(String jsonData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(jsonData);
		String sql = "{ call load_existing_bps('" + json.get("customer_id") + "') }";
		System.out.println(sql);
		return bpsRepo.load_existing_bps(sql);
	}

	public String load_all_bps(String jsonData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(jsonData);
		String sql = "{ call load_all_bps('" + json.get("customer_id") + "') }";
		System.out.println(sql);
		return bpsRepo.load_all_bps(sql);
	}

	public String load_hethi_services(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_hethi_services('" + json.get("customer_id") + "') }";
		System.out.println(sql);
		return bpsRepo.load_hethi_services(sql);
	}
}
