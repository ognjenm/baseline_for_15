package com.hethi.daas.Mapping;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.pdfbox.pdmodel.PDDocument;

import com.hethi.rest.utility.CollectionManipulation;
import com.hethi.rest.utility.ImageUtil;
import com.hethi.rest.utility.PDFUtility;
import com.hethi.rest.utility.QueryExecutors;

import net.sourceforge.tess4j.TesseractException;

public class Classification {

	
public  ArrayList<ClassifyModel> getUfs_uin(String customerId,String policyName){
		
		QueryExecutors qe=new QueryExecutors();
		String sql="select * from cclassification_policy where customer_id="+customerId+" and policyname='"+policyName+"'";
		ArrayList<ClassifyModel> indexs=qe.getAllUfs_UInByCustomer(sql);	
		return indexs;
	}
	
	
	public Map<String,String> RunclassifyefsUIN(String customerId,ArrayList<String> inputForm) throws TesseractException{
		
		String matched_efs_uin="";
		
		ArrayList<ClassifyModel> Classifypolicies=getUfs_uin(customerId,"");
		
		List<String> ufs_uinTotal=new ArrayList<>();
		List<String> ufs_uinMatched=new ArrayList<>();
		Map<String,String> efs_uinMap=new HashMap<>();
		
		/** 
		 * Iterate through object
		 * 
		 */
		
		int i=0;
		for (String list : inputForm) {
			System.out.println("The file name is "+list);
			
		i++;
		for (ClassifyModel index : Classifypolicies) {
			
		
			
			ufs_uinTotal.add(index.getEfs_uin());
			int x1=Integer.parseInt(index.getData_position_left());
			int y1=Integer.parseInt(index.getData_position_top());
			int x2=Integer.parseInt(index.getData_position_width());
			int y2=Integer.parseInt(index.getData_position_height());
			ImageUtil imageutil=new ImageUtil();
			String extractedData=imageutil.extractFromImage(list, x1, y1, x2, y2);
			extractedData=extractedData.trim();
			System.out.println("The extracted data is "+extractedData);
			String classifyData=index.getData_expected_content();
			System.out.println("Classification Data "+classifyData);
			System.out.println("The extracted data is "+extractedData);
		
			if (classifyData.equalsIgnoreCase(extractedData)) {
				ufs_uinMatched.add(index.getEfs_uin());
			}
			}
		}
		
			CollectionManipulation manipulation=new CollectionManipulation();
			
			String ufs_uinTotal_Count=manipulation.getElementCount(ufs_uinTotal);
			String ufs_uinMatched_Count=manipulation.getElementCount(ufs_uinMatched);
			String [] ufs_uinTotal_Count_array=ufs_uinTotal_Count.split(",");
			String [] ufs_uinMatched_Count_array=ufs_uinMatched_Count.split(",");
			System.out.println("efs_uin == "+ufs_uinTotal_Count_array[0]+" matched "+ufs_uinMatched_Count_array[0]);
			if(ufs_uinTotal_Count_array[0].equalsIgnoreCase(ufs_uinMatched_Count_array[0])){
				if(ufs_uinTotal_Count_array[1].equalsIgnoreCase(ufs_uinMatched_Count_array[1])){
					matched_efs_uin=ufs_uinTotal_Count_array[0];
					System.out.println("selected efs_uin"+matched_efs_uin);
					efs_uinMap.put(inputForm.get(i).toString(), matched_efs_uin);
				}
				else{
					System.out.println("Template Not found");
				}
			
		}
			return efs_uinMap;	
		}
		
		
	
	/**
	 * 
	 * @param customerId
	 * @param inputFile
	 * @return
	 * @throws IOException
	 * @throws TesseractException 
	 *
	 */
	
	/*public List<String> identifyForm(String customerId,String inputFile) throws IOException{
		ArrayList<ClassifyModel> Classifypolicies=getUfs_uin(customerId);
		List<String> ufs_uinMatched=new ArrayList<>();
		PDDocument doc = PDDocument.load(new File(inputFile));
		int count = doc.getNumberOfPages();
		int listCount=Classifypolicies.size();
		System.out.println( "List count "+listCount);
		int k=0;
	for (ClassifyModel index : Classifypolicies) {
	
			//ufs_uinTotal.add(index.getEfs_uin());
			int x1=Integer.parseInt(index.getData_position_left());
			int y1=Integer.parseInt(index.getData_position_top());
			int x2=Integer.parseInt(index.getData_position_width());
			int y2=Integer.parseInt(index.getData_position_height());
			PDFUtility pdfUtility=new PDFUtility();
			String extractedData="";
			extractedData=pdfUtility.extractTextByPDFArea(x1,y1,y2,x2,inputFile);
			extractedData=extractedData.trim();
			String classifyData=index.getData_expected_content();
			System.out.println("Classification Data "+classifyData);
			System.out.println("The extracted data is "+extractedData);
			++k;
			if (classifyData.equalsIgnoreCase(extractedData)) {
				ufs_uinMatched.add(index.getEfs_uin());
			}
			else{
				System.out.println("The data is not available");
				
			}
			for (String string : ufs_uinMatched) {
				System.out.println("efs_uin is "+string);
			}
		}
		System.out.println("The value is "+k);
		System.out.println("Completed");
		return ufs_uinMatched;
	}
	*/
	
	
	
	
	
