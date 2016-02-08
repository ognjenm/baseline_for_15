package com.hethi.rest.controllers;

import java.sql.SQLException;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hethi.rest.services.FremiumShowInvoiceFormServices;

@Controller
public class FremiumShowInvoiceFormController {
	FremiumShowInvoiceFormServices invoiceForm = new FremiumShowInvoiceFormServices();

	@RequestMapping(value = "/load_current_forms", method = RequestMethod.POST)
	public @ResponseBody String load_current_forms(@RequestBody String JSONData) throws ParseException,
			InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		return invoiceForm.load_current_forms(JSONData);
	}

	@RequestMapping(value = "/load_all_forms", method = RequestMethod.POST)
	public @ResponseBody String load_all_forms(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		return invoiceForm.load_all_forms(JSONData);
	}

}
