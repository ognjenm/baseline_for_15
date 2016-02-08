package com.hethi.rest.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.management.MXBean;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class ixsd_cefs100101_lineitem implements Serializable{
	private String din;
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
	public String getPart_description() {
		return part_description;
	}
	@XmlElement
	public void setPart_description(String part_description) {
		this.part_description = part_description;
	}
	public double getPo_extended_price() {
		return po_extended_price;
	}
	@XmlElement
	public void setPo_extended_price(double po_extended_price) {
		this.po_extended_price = po_extended_price;
	}
	public String getPo_line_items() {
		return po_line_items;
	}
	@XmlElement
	public void setPo_line_items(String po_line_items) {
		this.po_line_items = po_line_items;
	}
	public int getPo_line_number() {
		return po_line_number;
	}
	@XmlElement
	public void setPo_line_number(int po_line_number) {
		this.po_line_number = po_line_number;
	}
	public double getPo_ordered_price() {
		return po_ordered_price;
	}
	@XmlElement
	public void setPo_ordered_price(double po_ordered_price) {
		this.po_ordered_price = po_ordered_price;
	}
	public int getPo_ordered_quantity() {
		return po_ordered_quantity;
	}
	@XmlElement
	public void setPo_ordered_quantity(int po_ordered_quantity) {
		this.po_ordered_quantity = po_ordered_quantity;
	}
	public int getPo_part_number() {
		return po_part_number;
	}
	@XmlElement
	public void setPo_part_number(int po_part_number) {
		this.po_part_number = po_part_number;
	}
	public String getPo_pool() {
		return po_pool;
	}
	@XmlElement
	public void setPo_pool(String po_pool) {
		this.po_pool = po_pool;
	}
	public String getPo_uom() {
		return po_uom;
	}
	@XmlElement
	public void setPo_uom(String po_uom) {
		this.po_uom = po_uom;
	}
	public int getSequence_no() {
		return sequence_no;
	}
	@XmlElement
	public void setSequence_no(int sequence_no) {
		this.sequence_no = sequence_no;
	}
	public String getStatus() {
		return status;
	}
	@XmlElement
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUid() {
		return uid;
	}
	@XmlElement
	public void setUid(String uid) {
		this.uid = uid;
	}
	private String efs_uin;
	private String part_description;
	private double po_extended_price;
	private String po_line_items;
	private int po_line_number;
	private double po_ordered_price;
	private int po_ordered_quantity;
	private int po_part_number;
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
