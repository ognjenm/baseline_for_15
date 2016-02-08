package com.hethi.rest.controllers;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hethi.rest.interfaces.WorkflowInterface;
import com.hethi.rest.services.WorkflowServices;

@Controller
public class WorkflowController {
	@RequestMapping(value = "/startWorkFlow", method = RequestMethod.POST)
	@ResponseBody
	public String startWorkFlow(@RequestBody String jsonData) throws ParseException {
		AbstractApplicationContext context = new ClassPathXmlApplicationContext("/spring/hethi-workflow-services.xml");
		WorkflowInterface test = (WorkflowInterface) context.getBean("WorkflowInterfaceBean");
		String response = test.startProcess(jsonData);
		System.out.println("response: " + response);
		return response;
	}

	@RequestMapping(value = "/load_form_rules_process", method = RequestMethod.POST)
	@ResponseBody
	public String loadFormRules(@RequestBody String jsonData) throws ParseException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.loadFormRules(jsonData);
	}

	@RequestMapping(value = "/save_custom_rules", method = RequestMethod.POST)
	@ResponseBody
	public String saveCustomRules(@RequestBody String jsonData) throws ParseException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.saveCustomRules(jsonData);
	}

	@RequestMapping(value = "/create_lookup_storage", method = RequestMethod.POST)
	@ResponseBody
	public String createLookUpStorage(@RequestBody String jsonData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.createLookUpStorage(jsonData);

	}

	@RequestMapping(value = "/search_lookup_storage", method = RequestMethod.POST)
	@ResponseBody
	public String searchLookUpStorage(@RequestBody String jsonData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.searchLookUpStorage(jsonData);
	}

	@RequestMapping(value = "/search_reference_data", method = RequestMethod.POST)
	@ResponseBody
	public String searchReferenceData(@RequestBody String jsonData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.searchReferenceData(jsonData);
	}

	@RequestMapping(value = "/search_ixsd_content", method = RequestMethod.POST)
	@ResponseBody
	public String searchIxsdContent(@RequestBody String jsonData) throws Throwable {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.searchIxsdContent(jsonData);
	}

	@RequestMapping(value = "/search_ixsd_data", method = RequestMethod.POST)
	@ResponseBody
	public String searchIxsdData() throws Throwable {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.searchIxsdData();
	}

	@RequestMapping(value = "/search_efsuin_for_din", method = RequestMethod.POST)
	@ResponseBody
	public String searchEfsuinForDin(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.searchEfsuinForDin(JSONData);
	}

	@RequestMapping(value = "/save_tfs_uin", method = RequestMethod.POST)
	@ResponseBody
	public String saveTfsUin(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.saveTfsUin(JSONData);
	}

	@RequestMapping(value = "/select_ixsd_efs", method = RequestMethod.POST)
	@ResponseBody
	public String select_ixsd_efs(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.select_ixsd_efs(JSONData);
	}

	@RequestMapping(value = "/change_mxsd_tree", method = RequestMethod.POST)
	@ResponseBody
	public String change_mxsd_tree(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.change_mxsd_tree(JSONData);
	}

	@RequestMapping(value = "/select_efs_template", method = RequestMethod.POST)
	@ResponseBody
	public String select_efs_template(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.select_efs_template(JSONData);
	}

	@RequestMapping(value = "/mapper_input_upload", method = RequestMethod.POST)
	@ResponseBody
	public String uploadFromWorkflow(@RequestParam(value = "file", required = true) MultipartFile file)
			throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.uploadFromWorkflow(file);
	}


	@RequestMapping(value = "/reorderRulesSequence", method = RequestMethod.POST)
	@ResponseBody
	public String reorderRulesSequence(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices = new WorkflowServices();
		return workflowservices.reorderRulesSequence(JSONData);
	}
	
	@RequestMapping( value="/reorderRulesSetSequence" , method = RequestMethod.POST)
	@ResponseBody
	public String reorderRulesSetSequence(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.reorderRulesSetSequence(JSONData);
	}
	
	@RequestMapping( value="/reorderWorkSetSequence" , method = RequestMethod.POST)
	@ResponseBody
	public String reorderWorkSetSequence(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.reorderWorkSetSequence(JSONData);
	}
	
	@RequestMapping( value="/load_rules_by_sfs" , method = RequestMethod.POST)
	@ResponseBody
	public String load_rules_by_sfs(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.load_rules_by_sfs(JSONData);
	}
	
	@RequestMapping( value="/add_new_rules_for_sfs" , method = RequestMethod.POST)
	@ResponseBody
	public String add_new_rules_for_sfs(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.add_new_rules_for_sfs(JSONData);
	}
	
	@RequestMapping( value="/delete_rules_for_sfs" , method = RequestMethod.POST)
	@ResponseBody
	public String delete_rules_for_sfs(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.delete_rules_for_sfs(JSONData);
	}
	
	@RequestMapping( value="/saveSequence" , method = RequestMethod.POST)
	@ResponseBody
	public String saveSequence(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.saveSequence(JSONData);
	}
	
	@RequestMapping( value="/updateWorkset" , method = RequestMethod.POST)
	@ResponseBody
	public String updateWorkset(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.updateWorkset(JSONData);
	}
	
	@RequestMapping( value="/updateRuleset" , method = RequestMethod.POST)
	@ResponseBody
	public String updateRuleset(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.updateRuleset(JSONData);
	}
	@RequestMapping( value="/load_cbaas_workflow_rules" , method = RequestMethod.POST)
	@ResponseBody
	public String load_cbaas_workflow_rule(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.load_cbaas_workflow_rule(JSONData);
	}
	
	@RequestMapping( value="/enableRulesStatus" , method = RequestMethod.POST)
	@ResponseBody
	public String enableRulesStatus(@RequestBody String JSONData) throws ParseException, IOException {
		WorkflowServices workflowservices=new WorkflowServices();
		return workflowservices.enableRulesStatus(JSONData);
	}

}
