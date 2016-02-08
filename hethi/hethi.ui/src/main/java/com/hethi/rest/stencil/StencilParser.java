package com.hethi.rest.stencil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.hethi.rest.stencil.StencilField;

public class StencilParser {

	// No generics
	List myEmpls;
	Document dom;

	public StencilParser() {
		// create a list to hold the employee objects
		myEmpls = new ArrayList();
	}

	public void runFile(String sFileName) {

		// parse the xml file and get the dom object

		parseXmlFile(sFileName);
		System.out.println("Parsed xml succesfully");
		// get each employee element and create a Employee object
		parseDocument();

		// Iterate through the list and print the data
		// printData();

	}

	public List getParsedData() {
		return myEmpls;
	}

	private void parseXmlFile(String sFileName) {
		// get the factory
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			// Using factory get an instance of document builder
			DocumentBuilder db = dbf.newDocumentBuilder();

			// parse using builder to get DOM representation of the XML file
			dom = db.parse(sFileName);

		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (SAXException se) {
			se.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}

	private void parseDocument() {
		// get the root elememt
		Element docEle = dom.getDocumentElement();

		// get a nodelist of <employee> elements
		NodeList nl = docEle.getElementsByTagName("field");
		if (nl != null && nl.getLength() > 0) {
			for (int i = 0; i < nl.getLength(); i++) {

				// get the employee element
				Element el = (Element) nl.item(i);

				// get the Employee object
				StencilField e = getField(el);

				// add it to list
				myEmpls.add(e);
			}
		}
	}

	/**
	 * I take an employee element and read the values in, create an Employee
	 * object and return it
	 * 
	 * @param empEl
	 * @return
	 */
	private StencilField getField(Element empEl) {

		// for each <employee> element get text or int values of
		// name ,id, age and name
		String name = getTextValue(empEl, "name");

		String coords = getTextValue(empEl, "form_coords");

		// Create a new Employee with the value read from the xml nodes
		StencilField e = new StencilField(name, coords);

		return e;
	}

	/**
	 * I take a xml element and the tag name, look for the tag and get the text
	 * content i.e for <employee><name>John</name></employee> xml snippet if the
	 * Element points to employee node and tagName is name I will return John
	 * 
	 * @param ele
	 * @param tagName
	 * @return
	 */
	private String getTextValue(Element ele, String tagName) {
		String textVal = null;
		NodeList nl = ele.getElementsByTagName(tagName);
		if (nl != null && nl.getLength() > 0) {
			if (tagName == "form_coords") {
				Element el = (Element) nl.item(0);

				if (el.getElementsByTagName("top") != null && el.getElementsByTagName("top").getLength() > 0)
					textVal = el.getElementsByTagName("top").item(0).getFirstChild().getNodeValue();
				if (el.getElementsByTagName("left") != null && el.getElementsByTagName("left").getLength() > 0)
					textVal += "," + el.getElementsByTagName("left").item(0).getFirstChild().getNodeValue();
				if (el.getElementsByTagName("width") != null && el.getElementsByTagName("width").getLength() > 0)
					textVal += "," + el.getElementsByTagName("width").item(0).getFirstChild().getNodeValue();
				if (el.getElementsByTagName("height") != null && el.getElementsByTagName("height").getLength() > 0)
					textVal += "," + el.getElementsByTagName("height").item(0).getFirstChild().getNodeValue();
				System.out.println("Field coords values " + textVal);
			} else {

				Element el = (Element) nl.item(0);
				textVal = el.getFirstChild().getNodeValue();
				System.out.println("Field name values " + textVal);
			}
		}
		return textVal;
	}

	/**
	 * Calls getTextValue and returns a int value
	 * 
	 * @param ele
	 * @param tagName
	 * @return
	 */
	private int getIntValue(Element ele, String tagName) {
		// in production application you would catch the exception
		return Integer.parseInt(getTextValue(ele, tagName));
	}

	/**
	 * Iterate through the list and print the content to console
	 */
	private void printData() {

		System.out.println("No of Employees '" + myEmpls.size() + "'.");

		Iterator it = myEmpls.iterator();
		while (it.hasNext()) {

			System.out.println(it.next().toString());
		}
	}

	/*
	 * public static void main(String[] args){ //create an instance
	 * DomParserExample dpe = new DomParserExample();
	 * 
	 * //call run example dpe.runExample();
	 */

}
