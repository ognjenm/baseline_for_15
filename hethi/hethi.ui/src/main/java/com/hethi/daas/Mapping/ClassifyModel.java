package com.hethi.daas.Mapping;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.hibernate.id.factory.IdentifierGeneratorFactory;

import com.hethi.rest.utility.CollectionManipulation;
import com.hethi.rest.utility.ImageUtil;
import com.hethi.rest.utility.PDFUtility;
import com.hethi.rest.utility.QueryExecutors;
import net.sourceforge.tess4j.TesseractException;


public class ClassifyModel {
	
	private int customer_id;
	private String efs_uin; 
	private String policyname; 
	private String policytype;
	private String policydescription;
	private Date policycretedate; 
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
		return policycretedate;
	}

	public void setOlicycretedate(Date olicycretedate) {
		this.policycretedate = olicycretedate;
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


}
