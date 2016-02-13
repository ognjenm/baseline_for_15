package com.hethi.rest.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import org.json.JSONObject;
import org.json.XML;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hethi.daas.Mapping.ReadJson;
import com.hethi.rest.model.EmailNotification;
import com.hethi.rest.model.Stencil;
import com.hethi.rest.services.StencilServices;
import com.hethi.rest.utility.ProcessStencil;
import com.hethi.rest.utility.XMLtoJsonConverter;

import javassist.CannotCompileException;
import javassist.NotFoundException;

@Controller
@RequestMapping("/stencilservices")
public class StencilController {
	static String JodConverterPath = "D:\\jodconverter-2.2.2\\jodconverter-2.2.2\\lib\\jodconverter-cli-2.2.2.jar";
	static String TesseractPath = "D:\\Tesseract-OCR\\tesseract.exe";
	static String OpenOfficeInitCommand = " -headless -accept=\"socket,host=127.0.0.1,port=8100;urp;\" -nofirststartwizard";
	static String OpenOfficePath = "\"D:\\OpenOffice4.1.1\\program\\soffice\"";

	@RequestMapping(value = "/list_all_documents", method = RequestMethod.POST)
	public @ResponseBody String previewEfs(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		StencilServices service = new StencilServices();
		return service.listAllDocuments(JSONData);
	}

	@RequestMapping(value = "/preview_efs", method = RequestMethod.POST)
	public @ResponseBody String listAllDocuments(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		StencilServices service = new StencilServices();
		return service.previewEfs(JSONData);
	}

	@RequestMapping(value = "/GetFieldsList", method = RequestMethod.POST)
	public @ResponseBody String GetFieldsForIndustry() {
		XML xml = new XML();
		JSONObject obj = XML.toJSONObject(
				"<?xml version=\"1.0\" encoding=\"UTF-8\"?><fields><field><name>Invoice_No</name></field><field><name>Invoice_No_Label</name></field><field><name>Invoice_Date</name></field><field><name>Invoice_Date_Label</name></field><field><name>Order_Date</name></field><field><name>Order_Date_Label</name></field><field><name>Order_No</name></field><field><name>Order_No_Label</name></field><field><name>Grand_Total</name></field><field><name>Grand_Total_Label</name></field><field> <name>Supplier_Name</name></field><field> <name>Supplier_Name_Label</name></field><field><name>Supplier_Address</name></field><field><name>Supplier_Address_Label</name></field><field><name>Supplier_City</name></field><field><name>Supplier_City_Label</name></field><field><name>Supplier_County</name></field><field><name>Supplier_County_Label</name></field><field><name>Supplier_State</name></field><field><name>Supplier_State_Label</name></field><field><name>Supplier Zip</name></field><field><name>Supplier_Zip_Label</name></field><field><name>Buyer_Name</name></field><field><name>Buyer_Name_Label</name></field><field><name>BillTo_Address</name></field><field><name>BillTo_Address_Label</name></field><field><name>BillTo_City</name></field><field><name>BillTo_City_Label</name></field><field><name>BillTo_County</name></field><field><name>BillTo_County</name></field><field><name>BillTo_State</name></field><field><name>BillTo_State_Label</name></field><field><name>BillTo_Zip</name></field><field><name>BillTo_Zip_Label</name></field><field><name>ShipTo Address</name></field><field><name>ShipTo_Address_Label</name></field><field><name>ShipTo City</name></field><field><name>ShipTo_City_Label</name></field><field><name>ShipTo County</name></field><field><name>ShipTo_County_Label</name></field><field><name>ShipTo_State</name></field><field><name>ShipTo_State_Label</name></field><field><name>ShipTo_Zip</name></field><field><name>ShipTo_Zip_Label</name></field><field><name>ItemId</name></field><field><name>ItemId_Label</name></field><field><name>Description</name></field><field><name>Description_Label</name></field><field><name>Quantity</name></field><field><name>Quantity_Label</name></field><field><name>Discounts</name></field><field><name>Discounts_Label</name></field><field><name>LineTotal</name></field><field><name>LineTotal_Label</name></field></fields>");
		return obj.toString();
	}

