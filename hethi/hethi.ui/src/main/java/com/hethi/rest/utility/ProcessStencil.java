package com.hethi.rest.utility;

import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.util.PDFImageWriter;
import org.apache.pdfbox.util.PDFTextStripperByArea;
import org.imgscalr.Scalr;

import com.hethi.rest.stencil.StencilField;
import com.hethi.rest.stencil.StencilParser;

public class ProcessStencil {
	private String StencilImagePath = "";
	private String StencilDefPath = "";
	private List StencilDefinitions;
	private String StencilTempTxtOutPath = "";
	private String StencilTempImgOutPath = "";
	private String TesseractPath = "";
	private String JodConverterPath = "";
	private String sOpenOfficePath = "";
	private String sOpenOfficeInitCommand = "";

	public ProcessStencil(String sImgPath, String sStenDefPath, String sTesseractPath, String sJodPath) {

		System.out.println("Starting process " + sImgPath + " " + sStenDefPath);
		StencilImagePath = sImgPath;
		StencilDefPath = sStenDefPath;
		TesseractPath = sTesseractPath;
		JodConverterPath = sJodPath;
		StencilParser sp = new StencilParser();
		sp.runFile(StencilDefPath);
		StencilDefinitions = sp.getParsedData();
		String sCustPath = StencilImagePath.substring(0, StencilImagePath.lastIndexOf('.'));
		java.io.File f = new File(sCustPath);
		if (!f.exists()) {
			f.mkdirs();
		}
		StencilTempTxtOutPath = StencilImagePath.replace("_stencil", "").substring(0, StencilImagePath.lastIndexOf('.'))
				+ "\\temp_text_output";
		StencilTempImgOutPath = StencilImagePath.replace("_stencil", "").substring(0, StencilImagePath.lastIndexOf('.'))
				+ "\\temp_image_output";
		File f1 = new File(StencilTempTxtOutPath);
		if (!f1.exists()) {
			f1.mkdirs();
		}

		File f2 = new File(StencilTempImgOutPath);
		if (!f2.exists()) {
			f2.mkdirs();
		}
	}

	public String convertOfficeToPdf(String sSource) throws IOException {
		String sPdfPath = sSource.substring(0, sSource.lastIndexOf('.'));
		sPdfPath += ".pdf";

		String sCmdLine = "java -jar \"" + JodConverterPath + "\" \"" + sSource + "\" \"" + sPdfPath + "\"";
		System.out.println("convertofficeToPdf(): converting office file to pdf by cmd" + sCmdLine);
		final File batch = File.createTempFile("temp", ".bat");
		try (PrintStream ps = new PrintStream(batch)) {
			ps.println(sCmdLine);
		}

		System.out.println(batch.getAbsolutePath());
		try {
			Process p = Runtime.getRuntime().exec(batch.getAbsolutePath());
			System.out.println("Converting Office  file" + sSource + " to pdf");
			p.waitFor();
		} catch (InterruptedException e) {
			System.out.println("Exception:" + e.getMessage());
			return "";
		}

		return sPdfPath;
	}

	public static void StartOpenOffice(String sOpenOffPath, String sOpenOffCmd) {

		String sCmdLine = "" + sOpenOffPath + sOpenOffCmd;

		try {

			final File batch = File.createTempFile("temp", ".bat");
			try (PrintStream ps = new PrintStream(batch)) {

				ps.println(sCmdLine);
			}

			System.out.println(batch.getAbsolutePath());

			Process p = Runtime.getRuntime().exec(batch.getAbsolutePath());
			System.out.println("Initiating Open Office");
			p.waitFor();
		}

		catch (InterruptedException e) {
			System.out.println("Exception:" + e.getMessage());

		} catch (Exception e) {
			System.out.println("Exception:" + e.getMessage());
		}

	}

	public ProcessStencil(String sMode, String sTesseractPath, String sJodPath, String sOpenOffPath,
			String sOpenOffInitCmd) {
		TesseractPath = sTesseractPath;
		JodConverterPath = sJodPath;
		sOpenOfficePath = sOpenOffPath;
		sOpenOfficeInitCommand = sOpenOffInitCmd;

	}

