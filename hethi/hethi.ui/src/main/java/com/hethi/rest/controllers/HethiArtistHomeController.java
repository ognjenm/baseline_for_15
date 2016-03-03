package com.hethi.rest.controllers;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hethi.rest.services.HethiArtistHomeServices;

@Controller
public class HethiArtistHomeController {
	HethiArtistHomeServices homeServices = new HethiArtistHomeServices();

	@RequestMapping(value = "/load_jobs", method = RequestMethod.POST)
	public @ResponseBody String load_jobs(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		return homeServices.load_jobs(JSONData);
	}

	@RequestMapping(value = "/load_uploaded_files", method = RequestMethod.POST)
	public @ResponseBody String load_uploaded_files(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		return homeServices.load_uploaded_files(JSONData);
	}

	@RequestMapping(value = "/save_formdata", method = RequestMethod.POST)
	public @ResponseBody String Saveformdata(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException, IOException {
		return homeServices.Saveformdata(JSONData);
	}

	@RequestMapping(value = "/load_cserviceplay", method = RequestMethod.POST)
	@ResponseBody
	public String load_cserviceplays(@RequestBody String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.load_cserviceplays(JSONData);
	}

	@RequestMapping(value = "/load_customer_uploaded_forms", method = RequestMethod.POST)
	@ResponseBody
	public String load_customer_uploaded_forms(@RequestBody String jString) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		return homeServices.load_customer_uploaded_forms(jString);
	}

	@RequestMapping(value = "/preview", method = RequestMethod.POST)
	public @ResponseBody String previewDocument(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		return homeServices.previewDocument(JSONData);
	}

	@RequestMapping(value = "/load_users", method = RequestMethod.POST)
	@ResponseBody
	public String load_users() throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		return homeServices.load_users();
	}
	
	@RequestMapping(value = "/autoStenciling", method = RequestMethod.POST)
	@ResponseBody
	public String autoStenciling(@RequestBody String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, FileNotFoundException, IOException {
		return homeServices.autoStenciling(JSONData);
	}
	
	@RequestMapping(value = "/extractDataFromPosition", method = RequestMethod.POST)
	@ResponseBody
	public String extractDataFromPosition(@RequestBody String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, FileNotFoundException, IOException {
		return homeServices.extractDataFromPosition(JSONData);
	}
}
