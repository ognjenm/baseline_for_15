package com.hethi.rest.controllers;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hethi.rest.services.FremiumSelectBPSServices;

@Controller
public class FreemiumSelectBPSController {
	FremiumSelectBPSServices bpsService = new FremiumSelectBPSServices();

	@RequestMapping(value = "/load_existing_bps", method = RequestMethod.POST)
	@ResponseBody
	public String load_existing_bps(@RequestBody String jsonData) throws ParseException {
		return bpsService.load_existing_bps(jsonData);
	}

	@RequestMapping(value = "/load_all_bps", method = RequestMethod.POST)
	@ResponseBody
	public String load_all_bps(@RequestBody String jsonData) throws ParseException {
		return bpsService.load_all_bps(jsonData);
	}

	@RequestMapping(value = "/load_hethi_services", method = RequestMethod.POST)
	@ResponseBody
	public String load_hethi_services(@RequestBody String JSONData) throws ParseException {
		return bpsService.load_hethi_services(JSONData);
	}

}
