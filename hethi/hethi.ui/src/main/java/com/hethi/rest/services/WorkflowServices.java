package com.hethi.rest.services;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.springframework.web.multipart.MultipartFile;


//import com.ddtek.xmlconverter.*;
import com.google.gson.Gson;
import com.hethi.rest.repo.WorkflowRepo;
import com.hethi.rest.utility.FileOperations;



public class WorkflowServices {
	WorkflowRepo workflowRepo=new WorkflowRepo();
	public String loadFormRules(String jsonData) throws ParseException {
		JSONObject json = (JSONObject)new JSONParser().parse(jsonData);
		String sql = "{ call load_form_rule_process('"+json.get("customer_id")+"','"+json.get("efs_uin")+"') }";
		System.out.println(sql);
		return workflowRepo.loadFormRules(sql);
	}
	public String saveCustomRules(String jsonData) throws ParseException {
		JSONObject json = (JSONObject)new JSONParser().parse(jsonData);
		String sql = "{ call save_custom_rules('"+json.get("customer_id")+"','"+json.get("user_id")+"',"
				+ "'"+json.get("tfs_uin")+"','"+json.get("efs_uin")+"','"+json.get("rule_data")+"','"+json.get("flow_data")+"','"+json.get("process_flow")+"') }";
		System.out.println(sql);
		return workflowRepo.loadFormRules(sql);
	}
	public String createLookUpStorage(String jsonData) throws ParseException {
		JSONObject json = (JSONObject)new JSONParser().parse(jsonData);
		JSONArray jsonArray=(JSONArray)json.get("attributes");
		int index = 0,constraints_column_no = 0;
		String columns = "",constraints = "PRIMARY KEY(";
		while(index < jsonArray.size()){
			JSONObject row = (JSONObject)jsonArray.get(index);
			if(row.get("pk").toString().equals("yes")){
				columns = columns+row.get("columnName").toString()+" "+row.get("columnType").toString()+" NOT NULL,";
				constraints_column_no++;
				if(constraints_column_no == 1)
				    constraints = constraints+row.get("columnName").toString();
				else
					constraints = constraints+","+row.get("columnName").toString();
			}
			else
				columns = columns+row.get("columnName").toString()+" "+row.get("columnType").toString()+" NULL,";
			index++;
		}
		constraints = constraints+")";
		String sql = "create table "+json.get("customer_id").toString()
				+"_"+json.get("lookup_type").toString()+"_lookup("+columns+constraints+")";
		System.out.println(sql);
		return workflowRepo.createLookUpStorage(sql);
	}
	public String searchLookUpStorage(String jsonData) throws ParseException{
		JSONObject json=(JSONObject)new JSONParser().parse(jsonData);
		String sql="select * from "+json.get("customer_id").toString()+"_"+json.get("lookup_type").toString()+"_lookup";
		System.out.println(sql);
		return workflowRepo.searchLookUpStorage(sql);
	};
	
	public String searchReferenceData(String jsonData) throws ParseException{
		JSONObject json=(JSONObject)new JSONParser().parse(jsonData);
		JSONArray criteria=(JSONArray)json.get("criteria");
		int index=0;
		String sql="";
		System.out.println(criteria);
		if(criteria.size()>0){
			int i=0;
			String condition=" where ";
//			System.out.println(criteria.size());
			while(i<criteria.size()){
				JSONObject jsonObj=(JSONObject)new JSONParser().parse(criteria.get(i).toString());
				if(!jsonObj.get("criteria").toString().equals("")){
					if(index==0)
			        	condition=condition+jsonObj.get("column").toString()+"=\'"+jsonObj.get("criteria").toString()+"\'";
					else
			        	condition=condition+" and "+jsonObj.get("column").toString()+"=\'"+jsonObj.get("criteria").toString()+"\'";
					index++;
				}
				i++;
//				System.out.println(i);
			}
			sql="select * from "+json.get("table_name").toString()+condition;
		}
		else
			sql="select * from "+json.get("table_name").toString();
		System.out.println(sql);
		return workflowRepo.searchReferenceData(sql);
	};
	public String searchIxsdContent(String jsonData) throws Throwable{
		JSONObject json=(JSONObject)new JSONParser().parse(jsonData);
		return workflowRepo.searchIxsdContent(json);
	};
	public String searchIxsdData() throws Throwable{
		return workflowRepo.searchIxsdData();
	};
	public String searchEfsuinForDin(String JSONData) throws ParseException{
		JSONObject json=(JSONObject)new JSONParser().parse(JSONData);
		String din=json.get("din").toString();
		return workflowRepo.searchEfsuinForDin(din);
	};
	public String saveTfsUin(String JSONData) throws ParseException{
		JSONObject json=(JSONObject)new JSONParser().parse(JSONData);
		String sql="insert into dcustomer_bundle value('"+json.get("customer_id")+"','"+json.get("tfs_uin")+"')";
		return workflowRepo.saveTfsUin(sql);
	};
	
