package com.hethi.rest.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class ixsd_cefs100101_exception implements Serializable {
	private String descrepancy_reason;

	public String getDescrepancy_reason() {
		return descrepancy_reason;
	}

	public void setDescrepancy_reason(String descrepancy_reason) {
		this.descrepancy_reason = descrepancy_reason;
	}

	public String getExcepionreason() {
		return excepionreason;
	}

	public void setExcepionreason(String excepionreason) {
		this.excepionreason = excepionreason;
	}

	public Timestamp getException_datetime() {
		return exception_datetime;
	}

	public void setException_datetime(Timestamp exception_datetime) {
		this.exception_datetime = exception_datetime;
	}

	public String getExceptioncategory() {
		return exceptioncategory;
	}

	public void setExceptioncategory(String exceptioncategory) {
		this.exceptioncategory = exceptioncategory;
	}

	public String getLine_item_exception_reason() {
		return line_item_exception_reason;
	}

	public void setLine_item_exception_reason(String line_item_exception_reason) {
		this.line_item_exception_reason = line_item_exception_reason;
	}

	private String din;

	public String getDin() {
		return din;
	}

	public void setDin(String din) {
		this.din = din;
	}

	public String getEfs_uin() {
		return efs_uin;
	}

	public void setEfs_uin(String efs_uin) {
		this.efs_uin = efs_uin;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	private String efs_uin;
	private String excepionreason;
	private Timestamp exception_datetime;
	private String exceptioncategory;
	private String line_item_exception_reason;
	private String uid;
	private int version;

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public Timestamp getLastupdtm() {
		return lastupdtm;
	}

	public void setLastupdtm(Timestamp lastupdtm) {
		this.lastupdtm = lastupdtm;
	}

	private Timestamp lastupdtm;

}
