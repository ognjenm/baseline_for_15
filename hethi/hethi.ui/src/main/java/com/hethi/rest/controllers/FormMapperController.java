package com.hethi.rest.controllers;

import java.sql.SQLException;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hethi.rest.services.FormMapperServices;

@Controller
public class FormMapperController {
	FormMapperServices mapperServices = new FormMapperServices();

	@RequestMapping(value = "/upload_doc", method = RequestMethod.POST)
	public @ResponseBody String uploadDocument(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		return mapperServices.uploadDocument(JSONData);
	}

}
