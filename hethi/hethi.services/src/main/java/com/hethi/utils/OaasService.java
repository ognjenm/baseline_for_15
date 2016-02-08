package com.hethi.utils;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import com.hethi.domain.iPost;

public class OaasService {
	public void createIXML(String currentDir, String xslt, iPost ipost) throws Exception{
		String file_content="";
		String ixmlpath= currentDir.substring(0,currentDir.lastIndexOf('.'));
		ixmlpath=ixmlpath+"_ixml.xml";
		 StreamSource source = new StreamSource(new File(currentDir));
		    StreamSource stylesource = new StreamSource(new File(xslt));

		    TransformerFactory factory = TransformerFactory.newInstance();
		    Transformer transformer = factory.newTransformer(stylesource);

		    StreamResult result = new StreamResult(ixmlpath);
		    System.out.println("@@@@@@@@@@@@@@@@@@@@@@");
		    System.out.println(ixmlpath);
		    System.out.println("########  "+result);
		    transformer.transform(source, result);
		    Save_oaas_output(ipost, "IXML", ixmlpath, file_content);
		
		
	}
	
	public String Save_oaas_output (iPost ipost,String type,String file_location,String file_content){
		
		String query="INSERT INTO `hethi`.`dcustomer_output` (`customer_id`, `tfs_uin`, `efs_uin`, `uid`, `din`, `version`, `type`, `file_location`, `file_content`,`lastupuser`,`lastupdtm`) VALUES ('"+ipost.getCustomer_id()+"','"+ipost.getTfs_uin()+"','"+ipost.getEfs_uin()+"','"+ipost.getUid()+"','"+ipost.getDin()+"','"+ipost.getVersion()+"','"+type+"','"+file_location+"','"+file_content+"','"+ipost.getUser_id()+"',now());";
//		System.out.println(query);
		QueryExecutors qb=new QueryExecutors();
		try {
			
			ArrayList<ArrayList> result=qb.executeInsertOrUpdate(query);
			return result.toString();
			
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return query;
		
		
	}


}
