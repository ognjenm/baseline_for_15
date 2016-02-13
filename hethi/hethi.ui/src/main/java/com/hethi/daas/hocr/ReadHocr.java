package com.hethi.daas.hocr;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.hethi.daas.model.Hocr;
import com.hethi.daas.model.Span;
import com.hethi.daas.utility.XMLtoJsonConverter;
import com.hethi.daas.utility.DataExtraction;
//import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

public class ReadHocr {

	public static List<Span> parseHocr(String filePath) throws ParseException, FileNotFoundException, IOException {

		String type = FilenameUtils.getExtension(filePath);
		System.out.println("extension is " + type);

		JSONParser parser = new JSONParser();
		Object obj = null;
		if (type.equalsIgnoreCase("xml")) {
			parser = new JSONParser();
			// System.out.println(XMLtoJsonConverter.convertXMLToJson(jsonFile));
			obj = parser.parse(XMLtoJsonConverter.convertXMLToJson(filePath));
		} else {
			obj = parser.parse(filePath);
		}

		JSONObject json_rootObj_1 = (JSONObject) obj;
		JSONObject json_rootObj2 = (JSONObject) json_rootObj_1.get("div");
		JSONObject json_rootObj3 = (JSONObject) json_rootObj2.get("div");
		JSONObject json_rootObj = (JSONObject) json_rootObj3.get("p");
		JSONArray jsonArray = (JSONArray) json_rootObj.get("span");

		// List<Hocr> hocrArray=new ArrayList<Hocr>();

		List<Span> spanarray = new ArrayList<Span>();

		Hocr hocr = null;
		for (int i = 0; i <jsonArray.size(); i++) {
			System.out.println("The value is " + i);
			hocr = new Hocr();
			JSONObject json_field_Obj = (JSONObject) jsonArray.get(i);
			hocr.setClasss((String) json_field_Obj.get("class"));
			hocr.setId((String) json_field_Obj.get("id"));
			hocr.setTitle((String) json_field_Obj.get("title"));

			Object object = json_field_Obj.get("span");
			if (object instanceof JSONObject) {
				Span span = new Span();
				JSONObject inner_span_obj = (JSONObject) json_field_Obj.get("span");
				span.setClasss((String) inner_span_obj.get("class"));
				span.setId((String) inner_span_obj.get("id"));
				span.setTitle((String) inner_span_obj.get("title"));
				span.setDir((String) inner_span_obj.get("dir"));
				System.out.println("Strong = "+inner_span_obj.get("strong"));
//				if(!inner_span_obj.get("strong")){
				span.setStrong((String)inner_span_obj.get("strong"));
//				}
				spanarray.add(span);
			} else if (object instanceof JSONArray) {
				JSONArray inner_Span_array = (JSONArray) json_field_Obj.get("span");

				for (int j = 0; j < inner_Span_array.size(); j++) {

					Span span = new Span();
					JSONObject inner_span_obj = (JSONObject) inner_Span_array.get(j);
					span.setClasss((String) inner_span_obj.get("class"));
					span.setId((String) inner_span_obj.get("id"));
					span.setDir((String) inner_span_obj.get("dir"));
					String title=(String) inner_span_obj.get("title");
					if(String.valueOf(inner_span_obj.get("strong"))!="null"){
						span.setStrong(String.valueOf(inner_span_obj.get("strong")));
						}else if(String.valueOf(inner_span_obj.get("#text"))!="null"){
							span.setStrong(String.valueOf(inner_span_obj.get("#text")));
						}else{
							span.setStrong(String.valueOf(inner_span_obj.get("em")));
						}
					title=title.replace("bbox", "");
					title=title.substring(0, title.lastIndexOf(";")).replace(" ", ",");
					title=title.substring(1,title.length());
					System.out.println("title "+title);
					//System.out.println("the string is === >"+span.getTitle());
					span.setTitle(title);
					spanarray.add(span);

					
					
				}
			}

			
		}
		/*Gson gson = new Gson();
		return gson.toJson(hocr);*/
		return spanarray;
	}	
	
	
	public  static String fetchFromPdf(String filePath,String hocr,String PdfFile) throws FileNotFoundException, ParseException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = new ArrayList<Map>();
		Map<String, String> singleRow =null;
		List<Span> positionList=parseHocr(hocr);
		BufferedImage bimg = ImageIO.read(new File(filePath));
		int imgwidth          = bimg.getWidth();
		int imgheight         = bimg.getHeight();
		singleRow =  new HashMap<String, String>();
		singleRow.put("height", String.valueOf(imgheight));			
		singleRow.put("width", String.valueOf(imgwidth));
		resultList.add(singleRow);
		resultSet.add(resultList);
		for (Span span : positionList) {
			String pos=span.getTitle();
			singleRow =  new HashMap<String, String>();
			String []array=pos.split(",");
			if(!array[0].startsWith("bbox")){
			int x1=Integer.parseInt(array[0]);
			int y1=Integer.parseInt(array[1]);
			int x2=Integer.parseInt(array[2]);
			int y2=Integer.parseInt(array[3]);
			x1=x2-x1;
			y1=y2-y1;
			String data=span.getStrong();
//			DataExtraction.pdftoText(x1, y1, x2, y2, PdfFile);			
			singleRow.put("top", String.valueOf(y2));
			singleRow.put("left", String.valueOf(x2));
			singleRow.put("width", String.valueOf(x1));
			singleRow.put("height", String.valueOf(y1));			
			singleRow.put("data", data);
			resultList.add(singleRow);
			resultSet.add(resultList);
			}
		}
		Gson gsonObj=new Gson();
		return gsonObj.toJson(resultSet);
		
		
	}
	
	
	static String readFile(String fileName) throws IOException {
	    BufferedReader br = new BufferedReader(new FileReader(fileName));
	    try {
	        StringBuilder sb = new StringBuilder();
	        String line = br.readLine();

	        while (line != null) {
	        	System.out.println(line.substring(0,3));
	        	if(line.substring(0,6)!="  <div"){
	            sb.append(line);
	            sb.append("\n");
	        	}
	            line = br.readLine();
	        }
	        return sb.toString();
	    } finally {
	        br.close();
	    }
	}
	public  static String autoStencil(String filePath,String hocr,String PdfFile) throws FileNotFoundException, ParseException, IOException {
	
		XMLtoJsonConverter xmlConverter=new XMLtoJsonConverter();
		String Json=readFile(hocr);
		Json=Json.replace("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"", " ");
		Json=Json.replace("\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"," ");
		Json=Json.replace("<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">", " ");
		Json=Json.replace("<head>", " ");
		Json=Json.replace("<title>", " ");
		Json=Json.replace("</title>", " ");
		Json=Json.replace("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />", " ");
		Json=Json.replace("<meta name='ocr-system' content='tesseract 3.03' />", " ");
		Json=Json.replace("<meta name='ocr-capabilities' content='ocr_page ocr_carea ocr_par ocr_line ocrx_word'/>", " ");
		Json=Json.replace("</head>", " ");
		Json=Json.replace("<body>", " ");
		Json=Json.replaceAll("</body>", " ");
		Json=Json.replaceAll("</html>", " ");
		System.out.println(Json);
		Json=xmlConverter.convertXMLToJson(Json);
		

		return ReadHocr.fetchFromPdf(filePath,Json,PdfFile);
		
	}
	
}