package com.hethi.daas;

//import net.sf.json.JSONObject; 
//import net.sf.json.xml.XMLSerializer;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.json.XML;

/**
 *
 * @author gopc
 */
public class XMLtoJsonConverter {

	public static String convertXMLToJson(String xmlFile) {
		try {

			File file = new File(xmlFile);
			InputStream inputStream = new FileInputStream(file);
			StringBuilder builder = new StringBuilder();
			int ptr = 0;
			while ((ptr = inputStream.read()) != -1) {
				builder.append((char) ptr);
			}
			String xml = builder.toString();
			org.json.JSONObject jsonObj = XML.toJSONObject(xml);
			System.out.println(jsonObj);

			/*
			 * String xmlString =
			 * "<?xml version=\"1.0\"?><ASF_Service_ResponseVO id=\"1\"><service type=\"String\">OnboardingV2</service><operation type=\"String\">start_onboarding_session</operation><requested_version type=\"String\">1.0</requested_version><actual_version type=\"String\">1.0</actual_version><server_info type=\"String\">onboardingv2serv:start_onboarding_session&CalThreadId=85&TopLevelTxnStartTime=13b40fe91c4&Host=L-BLR-00438534&pid=3564</server_info><result type=\"Onboarding::StartOnboardingSessionResponse\" id=\"2\"><onboarding_id type=\"String\">137</onboarding_id><success type=\"bool\">true</success></result></ASF_Service_ResponseVO>"
			 * ;
			 * 
			 * JSONObject jsonObj = XML.toJSONObject(xmlString);
			 * System.out.println(jsonObj.toString());
			 */
			return jsonObj.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public static void main(String[] args) throws Exception {
		/*
		 * String json=convertXMLToJson("sample.xml"); System.out.println(json);
		 */
	}

}