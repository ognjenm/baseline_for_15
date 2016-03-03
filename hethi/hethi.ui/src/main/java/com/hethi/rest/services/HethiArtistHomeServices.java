package com.hethi.rest.services;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.hethi.daas.Mapping.ReadJson;
import com.hethi.daas.hocr.ReadHocr;
import com.hethi.rest.repo.HethiArtistHomeRepo;
import com.hethi.rest.utility.ExtractZipFiles;
import com.hethi.rest.utility.WriteToFile;
import com.lowagie.text.pdf.PdfReader;

public class HethiArtistHomeServices {
	HethiArtistHomeRepo artistRepo = new HethiArtistHomeRepo();
	ReadHocr hocrReader = new ReadHocr();


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
		String customer_id = json.get("customer_id").toString();
		
		String filepath = wf.createFile(efs_content, upload_id, file_id, user_id, "src/web/client/images/ixsd");
		ExtractZipFiles extract = new ExtractZipFiles();
		String baseURL = extract.readFile().get(0);
		int i = filepath.lastIndexOf("/images/");
		String fileLocation = baseURL + filepath.substring(i, filepath.length());
//		efs_content.replaceAll("'", "\'");
		String efs_data=efs_content.replace("'", "\"");
		String sql = "call generate_form_stencilid('" + upload_id + "','" + file_id + "'," + "'" + user_id + "','"
				+ efs_data + "','" + fileLocation + "','"+customer_id+"')";
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
	public String autoStenciling(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
			ClassNotFoundException, FileNotFoundException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String filePath=(String) json.get("file_location");
		String relativePath = "src/web/client";
		filePath=relativePath+filePath.substring(filePath.indexOf("/images"), filePath.length());
		String hocrPath=filePath.substring(0, filePath.lastIndexOf(".")) + ".hocr";
		String pdfPath=hocrPath.substring(0, hocrPath.lastIndexOf(".")) + ".pdf";
		return hocrReader.autoStencil(filePath,hocrPath, pdfPath);
}
	public String extractDataFromPosition(String JSONData) throws ParseException, InstantiationException, IllegalAccessException,
		ClassNotFoundException, FileNotFoundException, IOException {
		JSONObject json = (JSONObject) new JSONParser().parse(JSONData);
		String filePath=(String) json.get("file_location");
		String relativePath = "src/web/client";
		filePath=relativePath+filePath.substring(filePath.indexOf("/images"), filePath.length());
		String pdfPath=filePath.substring(0, filePath.lastIndexOf(".")) + ".pdf";
		  PdfReader reader = new PdfReader(pdfPath);
		  com.lowagie.text.Rectangle cropbox = reader.getCropBox(1); 		  
		  int imgwidth          = (int) cropbox.getWidth();
		  int imgheight         = (int) cropbox.getHeight();
//		BufferedImage bimg = ImageIO.read(new File(filePath));
//		int imgwidth          = bimg.getWidth();
//		int imgheight         = bimg.getHeight();
		float varWidth=imgwidth;
		float varHeight=imgheight;
		String substring= json.get("left")+","+ json.get("top")+","+ json.get("width")+","+ json.get("height")+",";
		String[] array = substring.split(",");
		float x1 = (float) (varWidth / 876.0 * Integer.parseInt(array[0]));
		float y1 = (float) (varHeight / 900.0 * Integer.parseInt(array[1]));
		float x2 = (float) (varWidth / 876.0 * Integer.parseInt(array[2]));
		float y2 = (float) (varHeight / 900.0 * Integer.parseInt(array[3]));
		int left=(int) x1;
		int top=(int) y1;
		int width=(int) x2;
		int height=(int) y2;
		ReadJson readjson=new ReadJson();
		String data = readjson.extractTextFromPDF(left, top, height,width, pdfPath);
		ArrayList<Map> resultList = new ArrayList<Map>();
		Map<String, String> singleRow =  new HashMap<String, String>();
		singleRow.put("data", data);	
		resultList.add(singleRow);
		Gson gsonObj=new Gson();
		return gsonObj.toJson(resultList);
}

}
