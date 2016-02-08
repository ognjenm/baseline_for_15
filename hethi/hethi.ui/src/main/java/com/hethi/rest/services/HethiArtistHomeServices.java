package com.hethi.rest.services;

import java.io.IOException;
import java.sql.SQLException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.hethi.rest.repo.HethiArtistHomeRepo;
import com.hethi.rest.utility.ExtractZipFiles;
import com.hethi.rest.utility.WriteToFile;

public class HethiArtistHomeServices {
	HethiArtistHomeRepo artistRepo = new HethiArtistHomeRepo();

	public String load_jobs(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_hethi_artist_task_list('" + json.get("business_artist") + "') }";
		System.out.println(sql);
		return artistRepo.load_jobs(sql);
	}

	public String load_uploaded_files(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "select * from dupload_file where upload_id='" + json.get("upload_id") + "'";
		System.out.println(sql);
		return artistRepo.load_uploaded_files(sql);
	}

	public String Saveformdata(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		WriteToFile wf = new WriteToFile();
		String efs_content = json.get("efs_content").toString();
		String upload_id = json.get("upload_id").toString();
		String file_id = json.get("file_id").toString();
		String user_id = json.get("user_id").toString();
		String filepath = wf.createFile(efs_content, upload_id, file_id, user_id, "src/web/client/images/ixsd");
		ExtractZipFiles extract = new ExtractZipFiles();
		String baseURL = extract.readFile().get(0);
		int i = filepath.lastIndexOf("/images/");
		String fileLocation = baseURL + filepath.substring(i, filepath.length());
//		efs_content.replaceAll("'", "\'");
		String efs_data=efs_content.replace("'", "\"");
		String sql = "call generate_form_stencilid('" + upload_id + "','" + file_id + "'," + "'" + user_id + "','"
				+ efs_data + "','" + fileLocation + "')";
		System.out.println(efs_data);

		System.out.println(sql);
		return artistRepo.Saveformdata(sql);
	}

	public String load_cserviceplays(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String sql = "{ call load_customer_serviceplay('" + json.get("customer_id") + "') }";
		System.out.println(sql);
		return artistRepo.load_cserviceplays(sql);
	}

	public String load_customer_uploaded_forms(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call load_customer_uploaded_forms('" + json.get("customer_id") + "')}";
		System.out.println(query);
		return artistRepo.load_customer_uploaded_forms(query);
	}

	public String previewDocument(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String query = "{ call previewgenerator('" + json.get("upoad_id") + "'," + "'" + json.get("file_id") + "') }";
		System.out.println(query);
		return artistRepo.previewDocument(query);
	}

	public String load_users() throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		String sql = "{ call load_userlist() }";
		System.out.println(sql);
		return artistRepo.load_users(sql);
	}

}
