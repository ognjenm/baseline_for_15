package com.hethi.rest.services;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.hethi.rest.repo.AdminSelectBPSRepo;

public class AdminSelectBPSServices {
	AdminSelectBPSRepo bpsRepo = new AdminSelectBPSRepo();
	
	public String loadOfferService(String JSONData) throws ParseException {
		//JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_offer_serviceplay()}";
		System.out.println(sql);
		return bpsRepo.loadOfferService(sql);
	}
	
	public String hethiOfferService(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call save_offer_serviceplay('" + json.get("name") + "'," + "'" + json.get("offerxml")
				+ "','" + json.get("user_id") +"') }";
		System.out.println(sql);
		return bpsRepo.hethiOfferService(sql);
	}

	public String loadArtistList() {
		String sql = "Select  hethi.duser.user_id,  hethi.duser.customer_id,  hethi.drole.*,  hethi.duser.user_firstname,  hethi.duser.user_lastname,  hethi.duser.user_name From  hethi.duser Inner Join  hethi.drole On hethi.duser.role_id = hethi.drole.role_id And    hethi.drole.customer_id = hethi.duser.customer_id Where  hethi.duser.role_id = 2";
		System.out.println(sql);
		return bpsRepo.loadArtistList(sql);
	}

	public String saveCustomerServiceplay(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call save_customer_serviceplay('" + json.get("customer_id") + "'," + "'" + json.get("sfs_data")
				+ "','" + json.get("user_id") + "','" + json.get("efs_uin") + "') }";
		System.out.println(sql);
		return bpsRepo.saveCustomerServiceplay(sql);
	}

	public String assignToArtist(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call assign_to_artist('" + json.get("customer_id") + "','" + json.get("artist_id") + "'," + "'"
				+ json.get("user_id") + "','" + json.get("upload_id") + "') }";
		System.out.println(sql);
		return bpsRepo.assignToArtist(sql);
	}
	
	public String offer_assingnTo_artist(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call offer_assingnto_artist('" + json.get("customer_id") + "'," + "'" + json.get("artist_id")
				+ "','" + json.get("efs_data") + "','" + json.get("sfs_data") + "') }";
		System.out.println(sql);
		return bpsRepo.offer_assingnTo_artist(sql);
	}

}
