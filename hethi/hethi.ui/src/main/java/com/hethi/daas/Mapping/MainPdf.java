package com.hethi.daas.Mapping;

import java.awt.Color;
import java.awt.Rectangle;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.exceptions.COSVisitorException;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDResources;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.edit.PDPageContentStream;
import org.apache.pdfbox.pdmodel.graphics.PDExtendedGraphicsState;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.pdfbox.util.PDFTextStripperByArea;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class MainPdf {

	public static String pdftoText(int x1, int y1, int y2, int x2, String pdfFile) {
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

			Rectangle rect = new Rectangle(x1, y1, x2, y2);
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

	}

	/*
	 * // Extract text from PDF Document public String pdftoText(int x1, int y1,
	 * int y2, int x2, String l) {
	 * 
	 * String lValue = null; PDFTextStripper pdfStripper = null; PDDocument
	 * pdDoc = null; COSDocument cosDoc = null;
	 * 
	 * File file = new File(
	 * "E:\\IPMessangerFiles\\pdf jar & get val\\Example_002-jpeg.pdf"); try {
	 * PDFParser parser = new PDFParser(new FileInputStream(file));
	 * parser.parse(); cosDoc = parser.getDocument(); pdfStripper = new
	 * PDFTextStripper(); pdDoc = new PDDocument(cosDoc); PDFTextStripperByArea
	 * stripper = new PDFTextStripperByArea(); stripper.setSortByPosition(true);
	 * Rectangle rect = new Rectangle(x1, y1, x2, y2);
	 * stripper.addRegion("class1", rect); List allPages =
	 * pdDoc.getDocumentCatalog().getAllPages(); PDPage firstPage = (PDPage)
	 * allPages.get(0); stripper.extractRegions(firstPage); System.out.println(
	 * "Text in the area:" + rect); lValue =
	 * stripper.getTextForRegion("class1");
	 * System.out.println(stripper.getTextForRegion("class1"));
	 * 
	 * // createXml(L, LValue); // String parsedText =
	 * pdfStripper.getText(pdDoc); // System.out.println(parsedText); }
	 * 
	 * catch (IOException e) {
	 * 
	 * e.printStackTrace(); } return lValue;
	 * 
	 * }
	 * 
	 * private void readXML() throws IOException { int x1, y1, x2, y2, a1, b1,
	 * a2, b2; String l; String xmlstr = "";
	 * 
	 * Document doc = null; try { doc = parseXML(
	 * "E:\\IPMessangerFiles\\pdf jar & get val\\sample_hethi_xsd1.xml"); }
	 * catch (ParserConfigurationException e) { e.printStackTrace(); } catch
	 * (SAXException e) { e.printStackTrace(); } catch (IOException e) {
	 * e.printStackTrace(); }
	 * 
	 * if (doc != null) { NodeList nList =
	 * doc.getElementsByTagName("labletext"); for (int i = 0; i <
	 * nList.getLength(); i++) { Node nNode = nList.item(i); Element eElement =
	 * (Element) nNode; // System.out.println("node name ="
	 * +nNode.getTextContent()); Element clable = (Element)
	 * eElement.getElementsByTagName("formfieldlable").item(0);
	 * 
	 * Element cElement = (Element)
	 * eElement.getElementsByTagName("top").item(0); Element cElement1 =
	 * (Element) eElement.getElementsByTagName("left").item(0); Element
	 * cElement2 = (Element) eElement.getElementsByTagName("width").item(0);
	 * Element cElement3 = (Element)
	 * eElement.getElementsByTagName("height").item(0);
	 * 
	 * // Element cElement = (Element) //
	 * eElement.getElementsByTagName("form_coords").item(0); l =
	 * clable.getAttribute("name"); x1 =
	 * Integer.parseInt(cElement.getTextContent()); y1 =
	 * Integer.parseInt(cElement1.getTextContent()); x2 =
	 * Integer.parseInt(cElement2.getTextContent()); y2 =
	 * Integer.parseInt(cElement3.getTextContent()); System.out.println(
	 * "LABLE =" + l); pdftoText(y1, x1, y2, x2); System.out.println("LABLE =" +
	 * l);
	 * 
	 * System.out.println("x1: " + cElement.getTextContent());
	 * System.out.println("y1 : " + cElement1.getTextContent());
	 * System.out.println("x2: " + cElement2.getTextContent());
	 * System.out.println("y2 : " + cElement3.getTextContent());
	 * 
	 * NodeList nList1 = doc.getElementsByTagName("fieldcoord"); for (int j = 0;
	 * i < nList1.getLength(); i++) { Node nNode1 = nList1.item(i); Element
	 * eElement1 = (Element) nNode1; // System.out.println("node name ="
	 * +nNode.getTextContent()); Element cElement10 = (Element)
	 * eElement1.getElementsByTagName("top").item(0); Element cElement11 =
	 * (Element) eElement1.getElementsByTagName("left").item(0); Element
	 * cElement12 = (Element) eElement1.getElementsByTagName("width").item(0);
	 * Element cElement13 = (Element)
	 * eElement1.getElementsByTagName("height").item(0);
	 * 
	 * // Element cElement = (Element) //
	 * eElement.getElementsByTagName("form_coords").item(0); a1 =
	 * Integer.parseInt(cElement10.getTextContent()); b1 =
	 * Integer.parseInt(cElement11.getTextContent()); a2 =
	 * Integer.parseInt(cElement12.getTextContent()); b2 =
	 * Integer.parseInt(cElement13.getTextContent()); pdftoText(b1, a1, b2, a2,
	 * l);
	 * 
	 * String open = "<"; String close = ">"; String endtag = "</"; xmlstr +=
	 * open + l + close + pdftoText(b1, a1, b2, a2, l) + endtag + l + close; } }
	 * } createXml(xmlstr); }
	 * 
	 * private Document parseXML(String filePath) throws
	 * ParserConfigurationException, SAXException, IOException {
	 * DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	 * DocumentBuilder db = dbf.newDocumentBuilder(); Document doc =
	 * db.parse(filePath); doc.getDocumentElement().normalize(); return doc; }
	 * 
	 * public String createXml(String xmlsource) throws IOException {
	 * 
	 * String head = "<xml>"; String end = "</xml>"; writeStringFile(head +
	 * xmlsource + end); //System.out.println(
	 * "The file is*************************** = >" + head + xmlsource + end);
	 * return head + xmlsource + end; }
	 * 
	 * public void writeStringFile(String infile) throws IOException { File file
	 * = new File("E:\\IPMessangerFiles\\pdf jar & get val\\filename.xml"); if
	 * (!file.exists()) { file.createNewFile(); } FileWriter fw = new
	 * FileWriter(file); BufferedWriter bw = new BufferedWriter(fw);
	 * bw.write(infile); bw.close(); }
	 *//**
		 * @throws IOException
		 *************************************************************************************************************************************//*
																																			 * 
																																			 * public
																																			 * void
																																			 * readXMLwithAttributes
																																			 * (
																																			 * String
																																			 * xmlFile)
																																			 * throws
																																			 * IOException{
																																			 * 
																																			 * int
																																			 * x1,
																																			 * y1,
																																			 * x2,
																																			 * y2,
																																			 * a1,
																																			 * b1,
																																			 * a2,
																																			 * b2;
																																			 * String
																																			 * l;
																																			 * String
																																			 * xmlstr
																																			 * =
																																			 * "";
																																			 * 
																																			 * Document
																																			 * doc
																																			 * =
																																			 * null;
																																			 * try
																																			 * {
																																			 * doc
																																			 * =
																																			 * parseXML(
																																			 * "E:\\IPMessangerFiles\\pdf jar & get val\\sample_hethi_xsd1.xml"
																																			 * );
																																			 * }
																																			 * catch
																																			 * (ParserConfigurationException
																																			 * e)
																																			 * {
																																			 * e
																																			 * .
																																			 * printStackTrace
																																			 * (
																																			 * )
																																			 * ;
																																			 * }
																																			 * catch
																																			 * (SAXException
																																			 * e)
																																			 * {
																																			 * e
																																			 * .
																																			 * printStackTrace
																																			 * (
																																			 * )
																																			 * ;
																																			 * }
																																			 * catch
																																			 * (IOException
																																			 * e)
																																			 * {
																																			 * e
																																			 * .
																																			 * printStackTrace
																																			 * (
																																			 * )
																																			 * ;
																																			 * }
																																			 * 
																																			 * if
																																			 * (doc
																																			 * !=
																																			 * null)
																																			 * {
																																			 * NodeList
																																			 * headerList
																																			 * =
																																			 * doc
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "header"
																																			 * )
																																			 * ;
																																			 * for
																																			 * (int
																																			 * i
																																			 * =
																																			 * 0;
																																			 * i
																																			 * <
																																			 * headerList
																																			 * .
																																			 * getLength
																																			 * (
																																			 * )
																																			 * ;
																																			 * i
																																			 * +
																																			 * +
																																			 * )
																																			 * {
																																			 * Node
																																			 * nNode
																																			 * =
																																			 * headerList
																																			 * .
																																			 * item
																																			 * (
																																			 * i
																																			 * )
																																			 * ;
																																			 * Element
																																			 * eElement
																																			 * =
																																			 * (Element)
																																			 * nNode;
																																			 * if
																																			 * (
																																			 * eElement
																																			 * .
																																			 * getTagName
																																			 * (
																																			 * )
																																			 * .
																																			 * equalsIgnoreCase
																																			 * (
																																			 * "position"
																																			 * )
																																			 * )
																																			 * {
																																			 * String
																																			 * top
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "top"
																																			 * )
																																			 * ;
																																			 * String
																																			 * left
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "left"
																																			 * )
																																			 * ;
																																			 * String
																																			 * width
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "width"
																																			 * )
																																			 * ;
																																			 * String
																																			 * height
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "height"
																																			 * )
																																			 * ;
																																			 * }
																																			 * 
																																			 * else
																																			 * if
																																			 * (
																																			 * eElement
																																			 * .
																																			 * getTagName
																																			 * (
																																			 * )
																																			 * .
																																			 * equalsIgnoreCase
																																			 * (
																																			 * "field"
																																			 * )
																																			 * )
																																			 * {
																																			 * String
																																			 * name
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "name"
																																			 * )
																																			 * ;
																																			 * String
																																			 * ixsdfieldname
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "ixsdfieldname"
																																			 * )
																																			 * ;
																																			 * String
																																			 * type
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "type"
																																			 * )
																																			 * ;
																																			 * String
																																			 * toreject
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "toreject"
																																			 * )
																																			 * ;
																																			 * String
																																			 * classifytoefs
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "classifytoefs"
																																			 * )
																																			 * ;
																																			 * String
																																			 * beginningoffile
																																			 * =
																																			 * eElement
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "beginningoffile"
																																			 * )
																																			 * ;
																																			 * }
																																			 * 
																																			 * /
																																			 * /
																																			 * Node
																																			 * nList
																																			 * =
																																			 * doc
																																			 * .
																																			 * ELEMENT_NODE;
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * NodeList
																																			 * studentobj
																																			 * =
																																			 * doc
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "student"
																																			 * )
																																			 * ;
																																			 * /
																																			 * /
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println
																																			 * (
																																			 * studentobj
																																			 * .
																																			 * getLength
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * 
																																			 * for
																																			 * (int
																																			 * i
																																			 * =
																																			 * 0
																																			 * ;
																																			 * i
																																			 * <
																																			 * studentobj
																																			 * .
																																			 * getLength
																																			 * (
																																			 * )
																																			 * ;
																																			 * i
																																			 * +
																																			 * +
																																			 * )
																																			 * {
																																			 * Node
																																			 * row=
																																			 * studentobj
																																			 * .
																																			 * item
																																			 * (
																																			 * i
																																			 * )
																																			 * ;
																																			 * if
																																			 * (row
																																			 * .
																																			 * getNodeType
																																			 * (
																																			 * )
																																			 * =
																																			 * =
																																			 * Node
																																			 * .
																																			 * ELEMENT_NODE)
																																			 * {
																																			 * Element
																																			 * erow
																																			 * =
																																			 * (
																																			 * Element
																																			 * )
																																			 * row;
																																			 * NodeList
																																			 * stditems
																																			 * =
																																			 * erow
																																			 * .
																																			 * getChildNodes
																																			 * (
																																			 * )
																																			 * ;
																																			 * 
																																			 * String
																																			 * line
																																			 * ="";
																																			 * /
																																			 * /
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println
																																			 * (
																																			 * stditems
																																			 * .
																																			 * getLength
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * for
																																			 * (int
																																			 * j
																																			 * =
																																			 * 0;
																																			 * j
																																			 * <
																																			 * stditems
																																			 * .
																																			 * getLength
																																			 * (
																																			 * )
																																			 * ;
																																			 * j
																																			 * +
																																			 * +
																																			 * )
																																			 * {
																																			 * Node
																																			 * value
																																			 * =
																																			 * stditems
																																			 * .
																																			 * item
																																			 * (
																																			 * j
																																			 * )
																																			 * ;
																																			 * 
																																			 * if
																																			 * (value
																																			 * .
																																			 * getNodeType
																																			 * (
																																			 * )
																																			 * =
																																			 * =
																																			 * Node
																																			 * .
																																			 * ELEMENT_NODE)
																																			 * {
																																			 * Element
																																			 * evalue
																																			 * =
																																			 * (Element
																																			 * )
																																			 * value;
																																			 * //
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println
																																			 * (
																																			 * evalue
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * line
																																			 * =line
																																			 * +
																																			 * evalue
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * +
																																			 * ",";
																																			 * 
																																			 * }
																																			 * }
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println
																																			 * (
																																			 * line
																																			 * .
																																			 * substring
																																			 * (
																																			 * 0,
																																			 * line
																																			 * .
																																			 * length
																																			 * (
																																			 * )
																																			 * -
																																			 * 1
																																			 * )
																																			 * )
																																			 * ;
																																			 * }
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * //
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println(
																																			 * "node name ="
																																			 * +nNode
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * Element
																																			 * clable
																																			 * =
																																			 * (Element)
																																			 * eElement
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "formfieldlable"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * 
																																			 * Element
																																			 * cElement
																																			 * =
																																			 * (Element)
																																			 * eElement
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "top"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * Element
																																			 * cElement1
																																			 * =
																																			 * (Element)
																																			 * eElement
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "left"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * Element
																																			 * cElement2
																																			 * =
																																			 * (Element)
																																			 * eElement
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "width"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * Element
																																			 * cElement3
																																			 * =
																																			 * (Element)
																																			 * eElement
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "height"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * 
																																			 * //
																																			 * Element
																																			 * cElement
																																			 * =
																																			 * (Element)
																																			 * //
																																			 * eElement
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "form_coords"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * l
																																			 * =
																																			 * clable
																																			 * .
																																			 * getAttribute
																																			 * (
																																			 * "name"
																																			 * )
																																			 * ;
																																			 * x1
																																			 * =
																																			 * Integer
																																			 * .
																																			 * parseInt
																																			 * (
																																			 * top
																																			 * )
																																			 * ;
																																			 * y1
																																			 * =
																																			 * Integer
																																			 * .
																																			 * parseInt
																																			 * (
																																			 * left
																																			 * )
																																			 * ;
																																			 * x2
																																			 * =
																																			 * Integer
																																			 * .
																																			 * parseInt
																																			 * (
																																			 * width
																																			 * )
																																			 * ;
																																			 * y2
																																			 * =
																																			 * Integer
																																			 * .
																																			 * parseInt
																																			 * (
																																			 * height
																																			 * )
																																			 * ;
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println(
																																			 * "LABLE ="
																																			 * +
																																			 * l
																																			 * )
																																			 * ;
																																			 * pdftoText
																																			 * (
																																			 * y1,
																																			 * x1,
																																			 * y2,
																																			 * x2
																																			 * )
																																			 * ;
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println(
																																			 * "LABLE ="
																																			 * +
																																			 * l
																																			 * )
																																			 * ;
																																			 * 
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println(
																																			 * "x1: "
																																			 * +
																																			 * cElement
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println(
																																			 * "y1 : "
																																			 * +
																																			 * cElement1
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println(
																																			 * "x2: "
																																			 * +
																																			 * cElement2
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println(
																																			 * "y2 : "
																																			 * +
																																			 * cElement3
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * 
																																			 * NodeList
																																			 * nList1
																																			 * =
																																			 * doc
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "fieldcoord"
																																			 * )
																																			 * ;
																																			 * for
																																			 * (int
																																			 * j
																																			 * =
																																			 * 0;
																																			 * i
																																			 * <
																																			 * nList1
																																			 * .
																																			 * getLength
																																			 * (
																																			 * )
																																			 * ;
																																			 * i
																																			 * +
																																			 * +
																																			 * )
																																			 * {
																																			 * Node
																																			 * nNode1
																																			 * =
																																			 * nList1
																																			 * .
																																			 * item
																																			 * (
																																			 * i
																																			 * )
																																			 * ;
																																			 * Element
																																			 * eElement1
																																			 * =
																																			 * (Element)
																																			 * nNode1;
																																			 * //
																																			 * System
																																			 * .
																																			 * out
																																			 * .
																																			 * println(
																																			 * "node name ="
																																			 * +nNode
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * Element
																																			 * cElement10
																																			 * =
																																			 * (Element)
																																			 * eElement1
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "top"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * Element
																																			 * cElement11
																																			 * =
																																			 * (Element)
																																			 * eElement1
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "left"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * Element
																																			 * cElement12
																																			 * =
																																			 * (Element)
																																			 * eElement1
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "width"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * Element
																																			 * cElement13
																																			 * =
																																			 * (Element)
																																			 * eElement1
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "height"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * 
																																			 * //
																																			 * Element
																																			 * cElement
																																			 * =
																																			 * (Element)
																																			 * //
																																			 * eElement
																																			 * .
																																			 * getElementsByTagName
																																			 * (
																																			 * "form_coords"
																																			 * )
																																			 * .
																																			 * item
																																			 * (
																																			 * 0
																																			 * )
																																			 * ;
																																			 * a1
																																			 * =
																																			 * Integer
																																			 * .
																																			 * parseInt
																																			 * (
																																			 * cElement10
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * b1
																																			 * =
																																			 * Integer
																																			 * .
																																			 * parseInt
																																			 * (
																																			 * cElement11
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * a2
																																			 * =
																																			 * Integer
																																			 * .
																																			 * parseInt
																																			 * (
																																			 * cElement12
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * b2
																																			 * =
																																			 * Integer
																																			 * .
																																			 * parseInt
																																			 * (
																																			 * cElement13
																																			 * .
																																			 * getTextContent
																																			 * (
																																			 * )
																																			 * )
																																			 * ;
																																			 * pdftoText
																																			 * (
																																			 * b1,
																																			 * a1,
																																			 * b2,
																																			 * a2,
																																			 * l
																																			 * )
																																			 * ;
																																			 * 
																																			 * String
																																			 * open
																																			 * =
																																			 * "<";
																																			 * String
																																			 * close
																																			 * =
																																			 * ">";
																																			 * String
																																			 * endtag
																																			 * =
																																			 * "</";
																																			 * xmlstr
																																			 * +=
																																			 * open
																																			 * +
																																			 * l
																																			 * +
																																			 * close
																																			 * +
																																			 * pdftoText
																																			 * (
																																			 * b1,
																																			 * a1,
																																			 * b2,
																																			 * a2,
																																			 * l)
																																			 * +
																																			 * endtag
																																			 * +
																																			 * l
																																			 * +
																																			 * close;
																																			 * }
																																			 * }
																																			 * }
																																			 * createXml
																																			 * (
																																			 * xmlstr
																																			 * )
																																			 * ;
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * 
																																			 * }
																																			 */

	/***************************************************************************************************************************************/

	public static void main(String[] args) throws COSVisitorException, IOException {
		MainPdf mainPdf = new MainPdf();
		// mainPdf.readXML();
		// mainPdf.pdftoText();
		// System.out.println(pdftoText(""));

		/*
		 * <top>75</top> <left>219</left> <width>243</width> <height>22</height>
		 */

		// System.out.println(MainPdf.pdftoText(75, 219,243, 22));
	}

}
