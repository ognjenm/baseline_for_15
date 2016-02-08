package com.hethi.aaas;

import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.domain.iPost;

public class AaasCoreServices {
	public  Message<String> aaasSummaryReport(String data) {//....................1................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas summary report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_SummaryReport_channel");
	         String nextQue= "AaaS.ReconciliationReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasReconciliationReport(String data) {//.................2..............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas reconciliation report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_reconciliationreport_channel");
	         String nextQue= "AaaS.ShipmentReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasShipmentReport(String data) {//...........3........................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas Shipment Report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_Shipment_report_channel");
	         String nextQue= "AaaS.DetailedShipmentReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasDetailedShipmentReport(String data) {//......................4........
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas detailed shipment report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_DetailedShipmentReport_channel");
	         String nextQue= "AaaS.EmailReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasEmailReport(String data) {//....................5.................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas Email report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_Email_report_channel");
	         String nextQue= "AaaS.FaxReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasFaxReport(String data) {//.............6.......................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas fax report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_Faxreport_channel");
	         String nextQue= "AaaS.BillingReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasBillingReport(String data) {//...............7..................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas Billing report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_Billingreport_channel");
	         String nextQue= "AaaS.POMatchRateReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasPoMatchRateReport(String data) {//......................8...............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas PO Matchrate report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_PO_Matchratereport_channel");
	         String nextQue= "AaaS.EDIReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasEdiReport(String data) {//.............9........................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas Edi report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_Edi_Report_channel");
	         String nextQue= "AaaS.WorkflowReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	public  Message<String> aaasWorkflowReport(String data) {//......................10................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas Work flow report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_WorkFlowReport_channel");
	         String nextQue= "AaaS.ActivityAgingReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasActivityAgingReport(String data) {//...........11..................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas activity aging report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_activityagingreport_channel");
	         String nextQue= "AaaS.ExceptionReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasExceptionReport(String data) {//...............12......................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas Exception report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_Exceptionreport_channel");
	         String nextQue= "AaaS.PerformanceReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasPerformanceReport(String data) {//......................13.............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas performance report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_performance_report_channel");
	         String nextQue= "AaaS.WorkItemDetailReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasWorkItemDetailReport(String data) {//...............14............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas work item detail report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_work_item_detail_channel");
	         String nextQue= "AaaS.WorkflowWorkinProgressReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasWorkflowWorkinProgressReport(String data) {//..............15..........
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas workflow in progress report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_workflowinprogress_report_channel");
	         String nextQue= "AaaS.AuditTrailReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasAuditTrailReport(String data) {//...............16...............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas audit trail report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_auditrail_report_channel");
	         String nextQue= "AaaS.ProductivityReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasProductivityReport(String data) {//........................17..............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas productivity report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_productivityreport_channel");
	         String nextQue= "AaaS.InventoryReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	public  Message<String> aaasInventoryReport(String data) {//...............18...............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas inventory report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_Inventory_report_channel");
	         String nextQue= "AaaS.AbsenteeDelegationReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasAbsenteeDelegationReport(String data) {//................19............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas absentee delegation report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_absentee_report_channel");
	         String nextQue= "AaaS.ReassignReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasReassignReport(String data) {//...............20...........................
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas reassign report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_reassignreport_channel");
	         String nextQue= "AaaS.RerouteReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasRerouteReport(String data) {//.......................21..............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas reroute report channel method");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_re-routereport_channel");
	         String nextQue= "AaaS.WorkItemHistoryReport";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
	public  Message<String> aaasWorkItemHistoryReport(String data) {//.....................22..............
		
		 String messageContent=data;
		Message<String> msg;
		 
		 String SEPARATOR = "-----------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println(" Aaas work item history report");
		 System.out.println(""+SEPARATOR);
		 System.out.println("messageContent :"+messageContent);			 
		 System.out.println(""+SEPARATOR);
		 System.out.println(" \n ");
		 System.out.println(" \n ");
		 
		  iPost ipost=new iPost(data);
	         ipost.stackDescription("inside_Aaas_channel");
	         String nextQue= "DocumentInChannel";
		        String datas = ipost.toString();
		        msg= MessageBuilder.withPayload(datas)
	                 .setHeader("NextQue",nextQue)
	                 .build();
		 return msg;
	}
	
}
