package com.hethi.adapters;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.messaging.Message;

import com.github.junrar.Archive;
import com.github.junrar.exception.RarException;
import com.github.junrar.rarfile.FileHeader;
import com.google.gson.Gson;
import com.hethi.daas.ImageIO.ImageProcessesingServices;
import com.hethi.daas.OCR.PDFImageProcessing;
import com.hethi.dass.util.ImageValidator;
import com.hethi.rest.interfaces.WorkflowInterface;
//import com.hethi.dass.util.ImageValidator;
import com.hethi.rest.model.UploadBeans;
import com.hethi.rest.utility.ExtractZipFiles;
import com.hethi.rest.utility.FileOperations;
import com.hethi.rest.utility.QueryExecutors;
import com.hethi.rest.utility.WriteToFile;

import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

public class FTP {

	public Message<String> handleFile(File file)
			throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Message<String> msg = null;
		int lastIndex = file.getName().lastIndexOf('.');
		int file_length = file.getName().length();
		String file_type = file.getName().substring(lastIndex + 1, file_length);
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		String file_path = currentDir + "src/web/client/images/ftp/" + file.getName();
		// boolean flag=false;

		String file_name = file.getName();
		String file_size = String.valueOf(file.length());
		String newFilePath = file_path.substring(0, file_path.lastIndexOf("/ftp/")) + "/ftp_old";
		FileOperations obj = new FileOperations();
		obj.renameFile(file_path, newFilePath, file_name);
		file_path = newFilePath + "/" + file_name;
		Map<String, String> mapObject = new HashMap<String, String>();
		mapObject.put("filePath", file_path);
		mapObject.put("fileName", file_name);
		mapObject.put("fileType", file_type);
		mapObject.put("fileSize", file_size);
		Gson gson = new Gson();
		String returnString = gson.toJson(mapObject);
		if ((!file_type.equals("zip"))) {
			if ((!file_type.equals("rar")))
				file_type = "single";
		}

		if (file.isDirectory())
			file_type = "folder";
		else
			System.out.println("File " + file.getName() + " is at receive channel.");
		msg = MessageBuilder.withPayload(returnString).setHeader("fileType", file_type).build();
		return msg;
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

	public String unzipFile(String JSONData) throws IOException, ParseException {

		JSONObject jsonObj = (JSONObject) new JSONParser().parse(JSONData);
		System.out.println(jsonObj.get("fileName").toString() + " is at Unzip channel..");
		String destDirPath = jsonObj.get("filePath").toString().split(".zip")[0];
		File destDir = new File(destDirPath);
		if (!destDir.exists()) {
			destDir.mkdir();
		}
		ZipInputStream zipIn = new ZipInputStream(new FileInputStream(jsonObj.get("filePath").toString()));
		ZipEntry entry = zipIn.getNextEntry();
		// iterates over entries in the zip file
		while (entry != null) {
			int length_of_file = entry.getName().length();
			int last_index = entry.getName().lastIndexOf("/");
			String fileName = entry.getName().substring(last_index + 1, length_of_file);
			String filePath = jsonObj.get("filePath").toString().split(".zip")[0] + File.separator + fileName;
			if (!entry.isDirectory()) {
				// if the entry is a file, extracts it
				extractFile(zipIn, filePath);
			}
			zipIn.closeEntry();
			entry = zipIn.getNextEntry();
		}
		Map<String, String> mapObject = new HashMap<String, String>();
		mapObject.put("filePath", jsonObj.get("filePath").toString());
		mapObject.put("fileName", jsonObj.get("fileName").toString());
		mapObject.put("fileType", jsonObj.get("fileType").toString());
		mapObject.put("fileSize", jsonObj.get("fileSize").toString());
		Gson gson = new Gson();
		String returnString = gson.toJson(mapObject);
		zipIn.close();
		return returnString;
	}

