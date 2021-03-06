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
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.apache.catalina.util.Base64;
import org.json.simple.JSONArray;
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
import com.hethi.rest.utility.Acknowledgement;
import com.hethi.rest.utility.EmailNotificationService;
import com.hethi.rest.utility.ExtractZipFiles;
import com.hethi.rest.utility.FileOperations;
import com.hethi.rest.utility.FtpAcknoledgement;
import com.hethi.rest.utility.Log;
import com.hethi.rest.utility.QueryExecutors;
import com.hethi.rest.utility.WriteToFile;

import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

public class FTP {

	public Message<String> handleFile(File file)
			throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		System.out.println("handleFile start in ftp 1");
		FtpAcknoledgement ftpAcknoledgement = new FtpAcknoledgement();
		Long today = new Date().getTime();
		int AcknoledgementStatus = 0;
		Message<String> msg = null;
		String Cus_id = "1";
		int lastIndex = file.getName().lastIndexOf('.');
		int file_length = file.getName().length();
		String file_type = file.getName().substring(lastIndex + 1, file_length);
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		String file_path = "src/web/client/images/ftp/" + file.getName();
		// boolean flag=false;

		String file_name = file.getName().substring(0, file.getName().lastIndexOf(".")) + "_" + today + "." + file_type;

		String filenameFTP = file.getName().substring(0, file.getName().lastIndexOf("."));
		String file_size = String.valueOf(file.length());
		System.out.println("file size in ftp befour download ===> " + file_size);
		System.out.println("file size in ftp befour download ===> " + file_name);
		String newFilePath = file_path.substring(0, file_path.lastIndexOf("/ftp/")) + "/ftp_old";

		if (file_type.equalsIgnoreCase("edi") || file_type.equalsIgnoreCase("zip") || file_type.equalsIgnoreCase("rar")
				|| file_type.equalsIgnoreCase("jpg") || file_type.equalsIgnoreCase("png")
				|| file_type.equalsIgnoreCase("gif") || file_type.equalsIgnoreCase("jpeg")
				|| file_type.equalsIgnoreCase("tiff") || file_type.equalsIgnoreCase("pdf")
				|| file_type.equalsIgnoreCase("docx") || file_type.equalsIgnoreCase("xlsx")
				|| file_type.equalsIgnoreCase("doc") || file_type.equalsIgnoreCase("xls")) {
			AcknoledgementStatus++;
			FileOperations obj = new FileOperations();
			obj.renameFile(file_path, newFilePath, file_name);
			file_path = newFilePath + "/" + file_name;
			File sizevalidate = new File(file_path);
			String bytes = String.valueOf(sizevalidate.length());
			System.out.println(bytes + "==" + file_size);
			/* Check file size befour and after download in FTP file transfer */

			if (bytes.equalsIgnoreCase(file_size)) {
				AcknoledgementStatus++;
				System.out.println("file path name ====> " + file_path);
				Map<String, String> mapObject = new HashMap<String, String>();
				mapObject.put("filePath", file_path);
				mapObject.put("fileName", file_name);
				mapObject.put("fileType", file_type);
				mapObject.put("fileSize", file_size);
				mapObject.put("formSource", "FTP");
				mapObject.put("customer_id", Cus_id);
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
				System.out.println("handleFile compleated in ftp");
				// return msg;
			}

		}

		if (AcknoledgementStatus == 0) {
			ftpAcknoledgement.invalidFormat(filenameFTP);
		} else if (AcknoledgementStatus == 1) {
			ftpAcknoledgement.zipfileCorrupted(filenameFTP);
		}

