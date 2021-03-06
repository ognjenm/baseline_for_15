package com.hethi.daas.Mapping;



import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;

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

import com.hethi.daas.utility.DataExtraction;
import com.hethi.rest.utility.XMLtoJsonConverter;
import com.lowagie.text.pdf.PdfReader;

import net.sourceforge.tess4j.TesseractException;



public class ReadJson {
	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws FileNotFoundException, IOException, ParseException, JSONException {
		ReadJson readJson = new ReadJson();
		/*String imageFullPath="D:/Feb_11/invoice_1.jpg";
		String pdfFullPath="D:/Feb_11/invoice_1.pdf";
		String json=XMLtoJsonConverter.convertXMLToJson("C:/Users/Lap181/Desktop/demo_1_copy.xml");
		readJson.jsonHandler(json,pdfFullPath,imageFullPath);*/
		
		
		//readJson.extractFullPDF("vis4931907328777416161.pdf");

	}

	public static JSONObject jsonHandler(String jsonFile,String pdfFile,String imagefile) throws FileNotFoundException, IOException, ParseException, JSONException, TesseractException {
		
		
		/**
		 * 					~~~~~~~~~~~~~~~~~~~~~~~~~~~
		 * 						mxml Object Tree Model
		 * 					~~~~~~~~~~~~~~~~~~~~~~~~~~~
		 * 
		 * 							-----------
		 * 						    	mxsd		
		 * 							-----------
		 *            -------------					------------
		 * 				business                  		form
		 * 			  -------------					------------
		 * 
		 * 									 -----------	--------	---------
		 * 										header        body       footer
		 * 									 -----------    --------    ---------
		 * 
		 * 
		 * 
		 * 
		 * 									
		 */
		
		

		/**
		 * JsonObject Parsing
		 */
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(jsonFile);
		JSONObject json_rootObj = (JSONObject) obj;
		JSONObject mxsd_json_rootObj = (JSONObject) json_rootObj.get("mxsd");
		JSONObject business_json_rootObj = (JSONObject) mxsd_json_rootObj.get("efsuin_demography");
		JSONObject form_json_rootObj = (JSONObject) mxsd_json_rootObj.get("efsuin_form");
		//JSONObject ufsuin_json_rootObj = (JSONObject) form_json_rootObj.get("efsuin");
		JSONObject json_headerObj;
		JSONObject json_bodyObj;
		JSONObject json_footerObj;
		
		if (form_json_rootObj.get("page") instanceof JSONObject) {
			JSONObject json_page_Obj = (JSONObject) form_json_rootObj.get("page");
			json_headerObj = (JSONObject) json_page_Obj.get("header");
			json_bodyObj = (JSONObject) json_page_Obj.get("body");
			json_footerObj = (JSONObject) json_page_Obj.get("footer");
			fieldHandler(json_headerObj,pdfFile,imagefile);
			fieldHandler(json_bodyObj,pdfFile,imagefile);
			fieldHandler(json_footerObj,pdfFile,imagefile);
		}
		else if (form_json_rootObj.get("page") instanceof JSONArray) {
			JSONArray json_PageArray = (JSONArray) form_json_rootObj.get("page");

			for (int p = 0; p < json_PageArray.size(); p++) {
				JSONObject json_page_Obj = (JSONObject) json_PageArray.get(p);
				json_headerObj = (JSONObject) json_page_Obj.get("header");
				json_bodyObj = (JSONObject) json_page_Obj.get("body");
				json_footerObj = (JSONObject) json_page_Obj.get("footer");				
				fieldHandler(json_headerObj,pdfFile,imagefile);
				fieldHandler(json_bodyObj,pdfFile,imagefile);
				fieldHandler(json_footerObj,pdfFile,imagefile);
			}
		}
		/**
		 * field manipulation
		 * 
		 */
		
		

		System.out.println("The MXMl data is  ========================== >  "+json_rootObj.toString());
		return json_rootObj;

	}

	/**
	 * 
	 * @param obj
	 * @return position interms of string
	 * @throws JSONException
	 */

	public static String extractPosition(JSONObject obj) throws JSONException {
		String position = "";
		String pos_attr[] = { "top", "left", "width", "height" };
		for (int i = 0; i < pos_attr.length; i++) {
			position += String.valueOf( obj.get(pos_attr[i])) + ",";
		}
		
		if(position.equalsIgnoreCase(",,,,")){
			position="0,0,0,0,";
		}
		System.out.println("position is ====== > "+position);
		return position.substring(0, position.length() - 1);
	}

