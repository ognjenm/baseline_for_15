package com.hethi.rest.utility;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.imageio.ImageIO;

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
	
	/*Method created by Prabhakaran Strat*/
	/*Annotation for image*/
	/*It has only need two coordinate. so you convert 4 coordinate  to 2 coordinate */ 
	
	public void callAnotationImage(int x1, int y1, int x2, int y2) throws IOException{
		ImageUtil imageUtil =new ImageUtil();
		int x=-400;
		int y=50;
		
		
		if(0<x && 0<y){
			imageUtil.normalApply(x, y);
		}
		else if(0<x && 0>y){
			imageUtil.herizanticalApply(x, y);
		}
		else if (0>x && 0<y){
			imageUtil.verticalApply(x, y);
		}
	}
	
	public void normalApply(int x, int y) throws IOException {
		try {

			final BufferedImage image = ImageIO.read(new File("D:\\invoice sample\\Example_002.jpg"));

			Graphics g = image.getGraphics();
			g.setFont(g.getFont().deriveFont(30f));
			
			/* If u want change font and font size use this code */
			
			/* int fontSize = 30;
			 g.setFont(new Font("TimesRoman", Font.BOLD, fontSize));*/
			 
			g.setColor(Color.black);
			g.drawString("160460519P001000472", x, y);
			g.dispose();
			ImageIO.write(image, "jpg", new File("D:\\invoice sample\\Imageannotation.jpg"));
			System.out.println("Created normalApply successfully");

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void verticalApply(int x, int y) throws IOException {
		try {

			final BufferedImage image = ImageIO.read(new File("D:\\invoice sample\\Example_002.jpg"));

			 Graphics2D g2d = (Graphics2D) image.getGraphics();
			 AffineTransform defaultAt = g2d.getTransform();
	         
		        // rotates the coordinate by 90 degree counterclockwise
		        AffineTransform at = new AffineTransform();
		        at.rotate(- Math.PI / 2);
		        g2d.setTransform(at);
			 
			 g2d.setFont(g2d.getFont().deriveFont(30f));
			 g2d.setColor(Color.black);
			 g2d.drawString("160460519P001000472", x, y);
			 g2d.dispose();
			ImageIO.write(image, "jpg", new File("D:\\invoice sample\\Imageannotation.jpg"));
			System.out.println("Created verticalApply successfully");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void herizanticalApply(int x, int y) throws IOException {
		try {
			final BufferedImage image = ImageIO.read(new File("D:\\invoice sample\\Example_002.jpg"));

			 Graphics2D g2d = (Graphics2D) image.getGraphics();
			 AffineTransform defaultAt = g2d.getTransform();
	         
		        // rotates the coordinate by 90 degree counterclockwise
			 AffineTransform at2 = AffineTransform.getQuadrantRotateInstance(1);
		        g2d.setTransform(at2);
		        
			 g2d.setFont(g2d.getFont().deriveFont(30f));
			 g2d.setColor(Color.black);
			 g2d.drawString("160460519P001000472", x, y);
			 g2d.dispose();
			ImageIO.write(image, "jpg", new File("D:\\invoice sample\\Imageannotation.jpg"));
			System.out.println("Created herizanticalApply successfully");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/*Method created by Prabhakaran End*/

}
