package com.hethi.daas;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hethi.utils.CollectionManipulation;
import com.hethi.utils.QueryExecutors;

import net.sourceforge.tess4j.TesseractException;

public class ClassifyModel {
	
	private int customer_id;
	private String efs_uin; 
	private String policyname; 
	private String policytype;
	private String policydescription;
	private Date olicycretedate; 
	private Date policyexpirydate; 
	private String data_sequence;
	private String data_content;
	private String data_position_top;
	private String data_position_left;
	private String data_position_width;
	private String data_position_height; 
	private String data_expected_content; 
	private String indexname;
	private String lastuptm;
	private String lastupduser;
	
	private String process_source;
	private List<ClassifyModel> customer_efsUIN; 
	
	

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getEfs_uin() {
		return efs_uin;
	}

	public void setEfs_uin(String efs_uin) {
		this.efs_uin = efs_uin;
	}

	public String getPolicyname() {
		return policyname;
	}

	public void setPolicyname(String policyname) {
		this.policyname = policyname;
	}

	public String getPolicytype() {
		return policytype;
	}

	public void setPolicytype(String policytype) {
		this.policytype = policytype;
	}

	public String getPolicydescription() {
		return policydescription;
	}

	public void setPolicydescription(String policydescription) {
		this.policydescription = policydescription;
	}

	public Date getOlicycretedate() {
		return olicycretedate;
	}

	public void setOlicycretedate(Date olicycretedate) {
		this.olicycretedate = olicycretedate;
	}

	public Date getPolicyexpirydate() {
		return policyexpirydate;
	}

	public void setPolicyexpirydate(Date policyexpirydate) {
		this.policyexpirydate = policyexpirydate;
	}

	public String getData_sequence() {
		return data_sequence;
	}

	public void setData_sequence(String data_sequence) {
		this.data_sequence = data_sequence;
	}

	public String getData_content() {
		return data_content;
	}

	public void setData_content(String data_content) {
		this.data_content = data_content;
	}

	public String getData_position_top() {
		return data_position_top;
	}

	public void setData_position_top(String data_position_top) {
		this.data_position_top = data_position_top;
	}

	public String getData_position_left() {
		return data_position_left;
	}

	public void setData_position_left(String data_position_left) {
		this.data_position_left = data_position_left;
	}

	public String getData_position_width() {
		return data_position_width;
	}

	public void setData_position_width(String data_position_width) {
		this.data_position_width = data_position_width;
	}

	public String getData_position_height() {
		return data_position_height;
	}

	public void setData_position_height(String data_position_height) {
		this.data_position_height = data_position_height;
	}

	public String getData_expected_content() {
		return data_expected_content;
	}

	public void setData_expected_content(String data_expected_content) {
		this.data_expected_content = data_expected_content;
	}

	public String getIndexname() {
		return indexname;
	}

	public void setIndexname(String indexname) {
		this.indexname = indexname;
	}

	public String getLastuptm() {
		return lastuptm;
	}

	public void setLastuptm(String lastuptm) {
		this.lastuptm = lastuptm;
	}

	public String getLastupduser() {
		return lastupduser;
	}

	public void setLastupduser(String lastupduser) {
		this.lastupduser = lastupduser;
	}

	public String getProcess_source() {
		return process_source;
	}

	public void setProcess_source(String process_source) {
		this.process_source = process_source;
	}

	public List<ClassifyModel> getCustomer_efsUIN() {
		return customer_efsUIN;
	}

	public void setCustomer_efsUIN(List<ClassifyModel> customer_efsUIN) {
		this.customer_efsUIN = customer_efsUIN;
	}

	
	public  ArrayList<ClassifyModel> getUfs_uin(String customerId){
		
		QueryExecutors qe=new QueryExecutors();
		String sql="select * from cclassification_policy where customer_id="+customerId+"";
		ArrayList<ClassifyModel> indexs=qe.getAllUfs_UInByCustomer(sql);	
		return indexs;
	}
	
	
	public Map<String,String> RunclassifyefsUIN(String customerId,ArrayList<ArrayList> inputForm) throws TesseractException{
		
		String matched_efs_uin="";
		
		ArrayList<ClassifyModel> Classifypolicies=getUfs_uin(customerId);
		
		List<String> ufs_uinTotal=new ArrayList<String>();
		List<String> ufs_uinMatched=new ArrayList<String>();
		Map<String , String> efs_uinMap=new HashMap<String,String>();
		/*
		 * Iterate through object
		 * 
		 */
		int i=0;
		for (ArrayList list : inputForm) {
			
		i++;
		for (ClassifyModel index : Classifypolicies) {
			
			ufs_uinTotal.add(index.getEfs_uin());
			int x1=Integer.parseInt(index.getData_position_left());
			int y1=Integer.parseInt(index.getData_position_top());
			int x2=Integer.parseInt(index.getData_position_width());
			int y2=Integer.parseInt(index.getData_position_height());
			String extractedData=new ReadJson().extractFromImage(list.get(i).toString(), x1, y1, x2, y2);
			extractedData=extractedData.trim();
			System.out.println("The extracted data is "+extractedData);
			String classifyData=index.getData_expected_content();
			System.out.println("Classification Data "+classifyData);
			System.out.println("The extracted data is "+extractedData);
		
			if (classifyData.equalsIgnoreCase(extractedData)) {
				ufs_uinMatched.add(index.getEfs_uin());
			}
		}
		
			CollectionManipulation manipulation=new CollectionManipulation();
			
			String ufs_uinTotal_Count=manipulation.getElementCount(ufs_uinTotal);
			String ufs_uinMatched_Count=manipulation.getElementCount(ufs_uinMatched);
			String [] ufs_uinTotal_Count_array=ufs_uinTotal_Count.split(",");
			String [] ufs_uinMatched_Count_array=ufs_uinMatched_Count.split(",");
			System.out.println("efs_uin == "+ufs_uinTotal_Count_array[0]+" matched "+ufs_uinMatched_Count_array[0]);
			if(ufs_uinTotal_Count_array[0].equalsIgnoreCase(ufs_uinMatched_Count_array[0])){
				if(ufs_uinTotal_Count_array[1].equalsIgnoreCase(ufs_uinMatched_Count_array[1])){
					matched_efs_uin=ufs_uinTotal_Count_array[0];
					System.out.println("selected efs_uin"+matched_efs_uin);
					efs_uinMap.put(inputForm.get(i).toString(), matched_efs_uin);
				}
				else{
					System.out.println("Template Not found");
				}
			}
		}
			return efs_uinMap;	
		}
		
		
	
	
	
	
	public static void main(String []args) throws TesseractException{
	
		ClassifyModel classify=new ClassifyModel();
		//classifyIndex.getUfs_uin();
		//classify.RunclassifyefsUIN(101,"pdf\\new.jpg");
			
	}
	


	
	
	
	

}