	/**
	 * 
	 * @param substring
	 * @return Fetched value from PDF(with coordinates)
	 * @throws JSONException
	 * @throws IOException 
	 */

	
	
	public static String extractData(String substring,String fieldType,String pdfFile,String imageFile) throws JSONException, IOException, TesseractException {
  String[] array = substring.split(",");
  
  /**
   * standardize image size irrespective of stencil image
   * 
   */
  
  PdfReader reader = new PdfReader(pdfFile);
  com.lowagie.text.Rectangle cropbox = reader.getCropBox(1); 
  System.out.println("PDFWidth"+cropbox.getWidth());
  System.out.println("PDFHeight"+cropbox.getHeight());
  BufferedImage bimg1 = ImageIO.read(new File(imageFile));
  System.out.println("IMAGEWidth"+bimg1.getWidth());
  System.out.println("IMAGEHeight"+bimg1.getHeight());
//  BufferedImage bimg = ImageIO.read(new File(imageFile));
//  int imgwidth          = bimg.getWidth();
//  int imgheight         = bimg.getHeight();
  int imgwidth          = (int) cropbox.getWidth();
  int imgheight         = (int) cropbox.getHeight();
  float varWidth=imgwidth;
  float varHeight=imgheight;
  float x1 = (float) (varWidth/876.0*Integer.parseInt(array[0]));
  float y1 = (float) (varHeight/900.0*Integer.parseInt(array[1]));
  float x2 = (float) (varWidth/876.0*Integer.parseInt(array[2]));
  float y2 = (float) ((varHeight/900.0)*Integer.parseInt(array[3]));
//  float x1 = (float) (Integer.parseInt(array[0]));
//  float y1 = (float) (Integer.parseInt(array[1]));
//  float x2 = (float) (Integer.parseInt(array[2]));
//  float y2 = (float) (Integer.parseInt(array[3]));
  System.out.println(x1+" "+y1+" "+x2+" "+y2);
  int left=(int) x1;
  int top=(int) y1;
  int width=(int) x2;
  int height=(int) y2;
  
  String data="";
  if(fieldType.equalsIgnoreCase("lineItem")){
   //TableExtract tbext=new TableExtract();
   //data=tbext.getTableValue(top,left,height,width,pdfFile);
  }
  
  else if(fieldType.equalsIgnoreCase("1Dbarcode field")||fieldType.equalsIgnoreCase("2DQRcode")||fieldType.equalsIgnoreCase("3DQRcode")){
   System.out.println("BARCODE Reader Called");
   PdDocumentBarcodeScanner scanner=new PdDocumentBarcodeScanner();
   data=scanner.extractBarcode(pdfFile);
   System.out.println("BARCODE Reader data is ==== > "+data);
   
  }
  
  else{
//   DataExtraction de=new DataExtraction();
//   data =de.getTextFromImage(imageFile, left, top, width,height);
   

   data = extractTextFromPDF(left, top, height,width, pdfFile);
  }
  return data;
 }

	/**
	 * 
	 * @param obj
	 * @throws JSONException
	 * @throws IOException 
	 * @throws TesseractException 
	 * 
	 */

	
	public static void dataFix(JSONObject obj,String PDFPath,String imagePath) throws JSONException, IOException, TesseractException{
		JSONObject json_field_dataObj = (JSONObject) obj.get("data");
		JSONObject json_field_data_positionObj = (JSONObject) json_field_dataObj.get("position");
		JSONObject json_field_labelObj = (JSONObject) obj.get("label");
		JSONObject json_field_label_positionObj = (JSONObject) json_field_labelObj.get("position");
		
		/**
		 * Retrive data from PDF(using PDFBOX) and Tabula
		 * 
		 */
		String fieldType = (String) obj.get("type");
		json_field_dataObj.put("content", extractData(extractPosition(json_field_data_positionObj),fieldType,PDFPath,imagePath));
		json_field_labelObj.put("content", extractData(extractPosition(json_field_label_positionObj),fieldType,PDFPath,imagePath));

	}
	
	
	
	
	public static void fieldHandler(JSONObject obj, String pdfFile,String imagePath) throws JSONException, IOException, TesseractException {

		

		if (obj.get("group") instanceof JSONObject) {

			JSONObject json_group_Obj = (JSONObject) obj.get("group");

			if (json_group_Obj.get("field") instanceof JSONObject) {

				JSONObject json_field_Obj = (JSONObject) json_group_Obj.get("field");
				
				dataFix(json_field_Obj, pdfFile,imagePath);
			}

			else if (json_group_Obj.get("field") instanceof JSONArray) {

				JSONArray json_fieldArray = (JSONArray) json_group_Obj.get("field");

				for (int i = 0; i < json_fieldArray.size(); i++) {
					JSONObject json_field_Obj = (JSONObject) json_fieldArray.get(i);
					dataFix(json_field_Obj, pdfFile,imagePath);
				}
			} else {
				System.out.println("group is empty");
			}

		}

		else if (obj.get("group") instanceof JSONArray) {

			JSONArray json_GroupArray = (JSONArray) obj.get("group");

			for (int j = 0; j < json_GroupArray.size(); j++) {
				JSONObject json_group_Obj = (JSONObject) json_GroupArray.get(j);

				if (json_group_Obj.get("field") instanceof JSONObject) {

					JSONObject json_field_Obj = (JSONObject) json_group_Obj.get("field");
					dataFix(json_field_Obj, pdfFile,imagePath);
				}

				else if (json_group_Obj.get("field") instanceof JSONArray) {

					JSONArray json_fieldArray = (JSONArray) json_group_Obj.get("field");

					for (int i = 0; i < json_fieldArray.size(); i++) {
						JSONObject json_field_Obj = (JSONObject) json_fieldArray.get(i);
						dataFix(json_field_Obj, pdfFile,imagePath);
					}
				} else {
					System.out.println("group is empty");
				}

			}

		}

		
			}

	
	
