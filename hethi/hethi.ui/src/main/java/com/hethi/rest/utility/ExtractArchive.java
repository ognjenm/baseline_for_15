package com.hethi.rest.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.github.junrar.Archive;
import com.github.junrar.exception.RarException;
import com.github.junrar.rarfile.FileHeader;
import com.google.gson.Gson;
import com.hethi.daas.ImageIO.ImageProcessesingServices;

import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;
import net.sourceforge.tess4j.TesseractException;

public class ExtractArchive {
	private static Log logger = LogFactory.getLog(ExtractArchive.class.getName());

	public static String extractArchive(String archive, String destination, String baseURL, int upload_id,
			int customer_id, String efs, int user_id, long timestamp)
					throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException,
					IOException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {

		if (archive == null || destination == null) {
			throw new RuntimeException("archive and destination must me set");
		}
		File arch = new File(archive);
		arch.length();
		if (!arch.exists()) {
			throw new RuntimeException("the archive does not exit: " + archive);
		}
		File dest = new File(destination);
		if (!dest.exists() || !dest.isDirectory()) {
		}
		String fileName = arch.getName();
		String fileSize = String.valueOf(arch.length());
		// return "";
		return extractArchive(arch, dest, fileName, fileSize, archive, baseURL, upload_id, customer_id, efs, user_id);
	}

	@SuppressWarnings("unused")
	public static String extractArchive(File arch, File destination, String fileName, String fileSize, String archive,
			String baseURL, int upload_id, int customer_id, String efs, int user_id)
					throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException,
					IOException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {
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
		final File folder = new File(filepath);
		Gson gson = new Gson();
		ExtractArchive extr = new ExtractArchive();
		System.out.println(filepath.substring(0, filepath.lastIndexOf('/')) + " hgf");
		String returnString = extr.listFilesForFolder(folder, baseURL, upload_id, customer_id, efs, user_id);
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

	@SuppressWarnings("rawtypes")
	public String listFilesForFolder(File folder, String baseURL, int upload_id, int customer_id, String efs,
			int user_id) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException,
					IOException, MagicParseException, MagicMatchNotFoundException, MagicException, TesseractException {
		String result = "";
		System.out.println(folder);
		for (final File fileEntry : folder.listFiles()) {
			if (fileEntry.isDirectory()) {
				listFilesForFolder(folder, baseURL, upload_id, customer_id, efs, user_id);
			} else {
				String filePath = (folder.getPath() + File.separator + fileEntry.getName()).replace("\\", "/");
				String file_path = baseURL + "/images/" + filePath.split("/images/")[1];
				int length = fileEntry.getName().length();
				int lastIndex = fileEntry.getName().lastIndexOf(".");
				System.out.println("Pdf Path IS " + "src/web/client"
						+ file_path.substring(file_path.indexOf("/images"), file_path.length()));
				ImageProcessesingServices.getFullOCR(
						"src/web/client" + file_path.substring(file_path.indexOf("/images"), file_path.length()));

				String sql1 = "{ call store_uploaded_document_files('" + upload_id + "','" + customer_id + "'," + "'"
						+ efs + "','" + user_id + "','" + fileEntry.getName() + "','"
						+ fileEntry.getName().substring(lastIndex + 1, length) + "','" + fileEntry.length() + "','"
						+ file_path + "')}";
				System.out.println(sql1);
				try {
					QueryExecutors object2 = new QueryExecutors();
					ArrayList<ArrayList> resultList1 = object2.callProcedure(sql1);
					Gson gson = new Gson();
					result = gson.toJson(resultList1);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
}
