package com.hethi.rest.services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.hethi.rest.model.EmailNotification;
import com.hethi.rest.model.Stencil;
import com.hethi.rest.repo.StencilRepo;

import javassist.CannotCompileException;
import javassist.NotFoundException;

public class StencilServices {
	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> generate_stencil(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call getstencildata_by_stencilid('" + json.get("form_stencid") + "')}";
		System.out.println(sql);

		StencilRepo stencil = new StencilRepo();
		ArrayList<ArrayList> stencil_output = stencil.generate_stencil(sql);
		return stencil_output;
	}

	public String previewEfs(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call previewEfs('" + json.get("form_stencid") + "')}";
		System.out.println(sql);
		StencilRepo stencil = new StencilRepo();
		return stencil.previewEfs(sql);
	}

	public String listAllDocuments(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call listAllDocuments('" + json.get("customer_id") + "')}";
		System.out.println(sql);
		StencilRepo stencil = new StencilRepo();
		return stencil.listAllDocuments(sql);
	}

	public String saveStencilData(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		System.out.println(json.toString());
		StencilRepo stencil = new StencilRepo();
		return stencil.savePOStencilData(json);
	}

	public String saveMxmlData(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		System.out.println(json.toString());
		String query = "{ call save_xml_data('" + json.get("din").toString() + "','" + json.get("efs_uin").toString()
				+ "'," + "'" + json.get("tfs_uin").toString() + "','" + json.get("upload_id") + "'," + "'"
				+ json.get("file_id") + "','" + json.get("customer_id") + "','" + json.get("mxml").toString() + "',"
				+ "'" + json.get("mxml_location").toString() + "','" + json.get("lastUpuser") + "')}";
		StencilRepo stencil = new StencilRepo();
		return stencil.saveMxmlData(query);
	}

	public String createFormLookUpTable(String JSONData)
			throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException,
			NotFoundException, CannotCompileException, IOException {
		JSONArray jsonArray = (JSONArray) new JSONParser().parse(JSONData);
		StencilRepo stencil = new StencilRepo();
		return stencil.createFormLookUpTable(jsonArray);
	}

	public String saveMxsd(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException, NotFoundException, CannotCompileException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		StencilRepo stencil = new StencilRepo();
		String sql = "{call save_mxsd('" + json.get("customer_id") + "','" + json.get("efs_uin").toString() + "'," + "'"
				+ json.get("user_id") + "','" + json.get("data").toString() + "')}";
		System.out.println(sql);
		return stencil.saveMxsd(sql);
	}
}
