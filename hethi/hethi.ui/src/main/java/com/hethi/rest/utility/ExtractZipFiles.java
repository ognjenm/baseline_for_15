package com.hethi.rest.utility;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.hethi.daas.ImageIO.ImageProcessesingServices;

import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

public class ExtractZipFiles {
	public ArrayList<String> readFile() throws ParseException {
		String content = "";
		BufferedReader br = null;
		try {
			String sCurrentLine;
			br = new BufferedReader(new FileReader("src\\web\\server\\appConfig\\appconfig.json"));

			while ((sCurrentLine = br.readLine()) != null) {
				content = content + (sCurrentLine);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		JSONObject appConfigJson = (JSONObject) new JSONParser().parse(content);
		JSONObject configuration = (JSONObject) new JSONParser().parse(appConfigJson.get("configuration").toString());
		String filepath = configuration.get("filepath").toString();
		String portno = configuration.get("portno").toString();
		String domain = configuration.get("domain").toString();
		String baseUrl = domain + portno;
		ArrayList<String> str = new ArrayList<String>();
		str.add(baseUrl);
		str.add(filepath);
		System.out.println("base url=" + str.get(0));
		return str;
	}

	public void writeToFile(java.io.InputStream inputStream, String uploadedFileLocation) {

		try {
			OutputStream out = new FileOutputStream(new File(uploadedFileLocation));
			int read = 0;
			byte[] bytes = new byte[1024];

			out = new FileOutputStream(new File(uploadedFileLocation));
			while ((read = inputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private static final int BUFFER_SIZE = 4096;

	public void extractFile(ZipInputStream zipIn, String filePath) throws IOException {
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filePath));
		byte[] bytesIn = new byte[BUFFER_SIZE];
		int read = 0;
		while ((read = zipIn.read(bytesIn)) != -1) {
			bos.write(bytesIn, 0, read);
		}
		bos.close();
	}

	@SuppressWarnings("rawtypes")
	public String unzipFile(String filepath, String destDire, int upload_id, int customer_id, String efs, int user_id,
			String baseUrl, String fileRealName)
					throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException,
					SQLException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {
		Gson gson = new Gson();
		String result = null;
		File destDir = new File(destDire);

		if (!destDir.exists()) {
			destDir.mkdir();
		}
		ZipInputStream zipIn = new ZipInputStream(new FileInputStream(filepath));
		ZipEntry entry = zipIn.getNextEntry();
		// iterates over entries in the zip file
		while (entry != null) {
			System.out.println("first.."+entry.getName());
			int length_of_file = entry.getName().length();
			int last_index = entry.getName().lastIndexOf("/");
			String fileName = entry.getName().substring(last_index + 1, length_of_file);
			System.out.println("second...."+fileName);
			String filePath = destDire + File.separator + fileName;
			if (!entry.isDirectory()) {
				// if the entry is a file, extracts it
				int last = entry.getName().lastIndexOf('/');
				int length = entry.getName().length();
				String temp_name = destDire.substring(destDire.lastIndexOf('/') + 1, destDire.length());
				String file_name = temp_name + "/" + entry.getName().substring(last + 1, length);
				String file_type = file_name.substring(file_name.lastIndexOf('.') + 1, file_name.length());
				int file_size = (int) entry.getSize();
				String file_path = filepath.substring(0, filepath.lastIndexOf('/')) + "/" + file_name;
				int i = file_path.lastIndexOf("/images/");
				String domain = file_path.substring(i, file_path.length());
				file_path = baseUrl + domain;
				QueryExecutors object2 = new QueryExecutors();
				System.out.println("Pdf Path IS " + "src/web/client"
						+ file_path.substring(file_path.indexOf("/images"), file_path.length()));
								String sql1 = "{ call store_uploaded_document_files('" + upload_id + "','" + customer_id + "'," + "'"
						+ efs + "','" + user_id + "','" + fileName + "','" + file_type + "','" + file_size + "','"
						+ file_path + "')}";
				System.out.println(sql1);
				ArrayList<ArrayList> resultList1 = object2.callProcedure(sql1);
				result = gson.toJson(resultList1);
				extractFile(zipIn, filePath);
				ImageProcessesingServices.getFullOCR(
						"src/web/client" + file_path.substring(file_path.indexOf("/images"), file_path.length()));


			} else {
				// if the entry is a directory, make the directory
				File dir = new File(destDire);
				dir.mkdir();
			}
			zipIn.closeEntry();
			entry = zipIn.getNextEntry();
		}
		zipIn.close();
		return result;
	}
}
