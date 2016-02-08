package com.hethi.rest.utility;

import java.awt.Rectangle;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.pdfbox.util.PDFTextStripperByArea;
import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ReadJson {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws FileNotFoundException, IOException, ParseException, JSONException {
		// ReadJson readJson = new ReadJson();
		ReadJson.jsonHandler("pdf//Example_001-json.json", "pdf//Example_002-JPG.pdf");

	}

	public static JSONObject jsonHandler(String jsonFile, String pdfFile)
			throws FileNotFoundException, IOException, ParseException, JSONException {

		String type = FilenameUtils.getExtension(jsonFile);
		System.out.println("extension is " + type);
		// pdfFile="pdf/example_002_a4.pdf";
		JSONParser parser = new JSONParser();
		Object obj = null;
		if (type.equalsIgnoreCase("xml")) {
			parser = new JSONParser();
			// System.out.println(XMLtoJsonConverter.convertXMLToJson(jsonFile));
			obj = parser.parse(XMLtoJsonConverter.convertXMLToJson(jsonFile));
		} else {
			obj = parser.parse(new FileReader(jsonFile));
		}

		JSONObject json_rootObj_1 = (JSONObject) obj;
		JSONObject json_rootObj = (JSONObject) json_rootObj_1.get("efsuin");
		JSONObject json_footerObj = (JSONObject) json_rootObj.get("footer");
		JSONObject json_headerObj = (JSONObject) json_rootObj.get("header");
		JSONObject json_bodyObj = (JSONObject) json_rootObj.get("body");

		/**
		 * for header
		 * 
		 */
		fieldHandler(json_headerObj, pdfFile, json_rootObj_1);
		JSONObject json_header_position = (JSONObject) json_headerObj.get("position");
		json_footerObj.put("content", extractData(extractPosition(json_header_position), pdfFile));
		// System.out.println("The json after header extraction : "
		// +json_rootObj);

		/**
		 * footer
		 *
		 */
		fieldHandler(json_footerObj, pdfFile, json_rootObj_1);
		JSONObject json_footer_position = (JSONObject) json_footerObj.get("position");
		json_footerObj.put("content", extractData(extractPosition(json_footer_position), pdfFile));

		// System.out.println("The json after footer extraction :
		// "+json_rootObj_1.toString());

		/**
		 * for body
		 * 
		 */
		/*
		 * fieldHandler(json_bodyObj,pdfFile); JSONObject json_body_position =
		 * (JSONObject) json_bodyObj.get("position"); JSONObject
		 * json_body_tableObject = (JSONObject) json_bodyObj.get("table");
		 * JSONObject json_body_table_footerObj = (JSONObject)
		 * json_body_tableObject.get("footer"); JSONObject
		 * json_body_table_lineItemObj = (JSONObject)
		 * json_body_tableObject.get("lineitem"); JSONObject
		 * json_body_table_headerObj = (JSONObject)
		 * json_body_tableObject.get("header");
		 */
		/**
		 * Child Of body
		 * 
		 */

		/*
		 * fieldHandler(json_body_table_footerObj,pdfFile);
		 * fieldHandler(json_body_table_lineItemObj,pdfFile);
		 * fieldHandler(json_body_table_headerObj,pdfFile);
		 */

		System.out.println("The final Json is ========================== >" + json_rootObj_1.toString());
		return json_rootObj_1;

	}

	/**
	 * 
	 * @param obj
	 * @return position interms of string
	 * @throws JSONException
	 */

	public static String extractPosition(JSONObject obj) throws JSONException {
		String position = "";
		String pos_attr[] = { "top", "left", "height", "width" };
		for (int i = 0; i < pos_attr.length; i++) {
			position += (String.valueOf(obj.get(pos_attr[i]) + ","));
			// System.out.println("The position is ==== > "+position);
		}
		System.out.println("The position is ==== > " + position);
		// position="219,42,36,3490";
		// position="135,6,129,-330";
		// position="627,57,61,2370";
		// position="627,58,111,8600";
		// position="620,57,66,240,";
		if (position.equalsIgnoreCase(",,,,")) {
			// position="627,58,185,8600";
			// position="620,57,66,240,";
			// position="627,57,111,8600";
			position = "0,0,0,00";
		}
		return position.substring(0, position.length() - 1);
	}

	/**
	 * 
	 * @param substring
	 * @return Fetched value from PDF(with coordinates)
	 * @throws JSONException
	 */

	public static String extractData(String substring, String pdfFile) throws JSONException {
		String[] array = substring.split(",");
		int x1 = Integer.parseInt(array[0]);
		int y1 = Integer.parseInt(array[1]);
		int x2 = Integer.parseInt(array[2]);
		int y2 = Integer.parseInt(array[3]);
		String data = pdftoText(x1, y1, x2, y2, pdfFile);
		// System.out.println("The data is ==== > "+data);
		return data;
	}

	/**
	 * 
	 * @param obj
	 * @throws JSONException
	 * 
	 */

	public static void fieldHandler(JSONObject obj, String pdfFile, JSONObject rootObj) throws JSONException {

		if (obj.toString().contains("\"field\":{")) {

			JSONObject json_field_Obj = (JSONObject) obj.get("field");
			JSONObject json_field_dataObj = (JSONObject) json_field_Obj.get("data");
			JSONObject json_field_data_positionObj = (JSONObject) json_field_dataObj.get("position");
			JSONObject json_field_labelObj = (JSONObject) json_field_Obj.get("label");
			JSONObject json_field_label_positionObj = (JSONObject) json_field_labelObj.get("position");
			/**
			 * Retrive data from PDF(using PDFBOX)
			 * 
			 */
			System.out.println("field Object @@@@@@@@@@@@@@@@@@@@@@@@@@@ = = =  >"
					+ extractData(extractPosition(json_field_data_positionObj), pdfFile));
			json_field_dataObj.put("content", extractData(extractPosition(json_field_data_positionObj), pdfFile));
			json_field_labelObj.put("content", extractData(extractPosition(json_field_label_positionObj), pdfFile));

		}

		else if (obj.toString().contains("\"field\":[")) {

			JSONArray json_fieldArray = (JSONArray) obj.get("field");

			for (int i = 0; i < json_fieldArray.size(); i++) {
				JSONObject json_field_Obj = (JSONObject) json_fieldArray.get(i);
				JSONObject json_field_dataObj = (JSONObject) json_field_Obj.get("data");
				JSONObject json_field_data_positionObj = (JSONObject) json_field_dataObj.get("position");
				JSONObject json_field_labelObj = (JSONObject) json_field_Obj.get("label");
				JSONObject json_field_label_positionObj = (JSONObject) json_field_labelObj.get("position");
				/**
				 * Retrive data from PDF(using PDFBOX)
				 * 
				 */
				json_field_dataObj.put("content", extractData(extractPosition(json_field_data_positionObj), pdfFile));
				json_field_labelObj.put("content", extractData(extractPosition(json_field_label_positionObj), pdfFile));

			}
		} else {
			System.out.println("file not contains any field");
		}
	}

	/**
	 * 
	 * @param x1
	 * @param y1
	 * @param y2
	 * @param x2
	 * @param pdfFile
	 * @return string data
	 */

	public static String pdftoText(int x1, int y1, int y2, int x2, String pdfFile) {
		String data = null;
		PDFTextStripper pdfStripper = null;
		PDDocument pdDoc = null;
		COSDocument cosDoc = null;
		File file = new File(pdfFile);
		try {
			PDFParser parser = new PDFParser(new FileInputStream(file));
			parser.parse();
			cosDoc = parser.getDocument();
			pdfStripper = new PDFTextStripper();
			pdDoc = new PDDocument(cosDoc);
			PDFTextStripperByArea stripper = new PDFTextStripperByArea();
			stripper.setSortByPosition(true);
			Rectangle rect = new Rectangle(x1, y1, x2, y2);
			stripper.addRegion("class1", rect);
			List allPages = pdDoc.getDocumentCatalog().getAllPages();
			PDPage firstPage = (PDPage) allPages.get(0);
			stripper.extractRegions(firstPage);
			System.out.println("Text in the area:" + rect);
			data = stripper.getTextForRegion("class1");
			System.out.println("The Data is === > " + stripper.getTextForRegion("class1"));
			String parsedText = pdfStripper.getText(pdDoc);
			// System.out.println("The parsed text is
			// ======================================== > "+parsedText);
		}

		catch (IOException e) {
			e.printStackTrace();
		}

		return data;

	}

}