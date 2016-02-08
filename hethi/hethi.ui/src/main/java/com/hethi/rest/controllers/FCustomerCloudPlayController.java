package com.hethi.rest.controllers;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hethi.rest.services.FCustomerCloudPlayServices;

@Controller
public class FCustomerCloudPlayController {
	FCustomerCloudPlayServices cloudPlayServices = new FCustomerCloudPlayServices();

	@RequestMapping(value = "/save_dcustomer_volumeaspect", method = RequestMethod.POST)
	public @ResponseBody String dcustomer_volumeaspects(@RequestBody String JSONData) throws ParseException {
		return cloudPlayServices.dcustomer_volumeaspects(JSONData);
	}

	@RequestMapping(value = "/save_dcustomer_locale", method = RequestMethod.POST)
	public @ResponseBody String duplaod_locale(@RequestBody String JSONData) throws ParseException {
		return cloudPlayServices.duplaod_locale(JSONData);
	}

	@RequestMapping(value = "/save_dcustomerbundlecontent", method = RequestMethod.POST)
	public @ResponseBody String dcustomerbundlecontent(@RequestBody String JSONData) throws ParseException {
		return cloudPlayServices.dcustomerbundlecontent(JSONData);
	}

	@RequestMapping(value = "/save_dcustomer_calendar", method = RequestMethod.POST)
	public @ResponseBody String dcustomer_calendar(@RequestBody String JSONData) throws ParseException {
		return cloudPlayServices.dcustomer_calendar(JSONData);
	}

	@RequestMapping(value = "/save_dcustomer_deliveryaspect", method = RequestMethod.POST)
	public @ResponseBody String dcustomer_deliveryaspects(@RequestBody String JSONData) throws ParseException {
		return cloudPlayServices.dcustomer_deliveryaspects(JSONData);
	}

	@RequestMapping(value = "/save_dcustomer_imageaspect", method = RequestMethod.POST)
	public @ResponseBody String dcustomer_imageaspect(@RequestBody String JSONData) throws ParseException {
		return cloudPlayServices.dcustomer_imageaspect(JSONData);
	}

	@RequestMapping(value = "/save_dcustomer_complianceaspect", method = RequestMethod.POST)
	public @ResponseBody String dcustomer_complianceaspect(@RequestBody String JSONData) throws ParseException {
		return cloudPlayServices.dcustomer_complianceaspect(JSONData);
	}

	@RequestMapping(value = "/load_clanguage", method = RequestMethod.POST)
	public @ResponseBody String load_clanguage() throws ParseException {
		return cloudPlayServices.load_clanguage();
	}

	@RequestMapping(value = "/load_czone", method = RequestMethod.POST)
	public @ResponseBody String load_czone() throws ParseException {
		return cloudPlayServices.load_czone();
	}

}
