package com.hethi.rest.utility;

import java.awt.Rectangle;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.pdfbox.util.PDFTextStripperByArea;

import net.sourceforge.tess4j.util.PdfUtilities;

public class PDFUtility {
	String PDFRepository="D:/PDF/Multipage/Searchable/";
   
	
	public boolean isScannedPDF(String pdfFile) {
		
		boolean status=false;
		try {
			PDFTextStripper pdfStripper = new PDFTextStripper();
			PDFParser parser = new PDFParser(new FileInputStream(new File(pdfFile)));
			parser.parse();
			COSDocument cosDoc = parser.getDocument();
			PDDocument pdDoc = new PDDocument(cosDoc);
			String parsedText = pdfStripper.getText(pdDoc);
			System.out.println("TEXT == "+parsedText);
			if(parsedText.trim().isEmpty()){
				System.out.println("This is SCANNED Pdf");
				status=true;
			}
			else{
				System.out.println("This is SEARCHABLE Pdf");
				status=false;
			}
		}

		catch (IOException e) {

			e.printStackTrace();
		}

		return status;

	}

	
	/**
	 * Merge PDF Files 
	 */
	
    public void mergePdf() {
        //logger.info("mergePdf");
        File pdfPartOne = new File(PDFRepository, "vis5547564886770435693_searchable.pdf");
        File pdfPartTwo = new File(PDFRepository, "vis5825550744716222565_searchable.pdf");
        File pdfPartThree = new File(PDFRepository, "vis6016564511235580755_searchable.pdf");
        int expResult = 6;
        File outputPdfFile = new File("pdf/multipage-pdf_merged.pdf");
        File[] inputPdfFiles = {pdfPartOne, pdfPartTwo,pdfPartThree};
        PdfUtilities.mergePdf(inputPdfFiles, outputPdfFile);
        System.out.println("File created Successfully");
       // assertEquals(expResult, PdfUtilities.getPdfPageCount(outputPdfFile));
    }
    
    
    
    public void testMergePdf() {
        //logger.info("mergePdf");
        File pdfPartOne = new File(PDFRepository, "vis5547564886770435693_searchable.pdf");
        File pdfPartTwo = new File(PDFRepository, "vis5825550744716222565_searchable.pdf");
        File pdfPartThree = new File(PDFRepository, "vis6016564511235580755_searchable.pdf");
        int expResult = 6;
        File outputPdfFile = new File("pdf/multipage-pdf_merged.pdf");
        File[] inputPdfFiles = {pdfPartOne, pdfPartTwo,pdfPartThree};
        PdfUtilities.mergePdf(inputPdfFiles, outputPdfFile);
        System.out.println("File created Successfully");
       // assertEquals(expResult, PdfUtilities.getPdfPageCount(outputPdfFile));
    }
    
    
    /**
     * 
     * 
     *
     */
    
    
    public String extractTextFromPDF(int x1, int y1, int y2, int x2, String pdfFile) {
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
			String parsedText = pdfStripper.getText(pdDoc);
			System.out.println(parsedText);
		}

		catch (IOException e) {

			e.printStackTrace();
		}

		return data;

	}
    
    
    
    /*public String extractTextByPDFArea(int x1, int y1, int x2, int y2 , String pdfFile) {
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
			System.out.println("Text in the area:" + rect);
			lValue = stripper.getTextForRegion("class1");
			System.out.println("the value is === > " + stripper.getTextForRegion("class1"));

			// String parsedText = pdfStripper.getText(pdDoc);
			// System.out.println(parsedText);
		}

		catch (IOException e) {

			e.printStackTrace();
		}

		return lValue;

	}*/
    
    
    
    public String extractTextByPDFArea(int x1, int y1, int x2, int y2 , String pdfFile,int pageno) {
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
			PDPage firstPage = (PDPage) allPages.get(pageno);
			stripper.extractRegions(firstPage);
			System.out.println("Text in the area:" + rect);
			lValue = stripper.getTextForRegion("class1");
			System.out.println("the value is === > " + stripper.getTextForRegion("class1"));
		/*	if(!lValue.isEmpty()){
				lValue=lValue+","+pageno;
			}*/

			// String parsedText = pdfStripper.getText(pdDoc);
			// System.out.println(parsedText);
		}

		catch (IOException e) {

			e.printStackTrace();
		}

		return lValue;

	}
    
    
    
    
    

    public static void main(String args[]) {
    	
		PDFUtility pdfUtility=new PDFUtility();
		pdfUtility.testMergePdf();
	}
	
	
	
}
