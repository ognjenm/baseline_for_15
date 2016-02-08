package com.hethi.rest.services;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.hethi.rest.repo.FCustomerCloudPlayRepo;

public class FCustomerCloudPlayServices {
	FCustomerCloudPlayRepo cloudPlayRepo = new FCustomerCloudPlayRepo();

	public String dcustomer_volumeaspects(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call insert_into_dcustomer_volumeaspects('" + json.get("customer_id") + "'," + "'"
				+ json.get("daily_volume") + "','" + json.get("high_volume_day_sunday") + "'," + "'"
				+ json.get("high_volume_day_monday") + "','" + json.get("high_volume_day_tuesday") + "'," + "'"
				+ json.get("high_volume_day_wednesday") + "'," + "'" + json.get("high_volume_day_thursday") + "','"
				+ json.get("high_volume_day_friday") + "'," + "'" + json.get("high_volume_day_saturday") + "','"
				+ json.get("lastupuser") + "'," + "'" + json.get("monthly_volume") + "','" + json.get("weekly_volume")
				+ "'," + "'" + json.get("tfs_uin") + "')}";
		System.out.println(query);
		return cloudPlayRepo.dcustomer_volumeaspects(query);
	}

	public String duplaod_locale(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call insert_into_dcustomer_locale('" + json.get("customer_id") + "'," + "'"
				+ json.get("zone_id") + "','" + json.get("expected_doc_lang") + "'," + "'"
				+ json.get("primary_doc_lang") + "','" + json.get("user_id") + "')}";
		System.out.println(query);
		return cloudPlayRepo.duplaod_locale(query);
	}

	public String dcustomerbundlecontent(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call insert_into_dcustomerbundlecontent('" + json.get("customer_id") + "'," + "'"
				+ json.get("content_id") + "','" + json.get("tfs_uin") + "'," + "'" + json.get("user_id") + "')}";
		System.out.println(query);
		return cloudPlayRepo.dcustomerbundlecontent(query);
	}

	public String dcustomer_calendar(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call insert_into_dcustomer_calendar('" + json.get("customer_id") + "'," + "'"
				+ json.get("user_id") + "','" + json.get("weekday_end") + "'," + "'" + json.get("weekday_start")
				+ "')}";
		System.out.println(query);
		return cloudPlayRepo.dcustomer_calendar(query);
	}

	public String dcustomer_deliveryaspects(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call insert_into_dcustomer_deliveryaspects('" + json.get("customer_id") + "'," + "'"
				+ json.get("customer_shipment_cutoff") + "','" + json.get("lastupuser") + "'," + "'"
				+ json.get("max_shipment_file_record_nos") + "','" + json.get("max_shipment_file_size") + "'," + "'"
				+ json.get("max_shipment_image_record_nos") + "','" + json.get("max_shipment_image_size") + "'," + "'"
				+ json.get("min_shipment_record_size_nos") + "','" + json.get("shipment_end_time") + "'," + "'"
				+ json.get("shipment_freq") + "','" + json.get("shipment_start_time") + "','" + json.get("tfs_uin")
				+ "')}";
		System.out.println(query);
		return cloudPlayRepo.dcustomer_deliveryaspects(query);
	}

	public String dcustomer_imageaspect(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call insert_into_dcustomer_imageaspect('" + json.get("customer_id") + "'," + "'"
				+ json.get("avg_character_fields") + "','" + json.get("avg_character_form") + "'," + "'"
				+ json.get("avg_pageds_form_bundle") + "','" + json.get("avg_pages_form") + "'," + "'"
				+ json.get("image_size") + "','" + json.get("layout") + "','" + json.get("min_acceptable_dpi") + "',"
				+ "'" + json.get("standard_dpi") + "','" + json.get("total_form_fields") + "')}";
		System.out.println(query);
		return cloudPlayRepo.dcustomer_imageaspect(query);
	}

	public String dcustomer_complianceaspect(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call insert_into_dcustomer_complianceaspect('" + json.get("customer_din_format") + "'," + "'"
				+ json.get("customer_id") + "','" + json.get("data_archival_period") + "'," + "'"
				+ json.get("data_retention_period") + "','" + json.get("data_shipment_file_name") + "'," + "'"
				+ json.get("hethi_din_format") + "','" + json.get("image_archival_period") + "','"
				+ json.get("image_retention_period") + "'," + "'" + json.get("industry_compliance") + "','"
				+ json.get("information_security") + "'," + "'" + json.get("lastupuser") + "','" + json.get("tfs_uin")
				+ "')}";
		System.out.println(query);
		return cloudPlayRepo.dcustomer_complianceaspect(query);
	}

	public String load_clanguage() throws ParseException {
		String query = "SELECT `clanguage`.`language_id`,`clanguage`.`language_name` FROM `hethi`.`clanguage`";
		System.out.println(query);
		return cloudPlayRepo.load_clanguage(query);
	}

	public String load_czone() throws ParseException {
		String query = "SELECT `clanguage`.`language_id`,`clanguage`.`language_name` FROM `hethi`.`clanguage`";
		System.out.println(query);
		return cloudPlayRepo.load_czone(query);
	}
}
