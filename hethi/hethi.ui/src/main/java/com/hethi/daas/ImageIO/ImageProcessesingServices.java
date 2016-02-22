package com.hethi.daas.ImageIO;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.json.JSONException;
import org.json.simple.parser.ParseException;

import com.hethi.daas.OCR.JODImageProcessing;
import com.hethi.daas.OCR.OCRImageProcessing;
import com.hethi.daas.OCR.PDFImageProcessing;

import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

//import org.opencv.core.Mat;
public class ImageProcessesingServices {

	public static String getFullOCR(String filename)
			throws IOException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {
		String mimeType = "";
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		filename=currentDir+filename;
		String type = FilenameUtils.getExtension(filename);
		System.out.println("extension is " + type);
		mimeType = Magic.getMagicMatch(new File(filename), false).getMimeType();
		System.out.println("the mime is" + mimeType);

		/**
		 * To convert Office Files into Searhable PDF
		 */
		if (type.equalsIgnoreCase("doc") || type.equalsIgnoreCase("docX") || type.equalsIgnoreCase("xls")
				|| type.equalsIgnoreCase("xlsx") || type.equalsIgnoreCase("txt") || type.equalsIgnoreCase("odt")) {
			JODImageProcessing.convertOfficeToPdf(filename);
			System.out.println("Office To SearchablePDF Created Successfully");
		}

		/**
		 * To convert GIF Files into Searhable PDF
		 */

		/*else if (mimeType.equals("image/gif")) {

			convertGIFToTiff(filename);
			mimeType = OCRImageProcessing.getSearchablePDF(filename);
			System.out.println("GIF To SearchablePDF Created Successfully");

			System.out.println(mimeType);

		}*/

		/**
		 * To convert ScannedPDF Files into Searhable PDFs
		 */

		/*
		  else if(mimeType.equals("appication/pdf")){ File
		  file=PDFImageProcessing.convertScannedPDFToTiff(filename);
		  BufferedImage bimage=ImageIO.read(file);
		  mimeType=OCRImageProcessing.getSearchablePDF(file.toString());
		  System.out.println("ScannedPDF To SearchablePDF Created Successfully"
		  ); }*/
		 

		else {
			mimeType = OCRImageProcessing.getSearchablePDF(filename);
			System.out.println("Image To SearchablePDF Created Successfully");
		}
		return mimeType;
	}

	public static void convertGIFToTiff(File inputFile) {

	}

	
	
	
	public static void main(String args[]) throws IOException, MagicParseException, MagicMatchNotFoundException,
			MagicException, TesseractException, ParseException, JSONException {

		// ImageProcessesingServices imgProcess=new ImageProcessesingServices();

		/**
		 * OCR
		 */

		/**
		 * 
		 * @processImage(string imageFileLocation) return
		 * imageFile(StandanrdSize)
		 * 
		 */
		String filePath = "D:/CloudPrint/";

		String inputpdfFile = ImageProcessesingServices.getFullOCR("vis6016564511235580755.pdf");

		/*try {
			Thread.sleep(20000);
		} catch (InterruptedException ie) {
			// Handle exception
		}
*/
		//System.out.println("input pdf file   ===== > " + inputpdfFile);

		/**
		 * Extraction
		 * 
		 */
		
		/*String inputpdfFile="sample_4.pdf";
		
		
		// String inputpdfFile="image/invoice_1.pdf";
		String inputJsonFile = "mxml.json";
		ReadJson.jsonHandler(inputJsonFile, inputpdfFile,"new.jpg");
		System.out.println("The Extraction completed successfully...");*/
		
	}

}
