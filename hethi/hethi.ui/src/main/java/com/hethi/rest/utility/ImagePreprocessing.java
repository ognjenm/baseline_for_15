package com.hethi.rest.utility;

import java.awt.Color;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.Point;
import org.opencv.core.Size;
import org.opencv.highgui.Highgui;
import org.opencv.imgproc.Imgproc;
import org.opencv.photo.Photo;

public class ImagePreprocessing {
	
	  
	
	public void getContrast(String srcPath,String dstPath){
		try {
	         //System.loadLibrary( Core.NATIVE_LIBRARY_NAME );
	         Mat source = Highgui.imread(srcPath, Highgui.CV_LOAD_IMAGE_GRAYSCALE);
	         Mat destination = new Mat(source.rows(),source.cols(),source.type());
	         Imgproc.equalizeHist(source, destination);
	         Highgui.imwrite(dstPath, destination);
	         System.out.println("' Contrast ' Applied");
	         
	      }catch (Exception e) {
	         System.out.println("error: " + e.getMessage());
	      }
	   }
	
	
	
	public	void deskew(String srcPath, String dstPath,double angle) {
		//System.loadLibrary( Core.NATIVE_LIBRARY_NAME );
			Mat src = Highgui.imread(srcPath,  Highgui.CV_LOAD_IMAGE_COLOR);
		    Point center = new Point(src.width()/2, src.height()/2);
		    Mat rotImage = Imgproc.getRotationMatrix2D(center, angle, 1.0);
		    //1.0 means 100 % scale
		    Size size = new Size(src.width(), src.height());
		    Imgproc.warpAffine(src, src, rotImage, size, Imgproc.INTER_LINEAR + Imgproc.CV_WARP_FILL_OUTLIERS);
		    Highgui.imwrite(dstPath, src);
		    System.out.println("' deskew ' Applied");
		    //return src;
	}
	
	
	public void getGrayScale(String srcPath, String dstPath) {

		try {
			File input = new File(srcPath);
			BufferedImage image = ImageIO.read(input);
			int width = image.getWidth();
			int height = image.getHeight();
			for (int i = 0; i < height; i++) {
				for (int j = 0; j < width; j++) {

					Color c = new Color(image.getRGB(j, i));
					int red = (int) (c.getRed() * 0.299);
					int green = (int) (c.getGreen() * 0.587);
					int blue = (int) (c.getBlue() * 0.114);
					Color newColor = new Color(red + green + blue, red + green + blue, red + green + blue);
					image.setRGB(j, i, newColor.getRGB());
				}
			}

			File ouptut = new File(dstPath);
			ImageIO.write(image, "jpg", ouptut);
			 System.out.println("' gray scale ' Applied");

		} catch (Exception e) {
		}
	}
	   
	
	
	
	public void erosion(String srcPath, String dstPath){
	
	try{	
        System.loadLibrary( Core.NATIVE_LIBRARY_NAME );
        Mat source = Highgui.imread(srcPath,  Highgui.CV_LOAD_IMAGE_COLOR);
        Mat destination = new Mat(source.rows(),source.cols(),source.type());
        destination = source;
        int erosion_size = 5;
        Mat element = Imgproc.getStructuringElement(Imgproc.MORPH_RECT, new  Size(2*erosion_size + 1, 2*erosion_size+1));
        Imgproc.erode(source, destination, element);
        Highgui.imwrite(dstPath, destination); 
        System.out.println("' erosion ' Applied");
     }catch (Exception e) {
        System.out.println("error: " + e.getMessage());
     } 
	}
	
	
	public void dilate(String srcPath, String dstPath){
		
		try{	
	        System.loadLibrary( Core.NATIVE_LIBRARY_NAME );
	        Mat source = Highgui.imread(srcPath,  Highgui.CV_LOAD_IMAGE_COLOR);
	        Mat destination = new Mat(source.rows(),source.cols(),source.type());
	        destination = source;
	        int dilation_size=5;
	        Mat element1 = Imgproc.getStructuringElement(Imgproc.MORPH_RECT, new  Size(2*dilation_size + 1, 2*dilation_size+1));
	        Imgproc.dilate(source, destination, element1);
	        Highgui.imwrite(dstPath, destination);
	        System.out.println("' dilate ' Applied");
	     }catch (Exception e) {
	        System.out.println("error: " + e.getMessage());
	     } 
	
	}
	
	
	public void noise(String srcPath, String dstPath){
		try {
	         System.loadLibrary( Core.NATIVE_LIBRARY_NAME );
	         Mat source = Highgui.imread(srcPath, 
	         Highgui.CV_LOAD_IMAGE_GRAYSCALE);
	         Mat destination = new Mat(source.rows(),source.cols(),source.type());
	         Imgproc.equalizeHist(source, destination);
	         Photo.fastNlMeansDenoising(source,destination);
	         Highgui.imwrite(dstPath, destination);
	         System.out.println("' noise ' Applied");
	         
	      }catch (Exception e) {
	         System.out.println("error: " + e.getMessage());
	      }
	   }

	
	public void thershold(String srcPath, String dstPath){

	      try{
	         System.loadLibrary( Core.NATIVE_LIBRARY_NAME );
	         Mat source = Highgui.imread(srcPath,  Highgui.CV_LOAD_IMAGE_COLOR);
	         Mat destination = new Mat(source.rows(),source.cols(),source.type());
	         destination = source;
	         Imgproc.threshold(source,destination,127,255,Imgproc.THRESH_TOZERO);
	         Highgui.imwrite(dstPath, destination);
	         System.out.println("' thershold ' Applied");
	      }catch (Exception e) {
	         System.out.println("error: " + e.getMessage());
	      }
	   
	   }

	
	
	
	
	/*public void resize(String srcPath, String dstPath){

	      try{
	    	  //Rectangle rect=new Rectangle(0, 0, 500, 500);
	    	  
	    	  Mat croppedimage = cropImage(srcPath);
	    		Mat resizeimage = new Mat();
	    		Size sz = new Size(100,100);
	    		Imgproc.resize( croppedimage, resizeimage, sz );
	    		
	      }catch (Exception e) {
	         System.out.println("error: " + e.getMessage());
	      }
	   
	   }*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public static void main(String[] args) {
		//String imageSourcePath="D:/images/dimension/";
		String srcPath="D:/images/dimension/new.jpg";
		String dstPath="output/new_processed.jpg";
		
		ImagePreprocessing imagePreprocessing=new ImagePreprocessing();
		imagePreprocessing.getContrast(srcPath,dstPath);
		//imagePreprocessing.deskew(srcPath,dstPath,19);
		//imagePreprocessing.noise(srcPath,dstPath);
		//imagePreprocessing.erosion(srcPath,dstPath);
		//imagePreprocessing.dilate(srcPath,dstPath);
		//imagePreprocessing.getGrayScale(srcPath,dstPath);
		//imagePreprocessing.thershold(srcPath,dstPath);

	}

}
