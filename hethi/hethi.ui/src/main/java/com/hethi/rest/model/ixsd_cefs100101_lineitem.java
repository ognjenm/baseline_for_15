package com.hethi.rest.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ixsd_cefs100101_lineitem implements Serializable {
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

	public String getPart_description() {
		return part_description;
	}

	public void setPart_description(String part_description) {
		this.part_description = part_description;
	}

	public String getPo_extended_price() {
		return po_extended_price;
	}

	public void setPo_extended_price(String po_extended_price) {
		this.po_extended_price = po_extended_price;
	}

	public String getPo_line_items() {
		return po_line_items;
	}

	public void setPo_line_items(String po_line_items) {
		this.po_line_items = po_line_items;
	}

	public String getPo_line_number() {
		return po_line_number;
	}

	public void setPo_line_number(String po_line_number) {
		this.po_line_number = po_line_number;
	}

	public String getPo_ordered_price() {
		return po_ordered_price;
	}

	public void setPo_ordered_price(String po_ordered_price) {
		this.po_ordered_price = po_ordered_price;
	}

	public String getPo_ordered_quantity() {
		return po_ordered_quantity;
	}

	public void setPo_ordered_quantity(String po_ordered_quantity) {
		this.po_ordered_quantity = po_ordered_quantity;
	}

	public String getPo_part_number() {
		return po_part_number;
	}

	public void setPo_part_number(String po_part_number) {
		this.po_part_number = po_part_number;
	}

	public String getPo_pool() {
		return po_pool;
	}

	public void setPo_pool(String po_pool) {
		this.po_pool = po_pool;
	}

	public String getPo_uom() {
		return po_uom;
	}

	public void setPo_uom(String po_uom) {
		this.po_uom = po_uom;
	}

	public int getSequence_no() {
		return sequence_no;
	}

	public void setSequence_no(int sequence_no) {
		this.sequence_no = sequence_no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	private String efs_uin;
	private String part_description;
	private String po_extended_price;
	private String po_line_items;
	private String po_line_number;
	private String po_ordered_price;
	private String po_ordered_quantity;
	private String po_part_number;
	private String po_pool;
	private String po_uom;
	private int sequence_no;
	private String status;
	private String uid;

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

	private int version;
	private Timestamp lastupdtm;

}
