package com.hethi.rest.utility;

import java.awt.Rectangle;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

public class ImageUtil {

	
	public String extractFromImage(String imagePath, int x1, int y1, int x2, int y2) throws TesseractException {

		File imageFile = new File(imagePath);
		Tesseract instance = new Tesseract(); // JNA Interface Mappig
		Properties properties = new Properties();
		try {
			properties.load(new FileInputStream(new File("src/main/resources/application.properties")));
		} catch (IOException e) {
			e.printStackTrace();
		}
		instance.setDatapath(properties.getProperty("tessdataPath"));
		String result = "";
		Rectangle rect = new Rectangle(x1, y1, x2 - x1, y2 - y1);
		try {
			result = instance.doOCR(imageFile, rect);
			System.out.println(result);
		} catch (TesseractException e) {
			System.err.println(e.getMessage());
		}
		// System.out.println("OCR Completed ");
		return result;
	}


}
