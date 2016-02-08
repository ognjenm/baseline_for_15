package com.hethi.daas.Mapping;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;

/**
 * free to use or copy
 * @author David KELLER <david.keller.fr@gmail.com>
 *
 */
public class PdDocumentBarcodeScanner {
	
	PDDocument pdDocument;
	int maximumBlankPixelDelimiterCount = 20;
	List<PdPageBarcodeScanner> pageScannerList;
	
	public PdDocumentBarcodeScanner(File file) throws IOException {
		FileInputStream pdfInputStream = new FileInputStream(file);
		this.pdDocument = PDDocument.load(pdfInputStream);
		pdfInputStream.close();
		pageScannerList = new ArrayList<PdPageBarcodeScanner>();
	}
	

	public PdDocumentBarcodeScanner() {
		// TODO Auto-generated constructor stub
	}


	public void scan() throws IOException {
		List<PDPage> pages = pdDocument.getDocumentCatalog().getAllPages();
		int pageNumber = 0;
		for (PDPage pdPage : pages) {
			
			PdPageBarcodeScanner pageScanner
				= new PdPageBarcodeScanner(
					pdPage,
					pageNumber,
					this.maximumBlankPixelDelimiterCount);
			
			pageScannerList.add(pageScanner);
			pageScanner.scan();
			pageNumber++;
		}
	}
	
	

	public String displayResults() {
		String data="";
		for (PdPageBarcodeScanner pageScanner : pageScannerList) {
			data=data+pageScanner.displayResults();
		}
		return data;
	}
	
	
/**-----------------------------------------------------------------------------------------------------------------------------*/	
	/**
	 * 
	 * @param fileName
	 * @throws IOException 
	 * @throws Exception
	 * 
	 */
	
	public String extractBarcode(String pdfPath) throws IOException{
		
		long startTime = System.currentTimeMillis();
		System.out.println("PdfBoxBarcodeScannerTest starts...");
		String filename = pdfPath;
		PdDocumentBarcodeScanner scanner = new PdDocumentBarcodeScanner(new File(filename));
		scanner.scan();
		long endTime = System.currentTimeMillis();
		System.out.println("pdf scanned in " + (endTime - startTime) + " ms");
		String data=scanner.displayResults();
		return data;
		
	}
	
/**-----------------------------------------------------------------------------------------------------------------------------*/
	
	
	public static void main(String[] args) throws Exception {
		/*long startTime = System.currentTimeMillis();
		System.out.println("PdfBoxBarcodeScannerTest starts...");
		String filename = "Example_007.pdf";
		
		
		PdDocumentBarcodeScanner scanner = new PdDocumentBarcodeScanner(new File(filename));
		scanner.scan();
		long endTime = System.currentTimeMillis();

		System.out.println("pdf scanned in " + (endTime - startTime) + " ms");
		
		scanner.displayResults();*/
		PdDocumentBarcodeScanner scanner=new PdDocumentBarcodeScanner();
		scanner.extractBarcode("Example_007.pdf");
	}

	
	
	
	
	
	
	
	

}
