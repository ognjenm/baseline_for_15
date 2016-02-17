package com.hethi.daas;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import net.sourceforge.tess4j.ITesseract.RenderedFormat;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

public class OCRImageProcessing {

	public static String getSearchablePDF(String inputfile) throws TesseractException {
		Tesseract tessaractInstance = Tesseract.getInstance();
		List<RenderedFormat> list = new ArrayList<RenderedFormat>();
		
		Properties properties = new Properties();
		try {
			/*File currentDirFile = new File(".");
			String helper = currentDirFile.getAbsolutePath();
			String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');*/
			properties.load(new FileInputStream(new File("src/main/resources/config/application.properties")));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("TESSDATA PATH"+properties.getProperty("tessdataPath"));
		list.add(RenderedFormat.PDF);
		//list.add(RenderedFormat.HOCR);
		tessaractInstance.setLanguage("eng");
		tessaractInstance.setDatapath(properties.getProperty("tessdataPath"));
		String outfileLocation = inputfile.substring(0, inputfile.lastIndexOf("/"));
		String fileName = inputfile.substring(inputfile.lastIndexOf("/"),
				inputfile.lastIndexOf("."));
		try{
		tessaractInstance.createDocuments(inputfile, outfileLocation + fileName, list);
		}
		catch(TesseractException te){
			System.out.println(te);
			
			
		}
		System.out.println("The output pdf path is : ====== >  " + outfileLocation + fileName + ".pdf");
		return outfileLocation + fileName + ".pdf";
	}

	/*
	 * public static String getSearchablePDF(File inputfile) throws
	 * TesseractException{ // Properties prop = new Properties(); // InputStream
	 * input = null; // File currentDirFile = new File("."); // String helper =
	 * currentDirFile.getAbsolutePath(); // String currentDir =
	 * helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/'); // input
	 * = new
	 * FileInputStream(currentDir+"src/main/resources/application.properties");
	 * ////
	 * getClass().getClassLoader().getResourceAsStream("application.properties")
	 * ; // // // load a properties file // prop.load(input); // String url =
	 * prop.getProperty("tessdataPath"); Tesseract tessaractInstance =
	 * Tesseract.getInstance();
	 * 
	 * List<RenderedFormat> list = new ArrayList<RenderedFormat>();
	 * list.add(RenderedFormat.PDF); list.add(RenderedFormat.HOCR);
	 * tessaractInstance.setLanguage("eng");
	 * 
	 * tessaractInstance.setDatapath(
	 * "D:\\Workspace/source/samad/hethi.com/daas/tessdata"); java.util.Date
	 * date= new java.util.Date(); //System.out.println(
	 * "the timeStamp is ==== > "+date.getTime()); String
	 * outfileLocation="E:\\SAMPLE\\SampleFiles\\Output\\imageToPDF_DPI\\400\\"+
	 * date.getTime(); //System.out.println(
	 * "The file stored @  E:\\SAMPLE\\SampleFiles\\Output\\ImageToPDF\\Example_002-tiff.pdf"
	 * );
	 * //tessaractInstance.createDocuments(inputfile.toString(),outfileLocation,
	 * list);
	 * outfileLocation=inputfile.toString().substring(inputfile.toString().
	 * lastIndexOf("/"), inputfile.toString().lastIndexOf("."));
	 * tessaractInstance.createDocuments(inputfile.toString(),inputfile.toString
	 * ().substring(inputfile.toString().lastIndexOf("/"),
	 * inputfile.toString().lastIndexOf(".")), list); System.out.println(
	 * " the pdf path is ====== >"
	 * +inputfile.toString().substring(inputfile.toString().lastIndexOf("/"),
	 * inputfile.toString().lastIndexOf("."))); return outfileLocation+".pdf"; }
	 */

	/*
	 * 
	 * public static void getStencilPDF(String xmlFile) throws
	 * TesseractException{ Tesseract tessaractInstance =
	 * Tesseract.getInstance(); List<RenderedFormat> list = new
	 * ArrayList<RenderedFormat>(); list.add(RenderedFormat.PDF);
	 * tessaractInstance.setLanguage("eng"); tessaractInstance.setDatapath(
	 * "E:\\mani\\Workspace\\DaaS\\HethiEngine\\tessdata"); System.out.println(
	 * "The file stored @  E:\\SAMPLE\\SampleFiles\\Output\\ImageToPDF\\Example_002-tiff.pdf"
	 * ); //tessaractInstance.createDocuments(inputfile.toString(),
	 * "E:\\SAMPLE\\SampleFiles\\Output\\ImageToPDF\\Example_002-tiff", list); }
	 */

}