	@RequestMapping(value = "/generate_stencil", method = RequestMethod.POST)
	public @ResponseBody String generate_stencil(@RequestBody String JSONData) {
		try {
			StencilServices stencil = new StencilServices();
			org.json.simple.JSONObject json = (org.json.simple.JSONObject) new JSONParser().parse(JSONData);
			String file_path = json.get("file_path").toString();
			String relativePath = "src/web/client";

			/**
			 * Do OCR
			 */
			// System.out.println("image path
			// "+relativePath+file_path.substring(file_path.indexOf("/images"),file_path.length()));
			// String pdfFile=ImageProcessesingServices.getFullOCR(new
			// File(relativePath+file_path.substring(file_path.indexOf("/images"),file_path.length())));
			// System.out.println("Pdf Path "+pdfFile);
			// String pdfFile="image/invoice_1.pdf";

			System.out.println("File Path " + file_path.substring(file_path.indexOf("/images"), file_path.length()));

			ArrayList<ArrayList> stencil_output = stencil.generate_stencil(JSONData);
			Gson gson = new Gson();
			String StencilData = gson.toJson(stencil_output.get(0).get(0));
			String customerDetails = gson.toJson(stencil_output.get(1).get(0));
			Stencil stencilObj = gson.fromJson(StencilData, Stencil.class);
			EmailNotification notify = gson.fromJson(customerDetails, EmailNotification.class);
			String StencilLocation = stencilObj.geteFS_XSD_location();
			String FileLocation = stencilObj.getFile_location();
			int i = StencilLocation.lastIndexOf("/images/");
			StencilLocation = StencilLocation.substring(i, StencilLocation.length());
			StencilLocation = StencilLocation.replace("/", "\\");
			StencilLocation = relativePath + "" + StencilLocation;

			/**
			 * extract the data from seachable Pdf
			 */
			String pdfFile = relativePath + file_path.substring(file_path.indexOf("/images"), file_path.length());

			String imageFile = pdfFile;
			pdfFile = pdfFile.substring(0, pdfFile.lastIndexOf(".")) + ".pdf";

			System.out.println("Pdf File IS " + pdfFile);
			// String
			// fileName=pdfFile.toString().substring(pdfFile.toString().lastIndexOf("\\"),
			// pdfFile.toString().lastIndexOf("."));
			// System.out.println("fileName"+fileName);
			String jsonFile = XMLtoJsonConverter.convertXMLToJson(StencilLocation);
			System.out.println("The json file is ====== >" + jsonFile);

			org.json.simple.JSONObject demo = null;
			try {
				demo = ReadJson.jsonHandler(jsonFile, pdfFile,imageFile);
				System.out.println("Json IS==" + demo.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}

			// return StencilLocation;
			int j = FileLocation.lastIndexOf("/images/");
			FileLocation = FileLocation.substring(j, FileLocation.length());
			FileLocation = FileLocation.replace("/", "\\");
			FileLocation = relativePath + "" + FileLocation;
			System.out.println("middle");

			ProcessStencil ps;
			String sXmlContent = "";
			System.out.println("dfdf");
			// if( FileLocation.toLowerCase().trim().endsWith(".tif")||
			// FileLocation.toLowerCase().trim().endsWith(".jpg")){
			// ps = new ProcessStencil(FileLocation, StencilLocation,
			// TesseractPath, JodConverterPath);
			// sXmlContent = ps.StartProcessing();
			// }
			// String folderName=FileLocation.split("\\.")[0];
			// File index = new File(folderName);
			// String[]entries = index.list();
			// for(String s: entries){
			// File currentFile = new File(index.getPath(),s);
			// currentFile.delete();
			// }
			// System.out.println("df"+sXmlContent);
			// index.delete();
			// XML xml = new XML();
			// JSONObject json_obj = XML.toJSONObject(sXmlContent);
			String body = "Your image had processed by hethi";
			String subject = "Notification from hethi";
			String filename = "";
			// EmailNotificationService service=new EmailNotificationService();
			// boolean result=service.sendMail(notify.getBusiness_email(),
			// subject, body, filename);
			System.out.println("hareesh " + demo.toString());

			return demo.toString();

		} catch (Exception e) {
			// e.printStackTrace();
			// return org.json.simple.JSONObject;
		}
		return null;
	}

	@RequestMapping(value = "/save_stencil_data", method = RequestMethod.POST)
	public @ResponseBody String saveStencilData(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException {
		StencilServices service = new StencilServices();
		return service.saveStencilData(JSONData);
	}

	@RequestMapping(value = "/save_mxml_data", method = RequestMethod.POST)
	public @ResponseBody String saveMxmlData(@RequestBody String JSONData) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, ParseException, SQLException, IOException {
		StencilServices service = new StencilServices();
		return service.saveMxmlData(JSONData);
	}

	@RequestMapping(value = "/create_form_lookup_table", method = RequestMethod.POST)
	public @ResponseBody String createFormLookUpTable(@RequestBody String JSONData)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, ParseException, SQLException,
			NotFoundException, CannotCompileException, IOException {
		StencilServices service = new StencilServices();
		return service.createFormLookUpTable(JSONData);
	}

	@RequestMapping(value = "/save_mxsd", method = RequestMethod.POST)
	public @ResponseBody String saveMxsd(@RequestBody String JSONData)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, ParseException, SQLException,
			NotFoundException, CannotCompileException, IOException {
		StencilServices service = new StencilServices();
		return service.saveMxsd(JSONData);
	}
	
	@RequestMapping(value = "/preview_by_form", method = RequestMethod.POST)
	public @ResponseBody String preview_by_form(@RequestBody String JSONData) {
		try {
			StencilServices stencil = new StencilServices();
			org.json.simple.JSONObject json = (org.json.simple.JSONObject) new JSONParser().parse(JSONData);
			String file_path = json.get("file_path").toString();
			String relativePath = "src/web/client";

			/**
			 * Do OCR
			 */
			// System.out.println("image path
			// "+relativePath+file_path.substring(file_path.indexOf("/images"),file_path.length()));
			// String pdfFile=ImageProcessesingServices.getFullOCR(new
			// File(relativePath+file_path.substring(file_path.indexOf("/images"),file_path.length())));
			// System.out.println("Pdf Path "+pdfFile);
			// String pdfFile="image/invoice_1.pdf";

			System.out.println("File Path " + file_path.substring(file_path.indexOf("/images"), file_path.length()));

			ArrayList<ArrayList> stencil_output = stencil.preview_by_form(JSONData);
			Gson gson = new Gson();
			String StencilData = gson.toJson(stencil_output.get(0).get(0));
			Stencil stencilObj = gson.fromJson(StencilData, Stencil.class);
			String StencilLocation = stencilObj.geteFS_XSD_location();
			String FileLocation = file_path;
			int i = StencilLocation.lastIndexOf("/images/");
			StencilLocation = StencilLocation.substring(i, StencilLocation.length());
			StencilLocation = StencilLocation.replace("/", "\\");
			StencilLocation = relativePath + "" + StencilLocation;

			/**
			 * extract the data from seachable Pdf
			 */
			String pdfFile = relativePath + file_path.substring(file_path.indexOf("/images"), file_path.length());

			String imageFile = pdfFile;
			pdfFile = pdfFile.substring(0, pdfFile.lastIndexOf(".")) + ".pdf";

			System.out.println("Pdf File IS " + pdfFile);
			// String
			// fileName=pdfFile.toString().substring(pdfFile.toString().lastIndexOf("\\"),
			// pdfFile.toString().lastIndexOf("."));
			// System.out.println("fileName"+fileName);
			String jsonFile = XMLtoJsonConverter.convertXMLToJson(StencilLocation);
			System.out.println("The json file is ====== >" + jsonFile);

			org.json.simple.JSONObject demo = null;
			try {
				demo = ReadJson.jsonHandler(jsonFile, pdfFile,imageFile);
				System.out.println("Json IS==" + demo.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}

			// return StencilLocation;
			int j = FileLocation.lastIndexOf("/images/");
			FileLocation = FileLocation.substring(j, FileLocation.length());
			FileLocation = FileLocation.replace("/", "\\");
			FileLocation = relativePath + "" + FileLocation;
			System.out.println("middle");

			ProcessStencil ps;
			String sXmlContent = "";
			System.out.println("dfdf");
			// if( FileLocation.toLowerCase().trim().endsWith(".tif")||
			// FileLocation.toLowerCase().trim().endsWith(".jpg")){
			// ps = new ProcessStencil(FileLocation, StencilLocation,
			// TesseractPath, JodConverterPath);
			// sXmlContent = ps.StartProcessing();
			// }
			// String folderName=FileLocation.split("\\.")[0];
			// File index = new File(folderName);
			// String[]entries = index.list();
			// for(String s: entries){
			// File currentFile = new File(index.getPath(),s);
			// currentFile.delete();
			// }
			// System.out.println("df"+sXmlContent);
			// index.delete();
			// XML xml = new XML();
			// JSONObject json_obj = XML.toJSONObject(sXmlContent);
			String body = "Your image had processed by hethi";
			String subject = "Notification from hethi";
			String filename = "";
			// EmailNotificationService service=new EmailNotificationService();
			// boolean result=service.sendMail(notify.getBusiness_email(),
			// subject, body, filename);
			System.out.println("hareesh " + demo.toString());

			return demo.toString();

		} catch (Exception e) {
			// e.printStackTrace();
			// return org.json.simple.JSONObject;
		}
		return null;
	}


}
