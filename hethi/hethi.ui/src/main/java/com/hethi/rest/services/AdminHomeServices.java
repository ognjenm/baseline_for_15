package com.hethi.rest.services;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.multipart.MultipartFile;

import com.hethi.rest.repo.AdminHomeRepo;
import com.hethi.rest.utility.FileOperations;

public class AdminHomeServices {
	AdminHomeRepo homeRepo = new AdminHomeRepo();

	public String bpaas_load_customer_list() {
		String query = "{ call load_customer_list() }";
		System.out.println(query);
		return homeRepo.bpaas_load_customer_list(query);
	}

	public String loadCustomerName() {
		String query = "select * from dcustomer";
		System.out.println(query);
		return homeRepo.bpaas_load_customer_list(query);
	}

	public String getCcoreservices() {
		String sql = "select service_id,master_service from ccore_services";
		System.out.println(sql);
		return homeRepo.getCcoreservices(sql);
	}

	public String getCcoreservicePlays(String JSONData) throws ParseException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_ccore_serviceplays('" + json.get("customer_id") + "'," + "'" + json.get("efs_uin")
				+ "') }";
		System.out.println(sql);
		return homeRepo.getCcoreservicePlays(sql);
	}

	public String uploadReferenceData(MultipartFile file, String customer_id, String lookup_type)
			throws ParseException, IOException {
		FileOperations operations = new FileOperations();
		String filePath = "src/web/client/lookupDocuments/" + file.getOriginalFilename();
		operations.writeToFile(file.getInputStream(), filePath);
		ArrayList<String[]> resultArray = operations.readTextDocument(filePath);
		return homeRepo.uploadReferenceData(resultArray, customer_id, lookup_type);
	}

	public String loadCustomerUsers(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "select * from duser where customer_id=" + json.get("customer_id").toString();
		System.out.println(sql);
		return homeRepo.loadCustomerUsers(sql);
	}

	public String loadRulesPackages() throws ParseException, IOException {

		String sql = "{ call load_rules_packages()}";
		System.out.println(sql);
		return homeRepo.loadRulesPackages(sql);
	}

	public String saveRulesPackages(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		System.out.println(json.toJSONString());
		String sql = "{ call save_rules_packages('" + json.get("package_id").toString() + "','"
				+ json.get("package_name").toString() + "'," + "'" + json.get("package_desc").toString() + "','"
				+ Integer.parseInt(json.get("user_id").toString()) + "','" + json.get("worksetXml").toString() + "',"
				+ "'" + json.get("rulesetXml").toString() + "','" + json.get("ruleXml").toString() + "','"
				+ json.get("cloning_package").toString() + "','" + json.get("cloning").toString() + "')}";
		System.out.println(sql);
		return homeRepo.saveRulesPackages(sql);
	}

	public String saveRulesWorkset(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call save_rules_workset('" + json.get("workset_id").toString() + "','"
				+ json.get("workset_name").toString() + "'," + "'" + json.get("workset_desc").toString() + "','"
				+ json.get("package_id") + "','" + json.get("user_id") + "')}";
		System.out.println(sql);
		return homeRepo.saveRulesWorkset(sql);
	}

	public String saveRulesSet(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call save_ruleSet('" + json.get("ruleSet_id").toString() + "','"
				+ json.get("ruleSet_name").toString() + "'," + "'" + json.get("ruleSet_desc").toString() + "','"
				+ json.get("package_id") + "','" + json.get("workset_id") + "','" + json.get("user_id") + "')}";
		System.out.println(sql);
		return homeRepo.saveRulesSet(sql);
	}

	public String deleteRulesSet(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call delete_ruleSet('" + json.get("package_id") + "','" + json.get("workSet_id") + "','"
				+ json.get("ruleSet_id") + "')}";
		System.out.println(sql);
		return homeRepo.deleteRulesSet(sql);
	}

	public String deleteRulesWorkSet(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call delete_ruleWorkSet('" + json.get("package_id") + "','" + json.get("workSet_id") + "')}";
		System.out.println(sql);
		return homeRepo.deleteRulesWorkSet(sql);
	}
	
	public String loadEfsUin(String JSONData) throws ParseException, IOException{
    	JSONObject json=(JSONObject)new JSONParser().parse(JSONData);
		String sql="select * from ixsd_"+json.get("efs_uin").toString();
		System.out.println(sql);
		return homeRepo.loadEfsUin(sql);
	}


	public String deleteRulesPackage(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call delete_rulesPackage('" + json.get("package_id") + "')}";
		System.out.println(sql);
		return homeRepo.deleteRulesPackage(sql);
	}

	public String load_uploads_by_status(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_uploads_by_status('" + json.get("status") + "')}";
		System.out.println(sql);
		return homeRepo.load_uploads_by_status(sql);
	}
	
	public String load_uploaded_files_by_upload_id(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_uploaded_files_by_upload_id('" + json.get("upload_id") + "')}";
		System.out.println(sql);
		return homeRepo.load_uploaded_files_by_upload_id(sql);
	}
	
	public String load_all_forms_with_owner_and_template(String JSONData){	
		String sql = "{ call load_all_forms_with_owner_and_template()}";
		System.out.println(sql);
		return homeRepo.load_all_forms_with_owner_and_template(sql);
	}
	public String assign_form_to_file(String JSONData) throws ParseException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);		
		String sql = "{ call assign_form_to_file('" + json.get("efs_uin") + "','" + json.get("upload_id") +  "','" + json.get("file_id") + "')}";
		System.out.println(sql);
		return homeRepo.assign_form_to_file(sql);
	}
	public String load_all_master_data(String JSONData) {

		String sql = "{ call load_all_master_data()}";
		System.out.println(sql);
		return homeRepo.load_all_master_data(sql);
	}
	public String load_dashboard_data(String JSONData) {

		String sql = "{ call load_dashboard_data()}";
		System.out.println(sql);
		return homeRepo.load_dashboard_data(sql);
	}
	
}
