package com.hethi.rest.controllers;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hethi.rest.services.AdminSelectBPSServices;

@Controller
public class AdminSelectBPSController {
	AdminSelectBPSServices bpsController = new AdminSelectBPSServices();
	
	@RequestMapping(value = "/load_offer_serviceplay", method = RequestMethod.POST)
	@ResponseBody
	public String loadOfferService(@RequestBody String JSONData) throws ParseException {
		//System.out.println("offer********"+JSONData);
		return bpsController.loadOfferService(JSONData);
	}
	
	@RequestMapping(value = "/hethi_offer_serviceplays", method = RequestMethod.POST)
	@ResponseBody
	public String hethiOfferService(@RequestBody String JSONData) throws ParseException {
		//System.out.println("offer********"+JSONData);
		return bpsController.hethiOfferService(JSONData);
	}

	@RequestMapping(value = "/load_artist_list", method = RequestMethod.POST)
	@ResponseBody
	public String loadArtistList() {
		return bpsController.loadArtistList();
	}

	@RequestMapping(value = "/save_customer_serviceplay", method = RequestMethod.POST)
	@ResponseBody
	public String saveCustomerServiceplay(@RequestBody String JSONData) throws ParseException {
		return bpsController.saveCustomerServiceplay(JSONData);
	}

	@RequestMapping(value = "/assign_to_artist", method = RequestMethod.POST)
	@ResponseBody
	public String assignToArtist(@RequestBody String JSONData) throws ParseException {
		return bpsController.assignToArtist(JSONData);
	}
	
	@RequestMapping(value = "/offer_assingnTo_artist", method = RequestMethod.POST)
	@ResponseBody
	public String offer_assingnTo_artist(@RequestBody String JSONData) throws ParseException {
		return bpsController.offer_assingnTo_artist(JSONData);
	}

}
