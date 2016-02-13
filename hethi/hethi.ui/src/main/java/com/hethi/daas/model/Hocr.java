package com.hethi.daas.model;

import java.util.List;

public class Hocr {

	private String id;
	private String title;
	private String classs;
	private List<Span> span;
	
	
	public List<Span> getSpan() {
		return span;
	}
	public void setSpan(List<Span> span) {
		this.span = span;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getClasss() {
		return classs;
	}
	public void setClasss(String classs) {
		this.classs = classs;
	}
	
	
	
	
	
	
	
	
	
}