	@SuppressWarnings("rawtypes")
	public Message<String> saveFile(String JSONData)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {

		Message<String> msg = null;
		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject) new JSONParser().parse(JSONData);
			System.out.println("File store channel enabled for " + jsonObj.get("fileName").toString());
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "{ call store_uploaded_document('" + jsonObj.get("fileName").toString() + "','"
				+ jsonObj.get("fileType").toString() + "','" + Integer.parseInt(jsonObj.get("fileSize").toString())
				+ "','1')}";
		QueryExecutors executor = new QueryExecutors();
		ArrayList<ArrayList> result = executor.callProcedure(sql);
		String upload_idString = result.get(0).get(0).toString();
		@SuppressWarnings("unused")
		JSONObject jsonObject = null;
		String upload_id = null;
		Gson gson = new Gson();
		UploadBeans bean = gson.fromJson(upload_idString, UploadBeans.class);
		upload_id = String.valueOf(bean.getUpload_id());

		
		String cus_id ="1";
		String sfs_uin = "csfs100102";
		String current_channel= "daas.fullextract";

		String fileType = jsonObj.get("fileType").toString();
		Map<String, String> mapObj = new HashMap<String, String>();
		if (fileType.equals("zip")) {
			mapObj.put("fileLocation", jsonObj.get("filePath").toString().split(".zip")[0]);
			mapObj.put("fileName", jsonObj.get("fileName").toString());
			mapObj.put("uploadId", upload_id);
			mapObj.put("customer_id",cus_id);
			mapObj.put("efs_uin","");
			mapObj.put("sfs_uin",sfs_uin );
			mapObj.put("current_channel", current_channel);
			mapObj.put("uid", upload_id);
		} else {
			mapObj.put("fileLocation", jsonObj.get("filePath").toString());
			mapObj.put("fileName", jsonObj.get("fileName").toString());
			mapObj.put("fileType", jsonObj.get("fileType").toString());
			mapObj.put("fileSize", jsonObj.get("fileSize").toString());
			mapObj.put("uploadId", upload_id);
			mapObj.put("customer_id",cus_id);
			mapObj.put("efs_uin","");
			mapObj.put("sfs_uin",sfs_uin );
			mapObj.put("current_channel", current_channel);
			mapObj.put("uid", upload_id);
		}
		String file_type = jsonObj.get("fileType").toString();
		if ((!file_type.equals("zip"))) {
			if ((!file_type.equals("rar")))
				file_type = "single";
		}
//		Gson gson = new Gson();
		String returnContent = gson.toJson(mapObj);
		msg = MessageBuilder.withPayload(returnContent).setHeader("fileType", file_type).build();
		return msg;
	}

	public void handleException() {
		System.out.println("Exception channel enabled..");
	}

	@SuppressWarnings({ "rawtypes", "unused" })
	public String listFolderContents(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, IOException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {

		
		JSONObject jsonObj = (JSONObject) new JSONParser().parse(JSONData);
		String folderLocation = jsonObj.get("fileLocation").toString();
		final File folder = new File(folderLocation);
		for (final File fileEntry : folder.listFiles()) {
			
			if (fileEntry.isDirectory()) {
				listFolderContents(JSONData);
			} else {
				ImageValidator imgValid=new ImageValidator();
				
				int last_index = fileEntry.getName().lastIndexOf('.');
				int filename_length = fileEntry.getName().length();
				String fileName = fileEntry.getName();
				String fileType = fileName.substring(last_index + 1, filename_length);
				String filePath = folderLocation + "/" + fileEntry.getName();
				ExtractZipFiles extract = new ExtractZipFiles();
				ArrayList<String> str = extract.readFile();
				String domain = str.get(0);
				Long today=new Date().getTime();
//				filePath=filePath.substring(0,filePath.lastIndexOf('.')).concat(today.toString());
//				fileName=fileName.substring(0,fileName.lastIndexOf('.')).concat(today.toString());
//                
				
				filePath = filePath.split("client")[1];
//				if(imgValid.validate(fileEntry.toString())){
//					if(filePath.endsWith(".pdf")){
//						PDFImageProcessing pdfImg=new PDFImageProcessing();
//						try {
//							pdfImg.convertPdfToImage("", filePath, null, "jpg", 1, 1, "rgb");
//							filePath=filePath.replace(".pdf", ".jpg");
//						} catch (Exception e) {
//							// TODO Auto-generated catch block
//							e.printStackTrace();
//						}
//					}
//					else{
//						ImageProcessesingServices.getFullOCR(new File("src/web/client"+filePath.substring(filePath.indexOf("/images"),filePath.length())));
//					}
				filePath = domain + filePath;

				String sql = "{ call store_uploaded_document_files('"
						+ Integer.parseInt(jsonObj.get("uploadId").toString()) + "','1'," + "'cefs100101','1','"
						+ fileName + "','" + fileType + "','" + fileEntry.length() + "','" + filePath
						+ "')}";
				QueryExecutors executor = new QueryExecutors();
				System.out.println("List folder channel is enabled for " + fileEntry.getName());
				ArrayList<ArrayList> result = executor.callProcedure(sql);
//				}else
//				{
//					System.out.println("The File Format is Not Image");
//				}
			}
		}
		return JSONData;
	}

	public String saveFileDetails(String JSONData) throws ParseException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, IOException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {
		JSONObject jsonObj = (JSONObject) new JSONParser().parse(JSONData);
		String filePath = jsonObj.get("fileLocation").toString();
		ExtractZipFiles extract = new ExtractZipFiles();
		ArrayList<String> str = extract.readFile();
		String domain = str.get(0);
		filePath = filePath.split("client")[1];

		String actualFile = jsonObj.get("fileName").toString();
		Long today=new Date().getTime();
		String fileType=filePath.substring(filePath.lastIndexOf("."),filePath.length());
		String tempFile=filePath.replace('\\', '/');
		tempFile="src/web/"+tempFile;
//		filePath=filePath.substring(0,filePath.lastIndexOf('.')).concat(today.toString())+fileType;
		String fileName=actualFile;
//		WriteToFile wFile=new WriteToFile();
//		System.out.println(wFile.fileNameUpdation(tempFile, today).getName());;
		ImageValidator imgValid=new ImageValidator();
        System.out.println("image here..."+fileName);
		if(imgValid.validate(fileName)){
		if(filePath.endsWith(".pdf")){
			PDFImageProcessing pdfImg=new PDFImageProcessing();
			try {
				pdfImg.convertPdfToImage("", filePath, null, "jpg", 1, 1, "rgb");
				filePath=filePath.replace(".pdf", ".jpg");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			ImageProcessesingServices.getFullOCR("src/web/client"+filePath.substring(filePath.indexOf("/images"),filePath.length()));
		}
		filePath = domain + filePath;
		
		String sql = "{ call store_uploaded_document_files('" + jsonObj.get("uploadId") + "','1',"
				+ "'cefs100101','1','" + fileName + "','" + jsonObj.get("fileType") + "','" + jsonObj.get("fileSize")
				+ "','" + filePath + "')}";
		QueryExecutors executor = new QueryExecutors();
		@SuppressWarnings({ "rawtypes", "unused" })
		ArrayList<ArrayList> result = executor.callProcedure(sql);
		System.out.println("File details store channel is enabled for " + fileName);
		}else
		{
			System.out.println("The File Format is Not Image");
		}
		return JSONData;
	}

	public void successMethod(String JSONData) throws ParseException, IOException {
		System.out.println("Success channel enabled..");
		System.out.println("---------------------------------");
		AbstractApplicationContext context = new ClassPathXmlApplicationContext("/spring/hethi-workflow-services.xml");
		WorkflowInterface test = (WorkflowInterface) context.getBean("WorkflowInterfaceBean");
		String response = test.startProcess(JSONData);
		System.out.println("response: " + response);
	}

	public void waitForNewFile() {
		System.out.println("Waiting for new file arrival..");
		System.out.println("---------------------------------");
	}

	public String extractArchive(String JSONData) throws InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException, ParseException {
		JSONObject jsonObj = (JSONObject) new JSONParser().parse(JSONData);
		String archive = jsonObj.get("filePath").toString();
		String fileName = jsonObj.get("fileName").toString();
		String fileSize = jsonObj.get("fileSize").toString();
		System.out.println("haha" + fileName + " jhdf " + archive);
		String destination = archive.substring(0, archive.lastIndexOf("/"));
		if (archive == null || destination == null) {
			throw new RuntimeException("archive and destination must me set");
		}
		File arch = new File(archive);
		if (!arch.exists()) {
			throw new RuntimeException("the archive does not exit: " + archive);
		}
		File dest = new File(destination);
		if (!dest.exists()) {
			dest.mkdir();
			System.out.println("created.....");
		}
		return extractArchive(arch, dest, fileName, fileSize, archive);
	}

	@SuppressWarnings("unused")
	public static String extractArchive(File arch, File destination, String fileName, String fileSize, String archive)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		String result = "";
		String filepath = "";
		Archive arch1 = null;
		try {
			arch1 = new Archive(arch);
		} catch (RarException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		FileHeader fh = null;
		if (arch1 != null) {
			if (arch1.isEncrypted()) {
				System.out.println("archive is encrypted cannot extreact");
			}

			while (true) {
				fh = arch1.nextFileHeader();
				if (fh == null) {
					break;
				}
				if (fh.isEncrypted()) {
					System.out.println("file is encrypted cannot extract: " + fh.getFileNameString());
					continue;
				}
				System.out.println("extracting: " + fh.getFileNameString());
				try {
					if (!fh.isDirectory()) {
						System.out.println("!fh.isDirectory()");
						File f = createFile(fh, destination, archive);
						OutputStream stream = new FileOutputStream(f);
						fh.setFileNameW(fh.getFileNameW());
						arch1.extractFile(fh, stream);
						stream.close();
						filepath = f.getPath().substring(0, f.getPath().lastIndexOf('\\')).replace('\\', '/');
					}
				} catch (IOException e) {
					System.out.println("error extracting the file" + e);
				} catch (RarException e) {
					System.out.println("error extraction the file" + e);
				}
			}
		}
		Map<String, String> mapObject = new HashMap<String, String>();
		mapObject.put("filePath", filepath);
		mapObject.put("fileName", fileName);
		mapObject.put("fileType", "rar");
		mapObject.put("fileSize", fileSize);
		Gson gson = new Gson();
		String returnString = gson.toJson(mapObject);
		System.out.println("return String=" + returnString);
		return returnString;
	}

	private static File createFile(FileHeader fh, File destination, String archive) throws IOException {
		File f = null;
		String name = null;
		if (fh.isFileHeader() && fh.isUnicode()) {
			name = fh.getFileNameW();
		} else if (fh.isFileHeader() && !fh.isUnicode()) {
			String filePath = archive.split(".rar")[0];
			File file = new File(filePath);
			file.mkdir();
			destination = file;
			name = fh.getFileNameString();
		} else {
		}
		f = new File(destination, name);
		if (!f.exists()) {
			try {
				f = makeFile(destination, name);
			} catch (IOException e) {
				System.out.println("error creating the new file: " + f.getName());
			}
		}
		return f;
	}

	private static File makeFile(File destination, String name) throws IOException {
		String[] dirs = name.split("\\\\");
		System.out.println("dirs=" + dirs);
		if (dirs == null) {
			return null;
		}
		String path = "";
		int size = dirs.length;
		if (size == 1) {
			System.out.println("size == 1");
			return new File(destination, name);
		} else if (size > 1) {
			System.out.println("size > 1");
			for (int i = 0; i < dirs.length - 1; i++) {
				path = path + File.separator + dirs[i];
				path = path.substring(0, path.lastIndexOf('\\'));
				System.out.println("Path==" + path);
				new File(destination, path).mkdir();
			}
			path = path + File.separator + dirs[dirs.length - 1];

			File f = new File(destination, path);
			f.createNewFile();
			return f;
		} else {
			return null;
		}
	}

	private static void createDirectory(FileHeader fh, File destination) {
		File f = null;
		if (fh.isDirectory() && fh.isUnicode()) {
			System.out.println("fh.isDirectory() && fh.isUnicode() ");
			f = new File(destination, fh.getFileNameW());
			if (!f.exists()) {
				makeDirectory(destination, fh.getFileNameW());
			}
		} else if (fh.isDirectory() && !fh.isUnicode()) {
			System.out.println("fh.isDirectory() && !fh.isUnicode()");
			f = new File(destination, fh.getFileNameString());
			if (!f.exists()) {
				makeDirectory(destination, fh.getFileNameString());
			}
		} else {
			System.out.println("fh is not a directory...");
		}
	}

	private static void makeDirectory(File destination, String fileName) {
		String dirs = fileName;
		System.out.println("file name=" + dirs);
		if (dirs == null) {
			return;
		}
		String path = "";
		path = path + File.separator + dirs;
		new File(destination, path).mkdir();
	}

}
