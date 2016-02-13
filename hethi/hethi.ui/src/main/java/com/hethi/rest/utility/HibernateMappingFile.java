package com.hethi.rest.utility;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class HibernateMappingFile {
	
	public static void createXML(String filePath, String fileName, JSONArray jsonArray) throws IOException {
		StringBuilder builder = new StringBuilder();
		builder.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?> \n");
		builder.append("<!DOCTYPE hibernate-mapping PUBLIC \n");
		builder.append("\"-//Hibernate/Hibernate Mapping DTD 3.0//EN\" \n");
		builder.append("\"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd\"> \n");
		builder.append("<hibernate-mapping> \n");

		builder.append("<class name=\"com.hethi.model.").append(fileName).append("\" table=\"").append(fileName)
				.append("\" schema=\"hethi\"> \n");
		builder.append("<composite-id> \n");
		int index = 0;
		String type1 = null;
		while (index < jsonArray.size()) {
			JSONObject json = (JSONObject) jsonArray.get(index);
			if (json.get("type").toString().equals("Integer"))
				type1 = "int";
			else if (json.get("type").toString().equals("String"))
				type1 = "string";
			if (json.get("pk").equals("yes")) {
				builder.append("<key-property name=\"").append(json.get("column").toString()).append("\" type=\"")
						.append(type1).append("\" column=\"").append(json.get("column").toString()).append("\"/> \n");
			}
			index++;
		}
		builder.append("</composite-id> \n");
		index = 0;
		String type = null;
		while (index < jsonArray.size()) {
			JSONObject json = (JSONObject) jsonArray.get(index);
			if (json.get("type").toString().equals("Integer"))
				type = "int";
			else if (json.get("type").toString().equals("String"))
				type = "string";
			if (json.get("pk").equals("no")) {
				builder.append("<property name=\"").append(json.get("column").toString()).append("\" type=\"")
						.append(type).append("\" column=\"").append(json.get("column").toString()).append("\"/> \n");
			}
			index++;
		}
		builder.append("</class> \n");
		builder.append("</hibernate-mapping> \n");
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File dir = new File(currentDir + filePath);
		dir.mkdirs();
		BufferedWriter writer = new BufferedWriter(
				new OutputStreamWriter(new FileOutputStream(new File(dir, fileName + ".hbm.xml"))));
		writer.write(builder.toString());
		writer.close();
	}
}
