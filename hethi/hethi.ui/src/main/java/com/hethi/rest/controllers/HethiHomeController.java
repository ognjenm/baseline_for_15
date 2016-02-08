package com.hethi.rest.controllers;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;


import org.apache.commons.vfs2.operations.FileOperation;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hethi.rest.services.HethiHomeServices;
import com.hethi.rest.utility.FileOperations;

import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

@Controller
public class HethiHomeController {
	HethiHomeServices homeServices = new HethiHomeServices();

	@RequestMapping(value = "/load_home_content", method = RequestMethod.POST)
	@ResponseBody
	public String bpaas_load_home_content() {
		return homeServices.bpaas_load_home_content();
	}

	@RequestMapping(value = "/dupload", method = RequestMethod.POST)
	public @ResponseBody String UploadFile(@RequestParam(value = "file", required = true) MultipartFile file,
			@RequestParam(value = "customer_id", required = true) int customer_id,
			@RequestParam(value = "efs_uin", required = true) String efs_uin,
			@RequestParam(value = "user_id", required = true) int user_id) throws IOException, InstantiationException,
					IllegalAccessException, ClassNotFoundException, SQLException, ParseException, NumberFormatException,
					MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {
		return homeServices.UploadFile(file, customer_id, efs_uin, user_id);
	}

	@RequestMapping(value = "/load_document", method = RequestMethod.POST)
	public @ResponseBody String listDocument(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {

		return homeServices.listDocument(JSONData);
	}

	@RequestMapping(value = "/updatedocumentque", method = RequestMethod.POST)
	@ResponseBody
	public String updatedocumentqueue(@RequestBody String jsonData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.updatedocumentqueue(jsonData);
	}

	@RequestMapping(value = "/load_userlist", method = RequestMethod.POST)
	@ResponseBody
	public String load_userlist(@RequestBody String jsonData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.load_userlist(jsonData);
	}

	@RequestMapping(value = "/load_tasklist", method = RequestMethod.POST)
	@ResponseBody
	public String load_roletasklist(@RequestBody String jsonData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.load_roletasklist(jsonData);
	}

	@RequestMapping(value = "/assign_task", method = RequestMethod.POST)
	@ResponseBody
	public String assign_task(@RequestBody String jsonData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.assign_task(jsonData);
	}

	
	@RequestMapping( value="/saveNewRule" , method = RequestMethod.POST)
	@ResponseBody
	public String saveNewRule(@RequestBody String jsonData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.saveNewRule(jsonData);
	}
	
	@RequestMapping( value="/disableRule" , method = RequestMethod.POST)
	@ResponseBody
	public String disableRule(@RequestBody String jsonData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.disableRule(jsonData);
	}
	
	@RequestMapping( value="/addPlatformUser" , method = RequestMethod.POST)
	@ResponseBody
	public String addPlatformUser(@RequestBody String jsonData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.addPlatformUser(jsonData);
	}
	
	@RequestMapping( value="/loadAvailableRoles" , method = RequestMethod.POST)
	@ResponseBody
	public String loadAvailableRoles(@RequestBody String jsonData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.loadAvailableRoles(jsonData);
	}
	
	@RequestMapping( value="/complete_user_registration" , method = RequestMethod.POST)
	@ResponseBody
	public String complete_user_registration(@RequestBody String jsonData) throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		return homeServices.complete_user_registration(jsonData);
	}
	
	
}
