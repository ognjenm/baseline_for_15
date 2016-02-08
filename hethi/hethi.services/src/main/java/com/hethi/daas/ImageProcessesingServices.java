package com.hethi.daas;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FilenameUtils;
import org.springframework.util.MimeType;

import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

//import org.opencv.core.Mat;
public class ImageProcessesingServices {

	public static String getFullOCR(File filename)
			throws IOException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {
		String mimeType = "";
		String type = FilenameUtils.getExtension(filename.toString());
		System.out.println("extension is " + type);
		mimeType = Magic.getMagicMatch(filename, false).getMimeType();
		System.out.println("the mime is" + mimeType);

		/**
		 * To convert Office Files into Searhable PDF
		 */
		
		if (type.equalsIgnoreCase("doc") || type.equalsIgnoreCase("docX") || type.equalsIgnoreCase("xls")
				|| type.equalsIgnoreCase("xlsx") || type.equalsIgnoreCase("txt") || type.equalsIgnoreCase("odt")) {
			JODImageProcessing.convertOfficeToPdf(filename.toString());
			System.out.println("Office To SearchablePDF Created Successfully");
		}

		/**
		 * To convert GIF Files into Searhable PDF
		 */

		else if (mimeType.equals("image/gif")) {

			convertGIFToTiff(filename);
			mimeType = OCRImageProcessing.getSearchablePDF(filename);
			System.out.println("GIF To SearchablePDF Created Successfully");

			System.out.println(mimeType);

		}

		/**
		 * To convert ScannedPDF Files into Searhable PDFs
		 */

		/*
		 * else if(mimeType.equals("appication/pdf")){ File
		 * file=PDFImageProcessing.convertScannedPDFToTiff(filename);
		 * mimeType=OCRImageProcessing.getSearchablePDF(file);
		 * System.out.println("ScannedPDF To SearchablePDF Created Successfully"
		 * ); }
		 */

		else {
			mimeType = OCRImageProcessing.getSearchablePDF(filename);
			System.out.println("Image To SearchablePDF Created Successfully");
		}
		return mimeType;
	}

	public static void convertGIFToTiff(File inputFile) {

	}

	
	
	
/*	public static void main(String args[]) throws IOException, MagicParseException, MagicMatchNotFoundException,
			MagicException, TesseractException, ParseException, JSONException {

		// ImageProcessesingServices imgProcess=new ImageProcessesingServices();

		*//**
		 * OCR
		 *//*

		*//**
		 * 
		 * @processImage(string imageFileLocation) return
		 *                      imageFile(StandanrdSize)
		 * 
		 *//*
		String filePath = "D:/CloudPrint/";

		String inputpdfFile = ImageProcessesingServices.getFullOCR(new File("image/invoice_1.jpg"));

		try {
			Thread.sleep(20000);
		} catch (InterruptedException ie) {
			// Handle exception
		}

		System.out.println("input pdf file   ===== > " + inputpdfFile);

		*//**
		 * Extraction
		 * 
		 *//*

		// String inputpdfFile="image/invoice_1.pdf";
		String inputJsonFile = "json\\Example_002-json.json";
		ReadJson.jsonHandler(inputJsonFile, inputpdfFile);
		System.out.println("The Extraction completed successfully...");
		
	}*/

}