		return msg;
	}

	private static final int BUFFER_SIZE = 4096;

	public void extractFile(ZipInputStream zipIn, String filePath) throws IOException {
		System.out.println("Enter the extract method===>  >>>.1< >2");
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filePath));
		byte[] bytesIn = new byte[BUFFER_SIZE];
		int read = 0;
		while ((read = zipIn.read(bytesIn)) != -1) {
			bos.write(bytesIn, 0, read);
			// System.out.println("end the while extractFile");
		}
		bos.close();
		// System.out.println("end the extractFile");
	}

	public String unzipFile(String JSONData) throws IOException, ParseException {
		System.out.println("unzipFile start in ftp 2");
		Acknowledgement acknowledgement = new Acknowledgement();
		FtpAcknoledgement ftpAcknoledgement = new FtpAcknoledgement();
		int file_type_states = 0;
		String fileoldname = null;
		String Cus_id = null;
		Long today = new Date().getTime();
		String formSource = "";
		String filenameFTP = "";
		System.out.println(JSONData.toString());
		System.out.println("unzip file data ===> +" + JSONData.toString());
		try {
			System.out.println("unzipFile Enter try block start in ftp 2-1");

			JSONObject jsonObj = (JSONObject) new JSONParser().parse(JSONData);
			formSource = jsonObj.get("formSource").toString();
			fileoldname = jsonObj.get("fileName").toString();
			filenameFTP = jsonObj.get("fileName").toString().split(".zip")[0];
			Cus_id = jsonObj.get("customer_id").toString();
			System.out.println(jsonObj.get("fileName").toString() + " is at Unzip channel..");
			String destDirPath = jsonObj.get("filePath").toString().split(".zip")[0];
			int fileindex = destDirPath.lastIndexOf("/");
			String zibFilename = destDirPath.substring(fileindex + 1) + "." + jsonObj.get("fileType").toString();
			System.out.println("destDirPath==> " + destDirPath);
			File destDir = new File(destDirPath);
			if (!destDir.exists()) {
				destDir.mkdir();
			}

			System.out.println("fileoldname in unzipFile method 1===> " + jsonObj.get("filePath").toString());
			System.out.println(
					"fileoldname in unzipFile method 11===> " + jsonObj.get("filePath").toString().split(".zip")[0]);
			System.out.println("fileoldname in unzipFile method 2===> " + jsonObj.toString());
			ZipInputStream zipIn = new ZipInputStream(new FileInputStream(jsonObj.get("filePath").toString()));
			ZipEntry entry = zipIn.getNextEntry();
			// iterates over entries in the zip file
			while (entry != null) {
				int length_of_file = entry.getName().length();
				int last_index = entry.getName().lastIndexOf("/");
				String fileName = entry.getName().substring(last_index + 1, length_of_file);
				int filename_intex = fileName.lastIndexOf(".");
				String filetype = fileName.substring(filename_intex + 1, fileName.length());
				String filePath = destDirPath + File.separator + fileName;
				System.out.println("file path in while ==> " + filePath);
				System.out.println("file path in while length_of_file ==> " + filetype);
				System.out.println("file path in while fileName==> " + fileName);
				if (filetype.equalsIgnoreCase("edi") || filetype.equalsIgnoreCase("jpg")
						|| filetype.equalsIgnoreCase("png") || filetype.equalsIgnoreCase("gif")
						|| filetype.equalsIgnoreCase("jpeg") || filetype.equalsIgnoreCase("tiff")
						|| filetype.equalsIgnoreCase("pdf") || filetype.equalsIgnoreCase("docx")
						|| filetype.equalsIgnoreCase("xlsx") || filetype.equalsIgnoreCase("doc")
						|| filetype.equalsIgnoreCase("xls")) {

					if (!entry.isDirectory()) {
						// if the entry is a file, extracts it
						// System.out.println("if the entry is a file, extracts
						// it");
						extractFile(zipIn, filePath);
					}
				} else {
					file_type_states++;
					if (formSource.equalsIgnoreCase("FTP")) {
						ftpAcknoledgement.invalidFormat(fileName);
					} else if (formSource.equalsIgnoreCase("EMAIL")) {
						acknowledgement.invalidFormatFile(Cus_id, fileName);
					}
				}
				zipIn.closeEntry();
				entry = zipIn.getNextEntry();
			}
			Map<String, String> mapObject = new HashMap<String, String>();
			mapObject.put("filePath", destDirPath + "." + jsonObj.get("fileType").toString());
			mapObject.put("fileName", zibFilename);
			mapObject.put("fileType", jsonObj.get("fileType").toString());
			mapObject.put("fileSize", jsonObj.get("fileSize").toString());
			mapObject.put("formSource", jsonObj.get("formSource").toString());
			Gson gson = new Gson();
			String returnString = gson.toJson(mapObject);
			zipIn.close();
			System.out.println("unzipFile end in ftp");
			return returnString;
		} catch (Exception e) {
			System.out.println(e);
			if (file_type_states == 0) {
				if (formSource.equalsIgnoreCase("FTP")) {
					ftpAcknoledgement.zipfileCorrupted(filenameFTP);
				} else if (formSource.equalsIgnoreCase("EMAIL")) {
					acknowledgement.corruptedFile(Cus_id, fileoldname);
				}
			}
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	public Message<String> saveFile(String JSONData)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		System.out.println("saveFile start in ftp 3 ");
		System.out.println("Save file in saveFile method===> " + JSONData);
		Long today = new Date().getTime();
		Message<String> msg = null;
		JSONObject jsonObj = null;
		String newFilePath = "", newFileName = "";
		String formSource = "";
		try {
			jsonObj = (JSONObject) new JSONParser().parse(JSONData);
			String filePathToRename = jsonObj.get("filePath").toString();
			System.out.println("saveFile process in ftp filePathToRename==>" + filePathToRename);
			newFilePath = filePathToRename;
			formSource = jsonObj.get("formSource").toString();
			// newFilePath =
			// filePathToRename.substring(0,filePathToRename.lastIndexOf("."))+"_"+today+"."+jsonObj.get("fileType").toString();
			System.out.println("Newname in ftp for file path ===>  " + newFilePath);
			/*
			 * WriteToFile wFile = new WriteToFile(); File newFile =
			 * wFile.fileNameUpdation(filePathToRename);
			 */
			int fileindex = newFilePath.lastIndexOf("/");
			newFileName = newFilePath.substring(fileindex + 1);
			System.out.println("destDirPath==> " + newFileName);
			// newFilePath = newFile.getAbsolutePath();
			System.out.println("newfile path in ftp method======" + newFilePath);
			// newFileName = newFile.getName();
			System.out.println("new file path =" + newFilePath);

			System.out.println("File store channel enabled for " + newFileName);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "{ call store_uploaded_document('" + newFileName + "','" + jsonObj.get("fileType").toString()
				+ "','" + Integer.parseInt(jsonObj.get("fileSize").toString()) + "','1','"
				+ jsonObj.get("formSource").toString() + "')}";
		System.out.println(sql);
		QueryExecutors executor = new QueryExecutors();
		ArrayList<ArrayList> result = executor.callProcedure(sql);
		String upload_idString = result.get(0).get(0).toString();
		@SuppressWarnings("unused")
		JSONObject jsonObject = null;
		String upload_id = null;
		Gson gson = new Gson();
		UploadBeans bean = gson.fromJson(upload_idString, UploadBeans.class);
		upload_id = String.valueOf(bean.getUpload_id());
		System.out.println("start full extract");
		String cus_id = "1";
		String sfs_uin = "csfs100102";
		String current_channel = "daas.fullextract";

		String fileType = jsonObj.get("fileType").toString();
		Map<String, String> mapObj = new HashMap<String, String>();
		if (fileType.equals("zip")) {
			mapObj.put("fileLocation", newFilePath.split(".zip")[0]);
			mapObj.put("fileName", newFileName);
			mapObj.put("uploadId", upload_id);
			mapObj.put("customer_id", cus_id);
			mapObj.put("efs_uin", "");
			mapObj.put("sfs_uin", sfs_uin);
			mapObj.put("current_channel", current_channel);
			mapObj.put("timestamp", today.toString());
			mapObj.put("formSource", formSource);
		} else {
			mapObj.put("fileLocation", newFilePath);
			mapObj.put("fileName", newFileName);
			mapObj.put("fileType", jsonObj.get("fileType").toString());
			mapObj.put("fileSize", jsonObj.get("fileSize").toString());
			mapObj.put("uploadId", upload_id);
			mapObj.put("uid", upload_id);
			mapObj.put("customer_id", cus_id);
			mapObj.put("efs_uin", "");
			mapObj.put("sfs_uin", sfs_uin);
			mapObj.put("current_channel", current_channel);
			mapObj.put("timestamp", today.toString());
			mapObj.put("formSource", formSource);
		}
		String file_type = jsonObj.get("fileType").toString();
		if ((!file_type.equals("zip"))) {
			if ((!file_type.equals("rar")))
				file_type = "single";
		}

		String returnContent = gson.toJson(mapObj);
		msg = MessageBuilder.withPayload(returnContent).setHeader("fileType", file_type).build();
		return msg;
	}

	public void handleException() {
		System.out.println("Exception channel enabled..");
	}

	@SuppressWarnings({ "rawtypes", "unused" })
	public String listFolderContents(String JSONData)
			throws ParseException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException,
			IOException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {
		System.out.println("listFolderContents in FTP method===>4");

		JSONObject jsonObj = (JSONObject) new JSONParser().parse(JSONData);
		String folderLocation = jsonObj.get("fileLocation").toString();
		Long today = Long.parseLong(jsonObj.get("timestamp").toString());
		System.out.println(folderLocation + " " + today);
		folderLocation = folderLocation.split(today.toString())[0];
		System.out.println("folder= " + folderLocation);
		WriteToFile wFile = new WriteToFile();
		// String tempFilePath= folderLocation.replace("\\", "/");
		// tempFilePath=tempFilePath.substring(0,
		// tempFilePath.lastIndexOf("/"))+"/"+jsonObj.get("fileName");
		// wFile.fileNameUpdation(tempFilePath, today);
		folderLocation = wFile.folderNameUpdation(folderLocation).getAbsolutePath();
		final File folder = new File(folderLocation);

		for (final File fileEntry : folder.listFiles()) {

			if (fileEntry.isDirectory()) {
				listFolderContents(JSONData);
			} else {
				ImageValidator imgValid = new ImageValidator();

				int last_index = fileEntry.getName().lastIndexOf('.');
				int filename_length = fileEntry.getName().length();
				String fileName = fileEntry.getName();
				String fileType = fileName.substring(last_index + 1, filename_length);
				String filePath = folderLocation.replace("\\", "/") + "/" + fileEntry.getName();
				System.out.println("here at folder=" + filePath);
				ExtractZipFiles extract = new ExtractZipFiles();
				ArrayList<String> str = extract.readFile();
				String domain = str.get(0);

				filePath = filePath.split("client")[1];

				filePath = domain + filePath;

				String sql = "{ call store_uploaded_document_files('"
						+ Integer.parseInt(jsonObj.get("uploadId").toString()) + "','1'," + "'cefs100101','1','"
						+ fileName + "','" + fileType + "','" + fileEntry.length() + "','" + filePath + "')}";
				QueryExecutors executor = new QueryExecutors();
				System.out.println("List folder channel is enabled for " + fileEntry.getName());
				ArrayList<ArrayList> result = executor.callProcedure(sql);

				/*
				 * String file_idString = result.get(0).get(0).toString();
				 * 
				 * @SuppressWarnings("unused") JSONObject jsonObject = null;
				 * String file_id = null; Gson gson = new Gson(); UploadBeans
				 * bean = gson.fromJson(file_idString, UploadBeans.class);
				 * file_id = String.valueOf(bean.getFile_id());
				 * jsonObj.put("file_id", file_id);
				 */
			}
		}
		return JSONData;
	}

	public String saveFileDetails(String JSONData) throws Exception {

		System.out.println("saveFileDetails =========>   5 start===>");
		Log log = new Log();
		Acknowledgement acknowledgement = new Acknowledgement();
		FtpAcknoledgement ftpAcknoledgement = new FtpAcknoledgement();
		JSONObject jsonObj = (JSONObject) new JSONParser().parse(JSONData);
		System.out.println("receved json object======> " + jsonObj.toString());
		String filePath = jsonObj.get("fileLocation").toString();
		String Cus_id = jsonObj.get("customer_id").toString();
		String formSource = jsonObj.get("formSource").toString();
		ExtractZipFiles extract = new ExtractZipFiles();
		ArrayList<String> str = extract.readFile();
		String domain = str.get(0);
		filePath = filePath.split("client")[1].replace("\\", "/");
		String value = "";
		String actualFile = jsonObj.get("fileName").toString();
		String filenewname = jsonObj.get("fileName").toString();
		String fileoldname = filenewname.substring(0, filenewname.lastIndexOf('_'));
		System.out.println("formSource====  === == >> " + formSource);

		String fileName = actualFile;

		ImageValidator imgValid = new ImageValidator();
		if (imgValid.validate(fileName)) {

			filePath = domain + filePath;

			String sql = "{ call store_uploaded_document_files('" + jsonObj.get("uploadId") + "','1',"
					+ "'cefs100101','1','" + fileName + "','" + jsonObj.get("fileType") + "','"
					+ jsonObj.get("fileSize") + "','" + filePath + "')}";
			QueryExecutors executor = new QueryExecutors();
			@SuppressWarnings({ "rawtypes", "unused" })
			ArrayList<ArrayList> result = executor.callProcedure(sql);

			// String data = result.get(0).get(0).toString();
			// System.out.println("result value ===>
			// "+result.get(0).get(0).toString());

			Gson gson = new Gson();
			String data = gson.toJson(result.get(0).get(0));
			System.out.println("data==<===> " + data);
			JSONObject jsonD = (JSONObject) new JSONParser().parse(data);
			String file_id = String.valueOf(jsonD.get("fileId"));
			String uid = String.valueOf(jsonD.get("uploadId"));
			String process_id = "csfs100101";
			String sub_process_id = "5";
			// String status_code="1";
			String user_code = "1";

			log.log(Cus_id, uid, file_id, process_id, sub_process_id, "1", user_code);
			log.log(Cus_id, uid, file_id, process_id, sub_process_id, "2", user_code);

			/*
			 * if(formSource.equalsIgnoreCase("FTP")) {
			 * ftpAcknoledgement.uploadFTPFile(fileoldname); } else
			 * if(formSource.equalsIgnoreCase("EMAIL")) { value =
			 * acknowledgement.successfullyReceived(Cus_id, fileoldname); }
			 * System.out.println("json uploadId string ==> " + uid);
			 * jsonD.put("result", value); String Ack = jsonD.toJSONString();
			 */

			log.log(Cus_id, uid, file_id, process_id, sub_process_id, "3", user_code);
			System.out.println("Compleated log table update");

			System.out.println("File details store channel is enabled for " + fileName);
		} else {
			System.out.println("The File Format is Not Image");
		}
		return JSONData;
	}

	public void successMethod(String JSONData) throws ParseException, IOException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		System.out.println("Success channel enabled..6");
		System.out.println("---------------------------------");

		Log log = new Log();
		FtpAcknoledgement ftpAcknoledgement = new FtpAcknoledgement();
		Acknowledgement acknowledgement = new Acknowledgement();
		JSONObject jsonObj = (JSONObject) new JSONParser().parse(JSONData);
		System.out.println("receved json object======> " + jsonObj.toString());
		String filenewname = jsonObj.get("fileName").toString();
		String fileoldname = filenewname.substring(0, filenewname.lastIndexOf('_'));
		String Cus_id = jsonObj.get("customer_id").toString();
		String formSource = jsonObj.get("formSource").toString();
		// String file_id = jsonObj.get("file_id").toString();
		String uid = jsonObj.get("uploadId").toString();
		String process_id = "csfs100101";
		String sub_process_id = "5";
		String value = "";
		// String status_code="1";
		String user_code = "1";

		if (formSource.equalsIgnoreCase("FTP")) {
			ftpAcknoledgement.uploadFTPFile(fileoldname);
		} else if (formSource.equalsIgnoreCase("EMAIL")) {
			value = acknowledgement.successfullyReceived(Cus_id, fileoldname);
		}
		System.out.println("json uploadId string ==> " + uid);

		System.out.println("Compleated log table update");

		System.out.println("last.." + JSONData.toString());
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
		try {
			System.out.println("extractArchive json data 7");

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
		} catch (Exception e) {
			System.out.println("Archive file not extracted");
		}
		return null;
	}

	@SuppressWarnings("unused")
	public static String extractArchive(File arch, File destination, String fileName, String fileSize, String archive)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		System.out.println("extractArchive parameters 8");
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
		System.out.println(" File create file in ftp 9");
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
		System.out.println(" File makeFile file in ftp 10");
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
		System.out.println("createDirectory ===== 11 >");
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
		System.out.println("makeDirectory ===== 12 >");
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
