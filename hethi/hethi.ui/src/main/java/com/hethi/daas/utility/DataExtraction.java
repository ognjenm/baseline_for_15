package com.hethi.daas.utility;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.Renderer;

import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.pdfbox.util.PDFTextStripperByArea;
import org.json.simple.parser.ParseException;

import com.hethi.daas.hocr.ReadHocr;
import com.hethi.daas.model.Span;
import com.recognition.software.jdeskew.ImageDeskew;

import net.sourceforge.tess4j.*;
import net.sourceforge.tess4j.ITessAPI.TessPageSegMode;
import net.sourceforge.tess4j.ITesseract.RenderedFormat;

public class DataExtraction {
	
	
	public static String pdftoText(int x1, int y1, int x2, int y2,String pdfFile) {
		String lValue = null;
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
			Rectangle rect = new Rectangle(x1, y1, x2-x1, y2-y1);
			stripper.addRegion("class1", rect);
			List allPages = pdDoc.getDocumentCatalog().getAllPages();
			PDPage firstPage = (PDPage) allPages.get(0);
			stripper.extractRegions(firstPage);
			//System.out.println("Text in the area:" + rect);
			lValue = stripper.getTextForRegion("class1");
			//System.out.println(stripper.getTextForRegion("class1"));

			 String parsedText = pdfStripper.getText(pdDoc);
			 //System.out.print("The page is "+parsedText);
			 System.out.println("--------------------");
			 System.out.println(" "+x1+"  "+y1+"  "+x2+" "+y2 );
			System.out.print("the value is\n-------------- : \n"+lValue);
			System.out.println("--------------------");
			
		}

		catch (IOException e) {

			e.printStackTrace();
		}
		
		return lValue;

	}
	
	
	
	public static String  getFullOcr(String imagePath,int x1,int y1,int x2,int y2) throws TesseractException {
		
		
		File imageFile = new File(imagePath);
        Tesseract instance = new Tesseract();  // JNA Interface Mappig
        instance.setDatapath("D:\\Dependency\\OCR\\tessdata");
       // int mode=100;
       // TessPageSegMode.PSM_SINGLE_BLOCK;
        
        
        List<RenderedFormat> list = new ArrayList<RenderedFormat>();
		//list.add(RenderedFormat.TEXT);
		list.add(RenderedFormat.PDF);
		list.add(RenderedFormat.HOCR);
		list.add(RenderedFormat.BOX);
		
		
		String outfilelocation = imagePath.substring(0,imagePath.lastIndexOf("."));
		//String fileName = imagePath.substring(imagePath.lastIndexOf("/"),imagePath.lastIndexOf("."));
		
		//String outfilelocation=imagePath.lastIndexOf(".")
		
        //instance.createDocuments(imageFile.toString(), outfilelocation+fileName, list); 
		
		
        // Tesseract1 instance = new Tesseract1(); // JNA Direct Mapping
		System.out.println("in ocr method");
		Rectangle rect =new Rectangle(x1, y1, x2-x1, y2-y1);
        try {
            String result = instance.doOCR(imageFile,rect);
            System.out.println(result);
        } catch (TesseractException e) {
            System.err.println(e.getMessage());
        }
		//System.out.println("OCR Completed ");
		return "";
	}
	
	

	public void checkExtract(List<Span> positionList) throws TesseractException{
		
		for (Span span : positionList) {
 			String pos=span.getTitle();
 			
 			String []array=pos.split(",");
 			
 			int x1=Integer.parseInt(array[0]);
 			int y1=Integer.parseInt(array[1]);
 			int x2=Integer.parseInt(array[2]);
 			int y2=Integer.parseInt(array[3]);
 			//DataExtraction.pdftoText(x1, y1, x2, y2, PdfFile);
 			 DataExtraction.getFullOcr("resource\\Image\\new.jpg",x1,y1,x2-x1,y2-y1);
 			
 		}
		
	}
	
    public static void main(String[] args) throws TesseractException, FileNotFoundException, ParseException, IOException {
    	
    	
    	// DataExtraction.getFullOcr("resource\\Image\\new.jpg");
    	/* String hocr="resource//newhocr.json";
    	 
    	 List<Span> positionList=ReadHocr.parseHocr(hocr);
    	 DataExtraction dataExtraction=new DataExtraction();
    	 dataExtraction.checkExtract(positionList);*/
 		
 		//DataExtraction.getFullOcr("resource\\Image\\new.jpg", 228,827,239-228,840-827);
                
       // DataExtraction.pdftoText(80,139,494,209, "output//slide_90.pdf");
        //42,219,349,36
        //219,42,36,349
    	 DataExtraction.getFullOcr("multipage-pdf_merged.tiff",207,277,675,243);
        System.out.println("Extraction completed ");
        
    }
    
 
}
