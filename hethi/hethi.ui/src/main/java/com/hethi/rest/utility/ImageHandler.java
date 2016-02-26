package com.hethi.rest.utility;

//import java.awt.image.BufferedImage;
import java.io.File;
//import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
//import javax.imageio.metadata.IIOMetadata;
import javax.imageio.stream.FileImageInputStream;
//import javax.swing.plaf.synth.SynthSeparatorUI;

//import org.w3c.dom.Element;
//import org.w3c.dom.Node;
//
//import com.sun.image.codec.jpeg.ImageFormatException;
//import com.sun.image.codec.jpeg.JPEGCodec;
//import com.sun.image.codec.jpeg.JPEGEncodeParam;
//import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageHandler {

	public File changeDPI(String fileName, int dpiValue) throws  IOException {

		File infile = new File(fileName);
		String outfileName = fileName.substring(0, fileName.lastIndexOf("."));

		File outfile = new File(outfileName + "_output" + new Date().getTime() + ".jpg");

		ImageReader reader = ImageIO.getImageReadersByFormatName("jpg").next();
		reader.setInput(new FileImageInputStream(infile), true, false);
//		IIOMetadata data = reader.getImageMetadata(0);
//		BufferedImage image = reader.read(0);

		/*
		 * Element tree = (Element)
		 * data.getAsTree("javax_imageio_jpeg_image_1.0"); Element jfif =
		 * (Element) tree.getElementsByTagName("app0JFIF").item(0); for (int i =
		 * 0; i < jfif.getAttributes().getLength(); i++) { Node attribute =
		 * jfif.getAttributes().item(i);
		 * System.out.println(attribute.getNodeName() + "=" +
		 * attribute.getNodeValue()); }
		 */

//		JPEGImageEncoder jpegEncoder = JPEGCodec.createJPEGEncoder(new FileOutputStream(outfile));
//		JPEGEncodeParam jpegEncodeParam = jpegEncoder.getDefaultJPEGEncodeParam(image);
//		jpegEncodeParam.setDensityUnit(JPEGEncodeParam.DENSITY_UNIT_DOTS_INCH);
//		jpegEncodeParam.setXDensity(dpiValue);
//		jpegEncodeParam.setYDensity(dpiValue);
//		jpegEncoder.encode(image, jpegEncodeParam);

		System.out.println("DPI changed successfully");

		return outfile;
	}

}
