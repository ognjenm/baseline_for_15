package com.hethi.rest.services;

import java.sql.SQLException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.hethi.rest.repo.FormMapperRepo;

public class FormMapperServices {
	FormMapperRepo mapperRepo = new FormMapperRepo();

	public String uploadDocument(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call store_uploaded_document('" + json.get("documentpath") + "'," + "'" + json.get("userid")
				+ "','" + json.get("file_name") + "'," + "'" + json.get("file_size") + "','" + json.get("file_type")
				+ "','" + json.get("Bpaas_id") + "'" + ",'" + json.get("indus_id") + "','" + json.get("form_stencid")
				+ "','" + json.get("customer_id") + "') }";
		System.out.println(sql);
		return mapperRepo.uploadDocument(sql);
	}
}