	public String select_ixsd_efs(String JSONData) throws ParseException{
		JSONObject json=(JSONObject)new JSONParser().parse(JSONData);
		String sql="select * from "+json.get("table_name").toString();
		return workflowRepo.select_ixsd_efs(sql);
	};
	
	public String change_mxsd_tree(String JSONData) throws ParseException{
		JSONObject json=(JSONObject)new JSONParser().parse(JSONData);
		String sql="{ call change_mxsd_tree('"+json.get("efs_uin").toString()+"','"+json.get("tfs_uin")+"')}";
		return workflowRepo.change_mxsd_tree(sql);
	};
	
	public String select_efs_template(String JSONData) throws ParseException{
		JSONObject json=(JSONObject)new JSONParser().parse(JSONData);
		String sql="{ call select_efs_template('"+json.get("upload_id")+"','"+json.get("file_id")+"','"+json.get("customer_id")+"','"+json.get("efs_uin")+"')}";
		System.out.println(sql);
		return workflowRepo.select_efs_template(sql);
	};
	
	public String reorderRulesSequence(String JSONData) throws ParseException{
		JSONObject json=(JSONObject)new JSONParser().parse(JSONData);
		String sql="{ call reorderRulesSequence('"+json.get("packageId")+"','"+json.get("workSet")+"','"+json.get("ruleSet")+"',"
				+ "'"+json.get("ruleSequence")+"')}";
		return workflowRepo.select_efs_template(sql);
	};
	


	




