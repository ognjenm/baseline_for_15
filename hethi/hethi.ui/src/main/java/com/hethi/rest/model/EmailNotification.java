package com.hethi.rest.model;

public class EmailNotification {
	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getBusiness_email() {
		return business_email;
	}

	public void setBusiness_email(String business_email) {
		this.business_email = business_email;
	}

	public String getContact_number() {
		return contact_number;
	}

	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}

	private String business_email;
	private String contact_number;

}
