package com.hethi.rest.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ixsd_cefs100101 implements Serializable{
	
	
	//private ixsd_cefs100101_lineitem cefs100101_lineitem;
	
	private List<ixsd_cefs100101_lineitem> lineitem;
	
	/*public ixsd_cefs100101_lineitem getCefs100101_lineitem() {
		return cefs100101_lineitem;
	}
	@XmlElement
	public void setCefs100101_lineitem(ixsd_cefs100101_lineitem cefs100101_lineitem) {
		this.cefs100101_lineitem = cefs100101_lineitem;
	}*/
	public List<ixsd_cefs100101_lineitem> getLineitem() {
		return lineitem;
	}
	@XmlElement
	public void setLineitem(List<ixsd_cefs100101_lineitem> lineitem) {
		this.lineitem = lineitem;
	}

	
	public String getUid() {
		return uid;
	}
		@XmlElement
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getDin() {
		return din;
	}
	@XmlElement
	public void setDin(String din) {
		this.din = din;
	}
	public String getEfs_uin() {
		return efs_uin;
	}
	@XmlElement
	public void setEfs_uin(String efs_uin) {
		this.efs_uin = efs_uin;
	}
	public int getVersion() {
		return version;
	}
	@XmlElement
	public void setVersion(int version) {
		this.version = version;
	}
	public String getBranch_location() {
		return branch_location;
	}
	@XmlElement
	public void setBranch_location(String branch_location) {
		this.branch_location = branch_location;
	}
	public String getClaimedby() {
		return claimedby;
	}
	@XmlElement
	public void setClaimedby(String claimedby) {
		this.claimedby = claimedby;
	}
	public String getCompany_code() {
		return company_code;
	}
	@XmlElement
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getCredit_category() {
		return credit_category;
	}
	@XmlElement
	public void setCredit_category(String credit_category) {
		this.credit_category = credit_category;
	}
	public String getCredit_original_invoice() {
		return credit_original_invoice;
	}
	@XmlElement
	public void setCredit_original_invoice(String credit_original_invoice) {
		this.credit_original_invoice = credit_original_invoice;
	}
	public String getCurrency() {
		return currency;
	}
	@XmlElement
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	private Timestamp datetime;
	public Timestamp getDatetime() {
		return datetime;
	}
	@XmlElement
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public String getDepartment_code() {
		return department_code;
	}
	@XmlElement
	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}
	public String getDept_lookup_flag() {
		return dept_lookup_flag;
	}
	@XmlElement
	public void setDept_lookup_flag(String dept_lookup_flag) {
		this.dept_lookup_flag = dept_lookup_flag;
	}
	
	public String getDocument_type() {
		return document_type;
	}
	@XmlElement
	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}
	public String getDuplicate_flag() {
		return duplicate_flag;
	}
	@XmlElement
	public void setDuplicate_flag(String duplicate_flag) {
		this.duplicate_flag = duplicate_flag;
	}
	
	public String getExceptionreason() {
		return exceptionreason;
	}
	@XmlElement
	public void setExceptionreason(String exceptionreason) {
		this.exceptionreason = exceptionreason;
	}
	public String getFrieght_term() {
		return frieght_term;
	}
	@XmlElement
	public void setFrieght_term(String frieght_term) {
		this.frieght_term = frieght_term;
	}
	public String getIcoming_type() {
		return icoming_type;
	}
	@XmlElement
	public void setIcoming_type(String icoming_type) {
		this.icoming_type = icoming_type;
	}
	public String getInvoice_amount() {
		return invoice_amount;
	}
	@XmlElement
	public void setInvoice_amount(String invoice_amount) {
		this.invoice_amount = invoice_amount;
	}
	
	public String getInvoice_number() {
		return invoice_number;
	}
	@XmlElement
	public void setInvoice_number(String invoice_number) {
		this.invoice_number = invoice_number;
	}
	public String getInvoice_sub_total() {
		return invoice_sub_total;
	}
	@XmlElement
	public void setInvoice_sub_total(String invoice_sub_total) {
		this.invoice_sub_total = invoice_sub_total;
	}
	
	
	public String getLastupuser() {
		return lastupuser;
	}
	@XmlElement
	public void setLastupuser(String lastupuser) {
		this.lastupuser = lastupuser;
	}
	public String getPaymentterms() {
		return paymentterms;
	}
	@XmlElement
	public void setPaymentterms(String paymentterms) {
		this.paymentterms = paymentterms;
	}
	public String getPo_lookup_flag() {
		return po_lookup_flag;
	}
	@XmlElement
	public void setPo_lookup_flag(String po_lookup_flag) {
		this.po_lookup_flag = po_lookup_flag;
	}
	public String getPo_number() {
		return po_number;
	}
	@XmlElement
	public void setPo_number(String po_number) {
		this.po_number = po_number;
	}
	public String getPo_type() {
		return po_type;
	}
	@XmlElement
	public void setPo_type(String po_type) {
		this.po_type = po_type;
	}
	public String getPo_vcost() {
		return po_vcost;
	}
	@XmlElement
	public void setPo_vcost(String po_vcost) {
		this.po_vcost = po_vcost;
	}
	public String getPriority() {
		return priority;
	}
	@XmlElement
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getQueue() {
		return queue;
	}
	@XmlElement
	public void setQueue(String queue) {
		this.queue = queue;
	}
	public String getQueue_id() {
		return queue_id;
	}
	@XmlElement
	public void setQueue_id(String queue_id) {
		this.queue_id = queue_id;
	}
	
	public String getReturnmailcategory() {
		return returnmailcategory;
	}
	@XmlElement
	public void setReturnmailcategory(String returnmailcategory) {
		this.returnmailcategory = returnmailcategory;
	}
	
	public String getTax_flag() {
		return tax_flag;
	}
	@XmlElement
	public void setTax_flag(String tax_flag) {
		this.tax_flag = tax_flag;
	}
	
	public String getVendor_address01() {
		return vendor_address01;
	}
	@XmlElement
	public void setVendor_address01(String vendor_address01) {
		this.vendor_address01 = vendor_address01;
	}
	public String getVendor_address02() {
		return vendor_address02;
	}
	@XmlElement
	public void setVendor_address02(String vendor_address02) {
		this.vendor_address02 = vendor_address02;
	}
	public String getVendor_city() {
		return vendor_city;
	}
	@XmlElement
	public void setVendor_city(String vendor_city) {
		this.vendor_city = vendor_city;
	}
	public String getVendor_class() {
		return vendor_class;
	}
	@XmlElement
	public void setVendor_class(String vendor_class) {
		this.vendor_class = vendor_class;
	}
	public String getVendor_lookup_flag() {
		return vendor_lookup_flag;
	}
	@XmlElement
	public void setVendor_lookup_flag(String vendor_lookup_flag) {
		this.vendor_lookup_flag = vendor_lookup_flag;
	}
	public String getVendor_name() {
		return vendor_name;
	}
	@XmlElement
	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}
	public String getVendor_number() {
		return vendor_number;
	}
	@XmlElement
	public void setVendor_number(String vendor_number) {
		this.vendor_number = vendor_number;
	}
	public String getVendor_state() {
		return vendor_state;
	}
	@XmlElement
	public void setVendor_state(String vendor_state) {
		this.vendor_state = vendor_state;
	}
	public String getVendor_zip_4() {
		return vendor_zip_4;
	}
	@XmlElement
	public void setVendor_zip_4(String vendor_zip_4) {
		this.vendor_zip_4 = vendor_zip_4;
	}
	public String getVendor_zip_5() {
		return vendor_zip_5;
	}
	@XmlElement
	public void setVendor_zip_5(String vendor_zip_5) {
		this.vendor_zip_5 = vendor_zip_5;
	}
	
	public Timestamp getInvoice_date() {
		return invoice_date;
	}
	@XmlElement
	public void setInvoice_date(Timestamp invoice_date) {
		this.invoice_date = invoice_date;
	}
	public Timestamp getLast_upade_date() {
		return last_upade_date;
	}
	@XmlElement
	public void setLast_upade_date(Timestamp last_upade_date) {
		this.last_upade_date = last_upade_date;
	}
	public Timestamp getLastupdtm() {
		return lastupdtm;
	}
	@XmlElement
	public void setLastupdtm(Timestamp lastupdtm) {
		this.lastupdtm = lastupdtm;
	}
	public Timestamp getScandate() {
		return scandate;
	}
	@XmlElement
	public void setScandate(Timestamp scandate) {
		this.scandate = scandate;
	}
	public Timestamp getWfremovedate() {
		return wfremovedate;
	}
	@XmlElement
	public void setWfremovedate(Timestamp wfremovedate) {
		this.wfremovedate = wfremovedate;
	}
	public Timestamp getWorkflowstartdate() {
		return workflowstartdate;
	}
	@XmlElement
	public void setWorkflowstartdate(Timestamp workflowstartdate) {
		this.workflowstartdate = workflowstartdate;
	}
	public String getWorkflowstatus() {
		return workflowstatus;
	}
	@XmlElement
	public void setWorkflowstatus(String workflowstatus) {
		this.workflowstatus = workflowstatus;
	}
	
	
	@Column(name = "version", nullable = true)
	private int version;
	@Column(name = "branch_location", nullable = true)
	private String branch_location;
	@Column(name = "claimedby", nullable = true)
	private String claimedby;
	@Column(name = "company_code", nullable = true)
	private String company_code;
	@Column(name = "credit_category", nullable = true)
	private String credit_category;
	@Column(name = "credit_original_invoice", nullable = true)
	private String credit_original_invoice;
	@Column(name = "currency", nullable = true)
	private String currency;
	@Column(name = "department_code", nullable = true)
	private String department_code;
	@Column(name = "dept_lookup_flag", nullable = true)
	private String dept_lookup_flag;
	@Column(name = "din", nullable = true)
	private String din;
	@Column(name = "document_type", nullable = true)
	private String document_type;
	@Column(name = "duplicate_flag", nullable = true)
	private String duplicate_flag;
	@Column(name = "efs_uin", nullable = true)
	private String efs_uin;
	@Column(name = "exceptionreason", nullable = true)
	private String exceptionreason;
	@Column(name = "frieght_term", nullable = true)
	private String frieght_term;
	@Column(name = "icoming_type", nullable = true)
	private String icoming_type;
	@Column(name = "invoice_amount", nullable = true)
	private String invoice_amount;
	@Column(name = "invoice_date", nullable = true)
	private Timestamp invoice_date;
	@Column(name = "invoice_number", nullable = true)
	private String invoice_number;
	@Column(name = "invoice_sub_total", nullable = true)
	private String invoice_sub_total;
	@Column(name = "last_upade_date", nullable = true)
	private Timestamp last_upade_date;
	@Column(name = "lastupdtm", nullable = true)
	private Timestamp lastupdtm;
	@Column(name = "lastupuser", nullable = true)
	private String lastupuser;
	@Column(name = "paymentterms", nullable = true)
	private String paymentterms;
	@Column(name = "po_lookup_flag", nullable = true)
	private String po_lookup_flag;
	@Column(name = "po_number", nullable = true)
	private String po_number;
	@Column(name = "po_type", nullable = true)
	private String po_type;
	@Column(name = "po_vcost", nullable = true)
	private String po_vcost;
	@Column(name = "priority", nullable = true)
	private String priority;
	@Column(name = "queue", nullable = true)
	private String queue;
	@Column(name = "returnmailcategory", nullable = true)
	private String queue_id;
	@Column(name = "returnmailcategory", nullable = true)
	private String returnmailcategory;
	@Column(name = "scandate", nullable = true)
	private Timestamp scandate;
	@Column(name = "tax_flag", nullable = true)
	private String tax_flag;
	@Column(name = "uid", nullable = true)
	private String uid;
	@Column(name = "vendor_address01", nullable = true)
	private String vendor_address01;
	@Column(name = "vendor_address02", nullable = true)
	private String vendor_address02;
	@Column(name = "vendor_city", nullable = true)
	private String vendor_city;
	@Column(name = "vendor_class", nullable = true)
	private String vendor_class;
	@Column(name = "vendor_lookup_flag", nullable = true)
	private String vendor_lookup_flag;
	@Column(name = "vendor_name", nullable = true)
	private String vendor_name;
	@Column(name = "vendor_number", nullable = true)
	private String vendor_number;
	@Column(name = "vendor_state", nullable = true)
	private String vendor_state;
	@Column(name = "vendor_zip_4", nullable = true)
	
	private String vendor_zip_4;
	@Column(name = "vendor_zip_5", nullable = true)
	private String vendor_zip_5;
	@Column(name = "wfremovedate", nullable = true)
	private Timestamp wfremovedate;
	@Column(name = "workflowstartdate", nullable = true)
	private Timestamp workflowstartdate;
	@Column(name = "workflowstatus", nullable = true)
	private String workflowstatus;

}