	public String uploadFromWorkflow(MultipartFile file) throws ParseException, IOException{

//		String sql = "";
		  File currentDirFile = new File(".");
		  String helper = currentDirFile.getAbsolutePath();
		  String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		  String uploadedFileLocation = currentDir + "src/web/client/images/uploads/input/" + file.getOriginalFilename();
		  
		  String convertFileLocation = file.getOriginalFilename();
		  String outputFileLocation = convertFileLocation.substring(0, convertFileLocation.lastIndexOf(".")) + ".xml";
		  String responseFileLocation = currentDir + "src/web/client/images/uploads/input/" +outputFileLocation;
		  FileOperations operations = new FileOperations();
		  operations.writeToFile(file.getInputStream(), uploadedFileLocation); 
		  
		  
		  
		  
		  

		  /*ConverterFactory factory = new ConverterFactory();
		  ConvertToXML toXML = factory.newConvertToXML("EDI");
		  toXML.convert(new StreamSource(uploadedFileLocation), new StreamResult(responseFileLocation));*/
		  
		  

		  String fPath="http://localhost:2687/images/uploads/input/";
		  Map<String, String> mapObj = new HashMap<String, String>();
		  mapObj.put("file_location", fPath +file.getOriginalFilename());
		  mapObj.put("xml_file_location",fPath+outputFileLocation);
		  Gson gson = new Gson();
		  System.out.println(mapObj.toString());
		  return gson.toJson(mapObj);


		  
	};
	public String reorderRulesSetSequence(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call reorderRulesSetSequence('" + json.get("packageId") + "','" + json.get("workSet") + "','"
				+ json.get("ruleSet") + "'," + "'" + json.get("ruleSetSequence") + "')}";
		return workflowRepo.reorderRulesSetSequence(sql);
	};
	
	public String reorderWorkSetSequence(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call reorderWorkSetSequence('" + json.get("packageId") + "','" + json.get("workSet") + "','"
				+ json.get("ruleSet") + "'," + "'" + json.get("workSetSequence") + "')}";
		return workflowRepo.reorderWorkSetSequence(sql);
	};
	
	

	public String load_rules_by_sfs(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_rules_by_sfs('" + json.get("customer_id") + "','" + json.get("user_id") + "','"
				+ json.get("tfs_uin") + "','" +  json.get("efs_uin") + "','" +  json.get("sfs_uin") + "')}";
		return workflowRepo.load_rules_by_sfs(sql);
	};
	
	public String add_new_rules_for_sfs(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call add_new_rules_for_sfs('" + json.get("customer_id") + "','" + json.get("user_id") + "','"
				+ json.get("tfs_uin") + "','" +  json.get("efs_uin") + "','" +  json.get("sfs_uin") + "','" +  json.get("rule_workset")+ "','" +  json.get("rule_ruleset") + "')}";
	System.out.println(sql);
		return workflowRepo.add_new_rules_for_sfs(sql);
	};
	
	
	public String delete_rules_for_sfs(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call delete_rules_for_sfs('" + json.get("customer_id") + "','" + json.get("user_id") + "','"
				+ json.get("tfs_uin") + "','" +  json.get("efs_uin") + "','" +  json.get("sfs_uin") + "','" +  json.get("rule_workset") + "')}";

		return workflowRepo.delete_rules_for_sfs(sql);
	};
	
	public String updateRuleset(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String start=json.get("ruleset_effective_startdate").toString();
		String end=json.get("ruleset_effective_enddate").toString();
		if(start.lastIndexOf('T') > -1)
			start=start.split("T")[0];
		if(end.lastIndexOf('T') > -1)
			end=end.split("T")[0];
		String sql = "{ call updateRuleset('" + json.get("cruleset_id") + "','" + json.get("ruleset_name") + "','"
				+ json.get("ruleset_description") + "','" + start + "',"
						+ "'" + end + "')}";
		System.out.println(sql);
		return workflowRepo.updateRuleset(sql);
	};
	public String updateWorkset(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String start=json.get("workset_effective_startdate").toString();
		String end=json.get("workset_effective_startdate").toString();
		if(start.lastIndexOf('T') > -1)
			start=start.split("T")[0];
		if(end.lastIndexOf('T') > -1)
			end=end.split("T")[0];
		String sql = "{ call updateWorkset('" + json.get("workset_id") + "','" + json.get("workset_name") + "','"
				+ json.get("workset_description") + "','" + start + "',"
						+ "'" + end + "')}";
		System.out.println(sql);
		return workflowRepo.updateWorkset(sql);
	};
	
	public String saveSequence(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call saveSequence('"+json.get("packageId")+"','"+json.get("worksetId")+"','" + json.get("ruleSetSequence_xml") + "','" + json.get("workSetSequence") + "',"
				+ "'"+json.get("ruleSequence")+"')}";
		return workflowRepo.saveSequence(sql);
	};
	
	public String load_cbaas_workflow_rule(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_cbaas_workflow_rule('"+json.get("packageId")+"')}";
		return workflowRepo.load_cbaas_workflow_rule(sql);
	};
	public String enableRulesStatus(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "UPDATE `hethi`.`cstandardrules` SET `rule_status` = 1 "
				+ "WHERE `ruleset_id` = '"+json.get("ruleset_id").toString()+"' and `rule_uin` = '"+json.get("rule_uin").toString()+"'";
		System.out.println(sql);
		return workflowRepo.enableRulesStatus(sql);
	};
	
	
	
	
}
