package com.hethi.rest.utility;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

public class WriteToFile {
	public String createFile(String data, String upload_id, String file_id, String user_id, String location)
			throws IOException {
		BufferedWriter output = null;
		String fileLocation = location + "/" + upload_id + "_" + file_id + "_" + user_id + ".xml";
		try {
			File file1 = new File(fileLocation);
			file1.delete();
			File file = new File(fileLocation);
			output = new BufferedWriter(new FileWriter(file));
			output.write(data);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (output != null)
				output.close();
		}
		return fileLocation;
	}

	public final File folderNameUpdation(String filepath, long timestamp) {
		System.out.println("file path=" + filepath);
		File folder = new File(filepath);
		System.out.println(folder + ".. folder");
		String newDir = filepath.substring(filepath.lastIndexOf("/") + 1, filepath.length()) + timestamp;
		System.out.println("newDir=" + folder.getParent() + "/" + newDir);
		final File newFolder = new File(folder.getParent() + "/" + newDir);
		folder.renameTo(newFolder);
		return newFolder;
	}
	public final File fileNameUpdation(String filepath, long timestamp) {
		System.out.println("file path=" + filepath);
		File folder = new File(filepath);
		System.out.println(folder + ".. folder");
		try{
		String fileType=FilenameUtils.getExtension(filepath);
		System.out.println(fileType);}catch(Exception e){}
		
		String newDir = filepath.substring(filepath.lastIndexOf("/") + 1, filepath.lastIndexOf(".")) + timestamp+".jpg";
		newDir.replace("\\", "/");
		System.out.println("newDir=" + folder.getParent() + "/" + newDir);
		final File newFolder = new File(folder.getParent() + "/" + newDir);
		folder.renameTo(newFolder);
		return newFolder;
	}
}
