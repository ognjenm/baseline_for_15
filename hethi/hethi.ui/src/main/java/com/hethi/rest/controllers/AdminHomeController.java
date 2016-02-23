package com.hethi.rest.controllers;

import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hethi.rest.services.AdminHomeServices;

@Controller
public class AdminHomeController {
	AdminHomeServices homeService = new AdminHomeServices();

	@RequestMapping(value = "/loadCustomerList", method = RequestMethod.POST)
	@ResponseBody
	public String bpaas_load_customer_list() {
		return homeService.bpaas_load_customer_list();
	}
	
	@RequestMapping( value="/loadEfsUin" , method = RequestMethod.POST)
	@ResponseBody
	public String loadEfsUin(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.loadEfsUin(JSONData);
	}
	
	@RequestMapping( value="/loadLookupEntities" , method = RequestMethod.POST)
	@ResponseBody
	public String loadLookupEntities(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.loadLookupEntities(JSONData);
	}

	@RequestMapping(value = "/loadCustomerName", method = RequestMethod.POST)
	@ResponseBody
	public String loadCustomerName() {
		return homeService.loadCustomerName();
	}

	@RequestMapping(value = "/load_ccore_services", method = RequestMethod.POST)
	@ResponseBody
	public String getCcoreservices() {
		return homeService.getCcoreservices();
	}

	@RequestMapping(value = "/load_ccore_serviceplays", method = RequestMethod.POST)
	@ResponseBody
	public String getCcoreservicePlays(@RequestBody String JSONData) throws ParseException {
		return homeService.getCcoreservicePlays(JSONData);
	}

	@RequestMapping(value = "/upload_reference_data", method = RequestMethod.POST)
	@ResponseBody
	public String uploadReferenceData(@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "customer_id") String customer_id,
			@RequestParam(value = "lookup_type") String lookup_type) throws ParseException, IOException {
		return homeService.uploadReferenceData(file, customer_id, lookup_type);
	}

	@RequestMapping(value = "/loadCustomerUsers", method = RequestMethod.POST)
	@ResponseBody
	public String loadCustomerUsers(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.loadCustomerUsers(JSONData);
	}

	@RequestMapping(value = "/loadRulesPackages", method = RequestMethod.POST)
	@ResponseBody
	public String loadRulesPackages() throws ParseException, IOException {
		return homeService.loadRulesPackages();
	}

	@RequestMapping(value = "/saveRulesPackages", method = RequestMethod.POST)
	@ResponseBody
	public String saveRulesPackages(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.saveRulesPackages(JSONData);
	}

	@RequestMapping(value = "/saveRulesWorkset", method = RequestMethod.POST)
	@ResponseBody
	public String saveRulesWorkset(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.saveRulesWorkset(JSONData);
	}

	@RequestMapping(value = "/saveRulesSet", method = RequestMethod.POST)
	@ResponseBody
	public String saveRulesSet(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.saveRulesSet(JSONData);
	}

	@RequestMapping(value = "/deleteRulesPackage", method = RequestMethod.POST)
	@ResponseBody
	public String deleteRulesPackage(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.deleteRulesPackage(JSONData);
	}

	@RequestMapping(value = "/deleteRulesWorkSet", method = RequestMethod.POST)
	@ResponseBody
	public String deleteRulesWorkSet(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.deleteRulesWorkSet(JSONData);
	}

	@RequestMapping(value = "/deleteRulesSet", method = RequestMethod.POST)
	@ResponseBody
	public String deleteRulesSet(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.deleteRulesSet(JSONData);
	}
	
	@RequestMapping(value = "/load_uploads_by_status", method = RequestMethod.POST)
	@ResponseBody
	public String load_uploads_by_status(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.load_uploads_by_status(JSONData);
	}
	
	@RequestMapping(value = "/load_uploaded_files_by_upload_id", method = RequestMethod.POST)
	@ResponseBody
	public String load_uploaded_files_by_upload(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.load_uploaded_files_by_upload_id(JSONData);
	}
	@RequestMapping(value = "/load_all_forms_with_owner_and_template", method = RequestMethod.POST)
	@ResponseBody
	public String load_all_forms_with_owner_and_template(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.load_all_forms_with_owner_and_template(JSONData);
	}
	@RequestMapping(value = "/assign_form_to_file", method = RequestMethod.POST)
	@ResponseBody
	public String assign_form_to_file(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.assign_form_to_file(JSONData);
	}
	@RequestMapping(value = "/load_all_master_data", method = RequestMethod.POST)
	@ResponseBody
	public String load_all_master_data(@RequestBody String JSONData) throws ParseException, IOException {
		return homeService.load_all_master_data(JSONData);
	}



}
