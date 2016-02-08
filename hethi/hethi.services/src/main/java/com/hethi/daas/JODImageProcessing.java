package com.hethi.daas;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;

public class JODImageProcessing {

	public static String convertOfficeToPdf(String filePath) throws IOException {

		String JodConverterPath = "E:\\mani\\Workspace\\DaaS\\HethiEngine\\resources\\jod_converter\\jodconverter-cli-2.2.2.jar";

		// String sPdfPath = offFile.substring(0, offFile.lastIndexOf('.'));
		String sPdfPath = filePath.substring(0, filePath.lastIndexOf("."));
		sPdfPath += ".pdf";
		String sCmdLine = "java -jar \"" + JodConverterPath + "\" \"" + filePath + "\" \"" + sPdfPath + "\"";
		System.out.println("convertofficeToPdf(): converting office file to pdf by cmd " + sCmdLine);
		final File batch = File.createTempFile("temp", ".bat");
		try (PrintStream ps = new PrintStream(batch)) {
			ps.println(sCmdLine);
		}
		System.out.println(batch.getAbsolutePath());
		try {
			Process p = Runtime.getRuntime().exec(batch.getAbsolutePath());
			System.out.println("Converting Office  file" + filePath + " to pdf");
			p.waitFor();
			//System.out.println("Converting Office  file" + filePath + " to pdf");
		} catch (InterruptedException e) {
			System.out.println("Exception:" + e.getMessage());
			return "";
		}
		return sPdfPath;
	}

}
