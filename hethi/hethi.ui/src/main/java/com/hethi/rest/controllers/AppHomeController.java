package com.hethi.rest.controllers;

import java.io.IOException;

import org.json.JSONException;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.ddtek.xmlconverter.org.json.JSONException;
import com.hethi.rest.services.AppHomeServices;

@Controller
public class AppHomeController {
	AppHomeServices homeServices = new AppHomeServices();

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String register(@RequestBody String jsonData)throws ParseException, JSONException, IOException {
		return homeServices.register(jsonData);
	}
	
	@RequestMapping(value = "/profile_updation", method = RequestMethod.POST)
	@ResponseBody
	public String profile_updation(@RequestBody String jsonData) throws ParseException {
		return homeServices.updateProfile(jsonData);
	}
	
	@RequestMapping(value = "/updateRoleByAdmin", method = RequestMethod.POST)
	@ResponseBody
	public String updateRoleByAdmin(@RequestBody String jsonData) throws ParseException {
		return homeServices.updateRoleByAdmin(jsonData);
	}



	@RequestMapping(value = "/complete_registration", method = RequestMethod.POST)
	@ResponseBody
	public String complete_registration(@RequestBody String jsonData) throws ParseException {
		return homeServices.complete_registration(jsonData);
	}

	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	@ResponseBody
	public String signIn(@RequestBody String JSONData) throws ParseException {
		System.out.println(JSONData);
		return homeServices.signIn(JSONData);
	}
    @RequestMapping(value = "/loadRuleRepo", method = RequestMethod.POST)
	@ResponseBody
	public String loadRuleRepo(@RequestBody String JSONData) throws ParseException {
		System.out.println(JSONData);
		String dat="vv";
		if("vv" .equals("vv")) System.out.println("vxxcxcxcxcx");
		return homeServices.loadRuleRepo(JSONData);
	}

}
