package com.hethi.daas.ImageIO;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.pdfbox.util.Splitter;

public class ClassifyFormService {
	
	String temppath="D:\\";
	 String pdfPath= "src/web/client/images/uploads/";
	 //String pdfName ="Example_0021454505848629.pdf";
	 String pdfName = "yildiz_iicai05.pdf";
	static String pdfText ="";
	public  String PDFReader(){		
		 
		        PDFTextStripper pdfStripper = null;
		        PDDocument pdDoc = null;
		        COSDocument cosDoc = null;
		        File file = new File(temppath+pdfName);
		        String parsedText="";
		        try {
		            PDFParser parser = new PDFParser(new FileInputStream(file));
		            parser.parse();
		            cosDoc = parser.getDocument();
		            pdfStripper = new PDFTextStripper();
		            pdDoc = new PDDocument(cosDoc);
		            pdfStripper.setStartPage(1);
		            pdfStripper.setEndPage(13);
		             parsedText = pdfStripper.getText(pdDoc);
		           // System.out.println(parsedText);
		        } catch (IOException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }
				return parsedText; 
		    }
	
	public void findForm() throws IOException{
	
		Splitter splitter = new Splitter();
		pdfText = PDFReader();
		int pocount = 0;
		int nonpocount = 0;
		
		/*poForm array list*/
		
		ArrayList<String> poFormkey = new ArrayList<>();
		poFormkey.add("invoice");
		poFormkey.add("invoice #");
		poFormkey.add("invoice no");
		poFormkey.add("bill no");
		poFormkey.add("p.o no");
		poFormkey.add("restricted");
		/*Non-poForm array list*/
		
		ArrayList<String> nonPoFormkey = new ArrayList<>();
		nonPoFormkey.add("purchase order");
		nonPoFormkey.add("purchase order no");
		nonPoFormkey.add("bill no");
		
		//List<PDDocument> listOfSplitPages;
		
		String pdfTextLower= pdfText.toLowerCase();
		System.out.println(pdfTextLower);
		
		System.out.println("------------------------------------------------------");
		
		/*check if Po form or not*/
		
		for (String pokey : poFormkey)  
		{  
			boolean po_result =pdfTextLower.contains(pokey);
			
			if(po_result){
				pocount++;
			}
		} 
		
		/*check if Po form or not*/
		
		for (String nonpokey : nonPoFormkey)  
		{  
			boolean nnon_result =pdfTextLower.contains(nonpokey);
			
			if(nnon_result){
				nonpocount++;
			}
		}
		
		if(pocount<nonpocount){
			File file =new File(pdfPath+"nonpoform");
			if(!file.mkdirs()){
				file.mkdirs();
				System.out.println(file.getAbsolutePath()+pdfName);
				 FileWriter writer = new FileWriter(file.getAbsolutePath()+"/"+pdfName);
				 BufferedWriter bw = new BufferedWriter(writer);
					bw.write(pdfText);
					bw.close();
				}
			
		}
		else if(pocount>nonpocount)
		{
			File file =new File(pdfPath+"poform");
			if(!file.mkdirs()){
			file.mkdirs();
			System.out.println(file.getAbsolutePath()+pdfName);
			 FileWriter writer = new FileWriter(file.getAbsolutePath()+"/"+pdfName);
			 BufferedWriter bw = new BufferedWriter(writer);
				bw.write(pdfText);
				bw.close();
			}
		}

		 System.out.println("PO FORM COUNT VALUE = "+pocount);
		 System.out.println("NON_PO FORM COUNT VALUE = "+nonpocount);

		
	}
	
		
	public static void main(String[] args) throws IOException {
		
		ClassifyFormService service= new ClassifyFormService();
		service.findForm();
		
	}
}