	public static String extractTextFromPDF(int x1, int y1, int y2, int x2, String pdfFile) {
		String data = "";
		try {
			PDFTextStripper pdfStripper = new PDFTextStripper();
			PDFParser parser = new PDFParser(new FileInputStream(new File(pdfFile)));
			parser.parse();
			COSDocument cosDoc = parser.getDocument();
			// PDFTextStripper pdfStripper = new PDFTextStripper();
			PDDocument pdDoc = new PDDocument(cosDoc);
			PDFTextStripperByArea stripper = new PDFTextStripperByArea();
			stripper.setSortByPosition(true);
			Rectangle rect = new Rectangle(x1, y1, x2, y2);
			stripper.addRegion("class1", rect);
			List allPages = pdDoc.getDocumentCatalog().getAllPages();
			PDPage firstPage = (PDPage) allPages.get(0);
			stripper.extractRegions(firstPage);
			System.out.println("Text in the area:" + rect);
			data = stripper.getTextForRegion("class1");
			System.out.println("the value is === > " + stripper.getTextForRegion("class1"));
//			String parsedText = pdfStripper.getText(pdDoc);
//			System.out.println(parsedText);
		}

		catch (IOException e) {

			e.printStackTrace();
		}

		return data;

	}
	
	
	
	
	
	
	/*public static String applyStencilOnImage(String imagePath,int left,int top,int width,int height) throws IOException{
		BufferedImage originalImgage=ImageIO.read(new File(imagePath));
		//System.out.println("Crop Left " + cd.getColumnLeft() + ", Top " + cd.getColumnTop() + ", Width " + cd.getColumnWidth() + ", Height " + cd.getColumnHeight());
        BufferedImage SubImgage = originalImgage.getSubimage(left,top,width,height);
        String sFileName = "sample_"+left+".jpg";
        File outputfile = new File("./Temp_Images/" + sFileName);
        ImageIO.write(SubImgage, "jpg", outputfile);
        System.out.println("Image cropped successfully: "+outputfile.getPath());
        int newWidth = SubImgage.getWidth() *2;
        int newHeight = SubImgage.getHeight() *2;
        BufferedImage zoomedSubImage = new BufferedImage(newWidth, newHeight, 1);
        Graphics g = zoomedSubImage.createGraphics();
        g.drawImage(SubImgage,0,0,newWidth,newHeight,null);
        File outputzoomfile = new File("output//" +  sFileName);
        //ImageIO.write(zoomedSubImage, "jpg", outputzoomfile);   
        ImageIO.write(SubImgage, "jpg", outputzoomfile);
        // Tesseract1 instance = new Tesseract1(); // JNA Direct Mapping
        // File tessDataFolder = LoadLibs.extractTessResources("tessdata"); // Maven build bundles English data
        // instance.setDatapath(tessDataFolder.getAbsolutePath());
        File imageFile = new File("resource//output//" + sFileName);
        
        String data="";
        
        try {
            ;
            Tesseract instance = Tesseract.getInstance();  // JNA Interface Mapping
            instance.setDatapath("D:\\Dependency\\OCR\\tessdata");
            data=instance.doOCR(imageFile);
            
            System.out.print("the string  :  "+data);
           
           // imageFile.delete();
            
           } catch (TesseractException e) {
            System.err.println(e.getMessage());
           }
        return data;

	}
*/	


}