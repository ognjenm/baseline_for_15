package com.hethi.rest.services;

import java.sql.SQLException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.hethi.rest.repo.FremiumShowInvoiceFormRepo;

public class FremiumShowInvoiceFormServices {
	FremiumShowInvoiceFormRepo formRepo = new FremiumShowInvoiceFormRepo();

	public String load_current_forms(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_current_forms('" + json.get("customer_id") + "'," + "'" + json.get("Bpaas_id") + "','"
				+ json.get("efs_uin") + "') }";
		System.out.println(sql);
		return formRepo.load_current_forms(sql);
	}

	public String load_all_forms(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_all_forms('" + json.get("customer_id") + "'," + "'" + json.get("Bpaas_id") + "','"
				+ json.get("efs_uin") + "') }";
		System.out.println(sql);
		return formRepo.load_all_forms(sql);
	}
}
