package com.hethi.rest.model;

import java.io.Serializable;
import java.sql.Timestamp;

import com.hethi.domain.iPost;
public class exception implements Serializable{
	

	private String efs_uin;
	private String sfs_uin;
	private String uid;
	private String din;
	private int version;
	
	private String exceptionreason;
	private String exceptioncode;
	private String exceptioncategory;
	private String exceptionfields;
	
	
	private Timestamp exception_datetime;
	private Timestamp lastupdtm;
	
	public exception(iPost ipost) {
		this.efs_uin =  ipost.getEfs_uin();
		this.sfs_uin =  ipost.getSfs_uin();
		this.uid =  ipost.getUid();
		this.din =  ipost.getDin();
		this.version =  ipost.getVersion();
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
	public String getDin() {
		return din;
	}
	public void setDin(String din) {
		this.din = din;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public String getExceptionreason() {
		return exceptionreason;
	}
	public void setExceptionreason(String exceptionreason) {
		this.exceptionreason = exceptionreason;
	}
	public String getExceptioncode() {
		return exceptioncode;
	}
	public void setExceptioncode(String exceptioncode) {
		this.exceptioncode = exceptioncode;
	}
	public String getExceptioncategory() {
		return exceptioncategory;
	}
	public void setExceptioncategory(String exceptioncategory) {
		this.exceptioncategory = exceptioncategory;
	}
	public Timestamp getException_datetime() {
		return exception_datetime;
	}
	public void setException_datetime(Timestamp exception_datetime) {
		this.exception_datetime = exception_datetime;
	}
	public Timestamp getLastupdtm() {
		return lastupdtm;
	}
	public void setLastupdtm(Timestamp lastupdtm) {
		this.lastupdtm = lastupdtm;
	}
	public String getExceptionfields() {
		return exceptionfields;
	}
	public void setExceptionfields(String exceptionfields) {
		this.exceptionfields = exceptionfields;
	}

	public String getSfs_uin() {
		return sfs_uin;
	}

	public void setSfs_uin(String sfs_uin) {
		this.sfs_uin = sfs_uin;
	}

	
	
	
}