	public String identifyForm(String customerId,String inputFile) throws IOException, TesseractException{
		ArrayList<ClassifyModel> Classifypolicies=getUfs_uin(customerId,"form identification");
		List<String> ufs_uinMatched=new ArrayList<>();
		PDDocument doc = PDDocument.load(new File(inputFile));
		int count = doc.getNumberOfPages();
		int listCount=Classifypolicies.size();
		System.out.println( "List count "+listCount);
		int k=0;
		String efs_uin="";
		int page_no=0;
	for (ClassifyModel index : Classifypolicies) {
			//ufs_uinTotal.add(index.getEfs_uin());
			int x1=Integer.parseInt(index.getData_position_left());
			int y1=Integer.parseInt(index.getData_position_top());
			int x2=Integer.parseInt(index.getData_position_width());
			int y2=Integer.parseInt(index.getData_position_height());
			PDFUtility pdfUtility=new PDFUtility();
			String extractedData="";
			for(int page=0;page<count;page++){
			extractedData=pdfUtility.extractTextByPDFArea(x1,y1,x2,y2,inputFile,page_no++);
			//extractedData=new ImageUtil().extractFromImage(inputFile, x1, y1, x2, y2);
			extractedData=extractedData.trim();
			String classifyData=index.getData_expected_content();
			System.out.println("Classification Data "+classifyData);
			System.out.println("The extracted data is "+extractedData);
			efs_uin=index.getEfs_uin();
			page_no=page;
			String sql="insert into cclassify_status (efs_uin,pageno) values ('"+efs_uin+"',"+page_no+")";
			QueryExecutors queryExecutors=new QueryExecutors();
			queryExecutors.insertClassifyStatus(sql);
			if (classifyData.equalsIgnoreCase(extractedData)) {
				efs_uin=index.getEfs_uin();
				page_no=page;
				/*String sql="insert into cclassify_status (efs_uin,pageno) values ('"+efs_uin+"',"+page_no+")";
				QueryExecutors queryExecutors=new QueryExecutors();
				queryExecutors.insertClassifyStatus(sql);*/
			}
			else{
				System.out.println("The data is not available");
			}
			}
			
			
		}
		System.out.println("The value is "+k);
		System.out.println("Completed");
		System.out.println(efs_uin+page_no);
		/*String sql="insert into cclassify_status (efs_uin,pageno) values ('"+efs_uin+"',"+page_no+")";
		QueryExecutors queryExecutors=new QueryExecutors();
		queryExecutors.insertClassifyStatus(sql);*/
		return efs_uin;
		
	}
	
	
	
	
	/**
	 * 
	 * @param args
	 * @throws TesseractException
	 * @throws IOException
	 */
	
	public String identifyFormRelationship(String customerId,String inputFile) throws IOException{
	ArrayList<ClassifyModel> Classifypolicies=getUfs_uin(customerId,"form relationship");
	List<String> ufs_uinMatched=new ArrayList<>();
	PDDocument doc = PDDocument.load(new File(inputFile));
	int count = doc.getNumberOfPages();
	int listCount=Classifypolicies.size();
	System.out.println( "List count "+listCount);
	int k=0;
	String efs_uin="";
	int page_no=0;
for (ClassifyModel index : Classifypolicies) {
		//ufs_uinTotal.add(index.getEfs_uin());
		int x1=Integer.parseInt(index.getData_position_left());
		int y1=Integer.parseInt(index.getData_position_top());
		int x2=Integer.parseInt(index.getData_position_width());
		int y2=Integer.parseInt(index.getData_position_height());
		PDFUtility pdfUtility=new PDFUtility();
		String extractedData="";
		for(int page=0;page<count;page++){
		extractedData=pdfUtility.extractTextByPDFArea(x1,y1,x2,y2,inputFile,page_no++);
		//extractedData=new ImageUtil().extractFromImage(inputFile, x1, y1, x2, y2);
		extractedData=extractedData.trim();
		String classifyData=index.getData_expected_content();
		System.out.println("Classification Data "+classifyData);
		System.out.println("The extracted data is "+extractedData);
		efs_uin=index.getEfs_uin();
		page_no=page;
		String sql="insert into cclassify_status (efs_uin,pageno) values ('"+efs_uin+"',"+page_no+")";
		QueryExecutors queryExecutors=new QueryExecutors();
		queryExecutors.insertClassifyStatus(sql);
		if (classifyData.equalsIgnoreCase(extractedData)) {
			efs_uin=index.getEfs_uin();
			page_no=page;
			/*String sql="insert into cclassify_status (efs_uin,pageno) values ('"+efs_uin+"',"+page_no+")";
			QueryExecutors queryExecutors=new QueryExecutors();
			queryExecutors.insertClassifyStatus(sql);*/
		}
		else{
			System.out.println("The data is not available");
		}
		}
		
		
	}
	System.out.println("The value is "+k);
	System.out.println("Completed");
	System.out.println(efs_uin+page_no);
	/*String sql="insert into cclassify_status (efs_uin,pageno) values ('"+efs_uin+"',"+page_no+")";
	QueryExecutors queryExecutors=new QueryExecutors();
	queryExecutors.insertClassifyStatus(sql);*/
	return efs_uin;
	
	}
	
	public String identifyFormSequence(){
		return "";
	}
	
	public String splitForm(){
		return "";
	}
	
	public String mergeForm(){
		return "";
	}

	public String rejectForm(){
		return "";
	}
	
	
	public static void main(String []args) throws TesseractException, IOException{
	
		Classification classify=new Classification();
		//classifyIndex.getUfs_uin();
		ArrayList<String> fileList=new ArrayList<>();
		fileList.add("pdf\\multipage-pdf_merged.pdf");
		classify.identifyForm("102","multipage-pdf_merged.pdf");
			
	}
	


}
