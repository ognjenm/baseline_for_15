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
//		filepath=filepath.replace("\\", "/");
		File folder = new File(filepath);
		System.out.println("old filepath"+filepath);
		System.out.println(folder.exists());
		String newDir = filepath + timestamp;
		final File newFolder = new File(newDir);
		System.out.println(folder.renameTo(newFolder));
		System.out.println("new path="+newDir);
		return newFolder;
	}
	
	public final File fileNameUpdation(String filepath, long timestamp) {
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace("\\", "/");
		filepath=currentDir+filepath;
		File folder = new File(filepath);
		String fileType=FilenameUtils.getExtension(filepath);
		String newDir = filepath.substring(filepath.lastIndexOf("/") + 1, filepath.lastIndexOf(".")) +"_"+timestamp+"."+fileType;
		newDir.replace('\\', '/');
		final File newFolder = new File(folder.getParent() + "/" + newDir);
		folder.renameTo(newFolder);
		return newFolder;
	}
}