	public ProcessStencil(String sPdfPath, String sStenDefPath, String sType, String sTesseractPath, String sJodPath,
			String sOpenOffPath, String sOpenOffInitCmd) throws IOException, Exception {
		System.out.println("Starting process PDF " + sPdfPath + " " + sStenDefPath);
		// ConvertPdfToImage(sPdfPath);
		convertPdfToImage("", sPdfPath, null, "jpg", 1, 1, "rgb");
		TesseractPath = sTesseractPath;
		JodConverterPath = sJodPath;
		StencilImagePath = sPdfPath;
		StencilDefPath = sStenDefPath;
		sOpenOfficePath = sOpenOffPath;
		sOpenOfficeInitCommand = sOpenOffInitCmd;
		if (sType.toLowerCase().equals("office")) {

			StencilImagePath = convertOfficeToPdf(StencilImagePath);
		}
		StencilParser sp = new StencilParser();
		sp.runFile(StencilDefPath);
		StencilDefinitions = sp.getParsedData();
		String sCustPath = StencilImagePath.substring(0, StencilImagePath.lastIndexOf('.'));
		java.io.File f = new File(sCustPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		// not required for PDF
		/*
		 * StencilTempTxtOutPath = StencilImagePath.replace("_stencil", "")
		 * .substring(0, StencilImagePath.lastIndexOf('.')) +
		 * "\\temp_text_output"; StencilTempImgOutPath =
		 * StencilImagePath.replace("_stencil", "") .substring(0,
		 * StencilImagePath.lastIndexOf('.')) + "\\temp_image_output"; File f1 =
		 * new File(StencilTempTxtOutPath); if (!f1.exists()) { f1.mkdirs(); }
		 * 
		 * File f2 = new File(StencilTempImgOutPath); if (!f2.exists()) {
		 * f2.mkdirs(); }
		 */
	}

	public void StartProcessingPdf() throws IOException {
		PDDocument doc = PDDocument.load(StencilImagePath);
		String sFieldName = "", sCoords = "";
		int top = 0, left = 0, height = 0, width = 0;
		int pageno = 0;
		String sStencilContent = new String(Files.readAllBytes(Paths.get(StencilDefPath)), StandardCharsets.UTF_8);
		Iterator it = StencilDefinitions.iterator();
		while (it.hasNext()) {
			StencilField sCurField = new StencilField();
			sCurField = (StencilField) it.next();
			String[] s = sCurField.getCoords().split(",");
			if (s.length == 4) {
				if (s[0].indexOf('.') > 0)
					top = Integer.parseInt(s[0].substring(0, s[0].indexOf('.')));
				else
					top = Integer.parseInt(s[0]);
				if (s[1].indexOf('.') > 0)
					left = Integer.parseInt(s[1].substring(0, s[1].indexOf('.')));
				else
					left = Integer.parseInt(s[1]);

				if (s[2].indexOf('.') > 0)
					width = Integer.parseInt(s[2].substring(0, s[2].indexOf('.')));
				else
					width = Integer.parseInt(s[2]);
				if (s[3].indexOf('.') > 0)
					height = Integer.parseInt(s[3].substring(0, s[3].indexOf('.')));
				else
					height = Integer.parseInt(s[3]);

				if (top <= 0 || left <= 0 || height <= 0 || width <= 0)
					continue;

			}
			PDFTextStripperByArea stripper = new PDFTextStripperByArea();
			stripper.addRegion("testRegion", new java.awt.Rectangle(left, top, width, height));
			stripper.extractRegions((PDPage) doc.getDocumentCatalog().getAllPages().get(pageno));

			String text = stripper.getTextForRegion("testRegion");
			System.out.println(" " + text);
			sStencilContent = sStencilContent.replace(sCurField.getName() + "_DATA", "<![CDATA[" + text + "]]>");
		}
		Path dataFile = Files.createFile(Paths.get(StencilDefPath.replace("_stencil", "_data")));
		// Writing to invoice data def
		try (BufferedWriter writer = Files.newBufferedWriter(dataFile, Charset.defaultCharset())) {
			writer.append(sStencilContent);

		} catch (IOException exception) {
			System.out.println("Error writing to file");
		}

	}

	public String StartProcessing() throws IOException {
		BufferedImage bIStencil = ImageIO.read(new File(StencilImagePath));
		// get relevant field definition from StencilDefs
		String sFieldName = "", sCoords = "";
		int top = 0, left = 0, height = 0, width = 0;
		Iterator it = StencilDefinitions.iterator();

		while (it.hasNext()) {
			StencilField sCurField = new StencilField();
			sCurField = (StencilField) it.next();
			String[] s = sCurField.getCoords().split(",");
			if (s.length == 4) {
				if (s[0].indexOf('.') > 0)
					top = Integer.parseInt(s[0].substring(0, s[0].indexOf('.')));
				else
					top = Integer.parseInt(s[0]);
				if (s[1].indexOf('.') > 0)
					left = Integer.parseInt(s[1].substring(0, s[1].indexOf('.')));
				else
					left = Integer.parseInt(s[1]);

				if (s[2].indexOf('.') > 0)
					width = Integer.parseInt(s[2].substring(0, s[2].indexOf('.')));
				else
					width = Integer.parseInt(s[2]);
				if (s[3].indexOf('.') > 0)
					height = Integer.parseInt(s[3].substring(0, s[3].indexOf('.')));
				else
					height = Integer.parseInt(s[3]);

				if (top <= 0 || left <= 0 || height <= 0 || width <= 0)
					continue;
				BufferedImage bICurField = bIStencil.getSubimage(left, top, width, height);
				int zoomwidth = width * 2;
				int zoomheight = height * 2;

				BufferedImage bIZoomField = null;
				// Graphics g = bIZoomField.createGraphics();
				bIZoomField = Scalr.resize(bICurField, Scalr.Method.QUALITY, zoomwidth, zoomheight);

				// g.drawImage(bICurField, 0,0,zoomwidth,zoomheight, null);
				ImageIO.write(bIZoomField, "jpeg",
						new File(StencilTempImgOutPath + "\\" + sCurField.getName() + ".jpg"));

			}
		}
		File[] aMediaFiles = new File(StencilTempImgOutPath).listFiles();
		for (File f : aMediaFiles) {
			// rt.exec(new
			// String[]{"c:\\Program Files (x86)\\Tesseract-OCR\\tesseract.exe",
			// f.getAbsolutePath(),
			// f.getAbsolutePath().replace("Field_Images","_Texts").replace(".jpg",
			// ".txt")} ,null);
			String sCmdLine = "\"" + TesseractPath + "\" \"" + f.getAbsolutePath() + "\" \""
					+ f.getAbsolutePath().replace("image_output", "text_output").replace(".jpg", "") + "\"";
			// Process process = new ProcessBuilder(
			// "C:\\Program Files
			// (x86)\\tesseract-OCR\\tesseract.exe",f.getAbsolutePath(),f.getAbsolutePath().replace("_Images","_Texts").replace(".jpg",
			// "")).start();
			// InputStream is = process.getInputStream();
			// InputStreamReader isr = new InputStreamReader(is);
			// final String path = album._playList.getParent();
			final File batch = File.createTempFile("temp", ".bat");
			try (PrintStream ps = new PrintStream(batch)) {
				ps.println(sCmdLine);
			}
			System.out.println(batch.getAbsolutePath());
			try {
				Process p = Runtime.getRuntime().exec(batch.getAbsolutePath());
				System.out.println("processing file" + f.getAbsolutePath());
				p.waitFor();
			} catch (InterruptedException e) {

			}
		}

		StencilTempTxtOutPath = StencilTempTxtOutPath.replace('/', '\\');
		File[] aTextFiles = new File(StencilTempTxtOutPath).listFiles();
		System.out.println("No of files in " + StencilTempTxtOutPath + " is " + aTextFiles.length);
		String sStencilContent = new String(Files.readAllBytes(Paths.get(StencilDefPath)), StandardCharsets.UTF_8);

		for (File f : aTextFiles) {
			String sFldName = f.getName().substring(0, f.getName().lastIndexOf('.'));
			System.out.println("the field name is " + sFldName);
			String sFldContent = new String(Files.readAllBytes(Paths.get(f.getAbsolutePath())), StandardCharsets.UTF_8);
			// <![CDATA[" + sFldContent + "]]>
			sStencilContent = sStencilContent.replace(sFldName + "_DATA", sFldContent);
			System.out.println(
					"Field Name" + sFldName + "  Field Content " + sFldContent + "from file " + f.getAbsolutePath());
		}
		// Paths.get(StencilDefPath.replace("_stencil", "_data"))

		// Path dataFile =
		// Files.createFile(Paths.get(StencilDefPath.replace(".xml", ".xsd")));
		File file = new File(StencilDefPath);
		file.delete();

		Path dataFile = Files.createFile(Paths.get(StencilDefPath));

		System.out.println(" writing to file " + Paths.get(StencilDefPath));
		// Writing to invoice data def
		try (BufferedWriter writer = Files.newBufferedWriter(dataFile, Charset.defaultCharset())) {
			writer.append(sStencilContent);
			return sStencilContent;

		} catch (IOException exception) {
			System.out.println("Error writing to file");
			return "";
		}

	}

	private void ConvertPdfToImage(String sPdfPath) throws IOException {
		// converted images from pdf document are saved here

		File sourceFile = new File(sPdfPath);
		File destinationFile = new File(sPdfPath.replace(".pdf", ".jpg"));

		if (sourceFile.exists()) {
			System.out.println("Images copied to Folder: " + destinationFile.getName());
			PDDocument document = PDDocument.load(sourceFile);
			List<PDPage> list = document.getDocumentCatalog().getAllPages();
			System.out.println("Total files to be converted -> " + list.size());

			String fileName = sourceFile.getName().replace(".pdf", "");
			int pageNumber = 1;
			for (PDPage page : list) {
				BufferedImage image = page.convertToImage();

				File outputfile = new File(sPdfPath.replace(".pdf", ".jpg"));
				System.out.println("Image Created -> " + outputfile.getName());
				ImageIO.write(image, "jpeg", outputfile);

				pageNumber++;
				break;
			}
			document.close();
			System.out.println("Converted Images are saved at -> " + destinationFile.getAbsolutePath());
		} else {
			System.err.println(sourceFile.getName() + " File not exists");
		}

	}

	private void convertPdfToImage(String password, String pdfInputFile, String outputPath, String imageFormat,
			int startPage, int endPage, String color) throws Exception {
		/*
		 * String password = ""; String pdfFile = "f:/sample_invoice.pdf";
		 * String outputPrefix = "F:/"; String imageFormat = "jpg"; int
		 * startPage = 1; int endPage = Integer.MAX_VALUE; String color = "rgb";
		 */
		int resolution;
		try {
			resolution = Toolkit.getDefaultToolkit().getScreenResolution();
		} catch (HeadlessException e) {
			resolution = 96;
		}

		if (pdfInputFile == null) {
			System.out.println("Invalid PDF Source...");
			return;
		} else {
			if (outputPath == null) {
				outputPath = pdfInputFile.substring(0, pdfInputFile.lastIndexOf('.'));
			}

			PDDocument document = null;
			try {
				document = PDDocument.load(pdfInputFile);
				// document.print();

				if (document.isEncrypted()) {
					try {
						document.decrypt(password);
					} catch (Exception e) {

						// they didn't supply a password and the default of ""
						// was wrong.
						System.err.println("Error: The document is encrypted.");
						return;

					}
				}
				int imageType = 24;
				if ("bilevel".equalsIgnoreCase(color)) {
					imageType = BufferedImage.TYPE_BYTE_BINARY;
				} else if ("indexed".equalsIgnoreCase(color)) {
					imageType = BufferedImage.TYPE_BYTE_INDEXED;
				} else if ("gray".equalsIgnoreCase(color)) {
					imageType = BufferedImage.TYPE_BYTE_GRAY;
				} else if ("rgb".equalsIgnoreCase(color)) {
					imageType = BufferedImage.TYPE_INT_RGB;
				} else if ("rgba".equalsIgnoreCase(color)) {
					imageType = BufferedImage.TYPE_INT_ARGB;
				} else {
					System.err.println("Error: the number of bits per pixel must be 1, 8 or 24.");
					System.exit(2);
				}

				// Make the call
				PDFImageWriter imageWriter = new PDFImageWriter();
				boolean success = imageWriter.writeImage(document, imageFormat, password, startPage, endPage,
						outputPath, imageType, 72);
				if (!success) {
					System.err.println("Error: no writer found for image format '" + imageFormat + "'");
					System.exit(1);
				} else {
					File f = new File(pdfInputFile.replace(".pdf", startPage + ".jpg"));
					File fdest = new File(pdfInputFile.replace(".pdf", "_preview.jpg"));
					if (f.exists()) {
						f.renameTo(fdest);
						if (fdest.exists()) {
							System.out.println(
									"The image file successfully moved to " + pdfInputFile.replace(".pdf", ".jpg"));
						}
					}
				}

			} catch (Exception e) {
				System.err.println(e);
			} finally {
				if (document != null) {
					document.close();
				}
			}
		}
	}
}