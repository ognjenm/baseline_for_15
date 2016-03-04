package com.hethi.rest.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;
import org.apache.commons.net.ftp.FTPClient;

public class FtpAcknoledgement {

	/*class created by Prabhakaran*/
	
	public void uploadFTPFile(String fileoldname) {
		// get an ftpClient object
		FTPClient ftpClient = new FTPClient();
		FileInputStream inputStream = null;

		try {
			// pass directory path on server to connect
			ftpClient.connect("ftp.tatvi.com");

			// pass username and password, returned true if authentication is
			// successful
			boolean login = ftpClient.login("ryan@tatvi.com", "ryan@123");
			File file = new File(".");
			String getpath = file.getAbsolutePath();
			System.out.println("getpath ===>" + getpath);
			String resultfilepath = getpath.substring(0, getpath.lastIndexOf("\\"))
					+ "\\src\\web\\client\\images\\ftp_result";
			File filedir = new File(resultfilepath);
			if (!filedir.exists()) {
				filedir.mkdir();
			}
			// System.out.println("filedir.getAbsolutePath()===>" +
			// filedir.getAbsolutePath());
			String path = filedir.getAbsolutePath() + "\\" + fileoldname + "_suceess";
			File file2 = new File(path);
			// System.out.println("inFTPACK======> " + resultfilepath);
			file2.createNewFile();

			if (login) {
				System.out.println("Connection established...");
				inputStream = new FileInputStream(file2.toString());

				boolean uploaded = ftpClient.storeFile("//Imagesamples//Your_file_status//" + fileoldname + "_success",
						inputStream);
				if (uploaded) {
					System.out.println("File uploaded successfully !");
				} else {
					System.out.println("Error in uploading file !");
				}

				// logout the user, returned true if logout successfully
				boolean logout = ftpClient.logout();
				if (logout) {
					System.out.println("Connection close...");
				}
			} else {
				System.out.println("Connection fail...");
			}

		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ftpClient.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	public void zipfileCorrupted(String fileoldname) {
		// get an ftpClient object
		FTPClient ftpClient = new FTPClient();
		FileInputStream inputStream = null;

		try {
			// pass directory path on server to connect
			// pass username and password, returned true if authentication is
			// successful
			ftpClient.connect("ftp.tatvi.com");
			boolean login = ftpClient.login("ryan@tatvi.com", "ryan@123");
			File file = new File(".");
			String getpath = file.getAbsolutePath();
			String resultfilepath = getpath.substring(0, getpath.lastIndexOf("\\"))
					+ "\\src\\web\\client\\images\\ftp_result";
			File filedir = new File(resultfilepath);
			if (!filedir.exists()) {
				filedir.mkdir();
			}
			// System.out.println("filedir.getAbsolutePath()===>" +
			// filedir.getAbsolutePath());
			String path = filedir.getAbsolutePath() + "\\" + fileoldname + "_zip_Corrupted";
			File file2 = new File(path);
			// System.out.println("inFTPACK======> " + resultfilepath);
			file2.createNewFile();

			if (login) {
				System.out.println("Connection established...");
				inputStream = new FileInputStream(file2.toString());

				boolean uploaded = ftpClient
						.storeFile("//Imagesamples//Your_file_status//" + fileoldname + "_zip_Corrupted", inputStream);
				if (uploaded) {
					System.out.println("File uploaded successfully !");
				} else {
					System.out.println("Error in uploading file !");
				}

				// logout the user, returned true if logout successfully
				boolean logout = ftpClient.logout();
				if (logout) {
					System.out.println("Connection close...");
				}
			} else {
				System.out.println("Connection fail...");
			}

		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ftpClient.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	public void invalidFormat(String fileoldname) {
		// get an ftpClient object
		FTPClient ftpClient = new FTPClient();
		FileInputStream inputStream = null;

		try {
			// pass directory path on server to connect
			// pass username and password, returned true if authentication is
			// successful
			ftpClient.connect("ftp.tatvi.com");
			boolean login = ftpClient.login("ryan@tatvi.com", "ryan@123");
			File file = new File(".");
			String getpath = file.getAbsolutePath();
			String resultfilepath = getpath.substring(0, getpath.lastIndexOf("\\"))
					+ "\\src\\web\\client\\images\\ftp_result";
			File filedir = new File(resultfilepath);
			if (!filedir.exists()) {
				filedir.mkdir();
			}
			// System.out.println("filedir.getAbsolutePath()===>" +
			// filedir.getAbsolutePath());
			String path = filedir.getAbsolutePath() + "\\" + fileoldname + "_invalidFormat";
			File file2 = new File(path);
			// System.out.println("inFTPACK======> " + resultfilepath);
			file2.createNewFile();

			if (login) {
				System.out.println("Connection established...");
				inputStream = new FileInputStream(file2.toString());

				boolean uploaded = ftpClient
						.storeFile("//Imagesamples//Your_file_status//" + fileoldname + "_invalidFormat", inputStream);
				if (uploaded) {
					System.out.println("File uploaded successfully !");
				} else {
					System.out.println("Error in uploading file !");
				}

				// logout the user, returned true if logout successfully
				boolean logout = ftpClient.logout();
				if (logout) {
					System.out.println("Connection close...");
				}
			} else {
				System.out.println("Connection fail...");
			}

		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ftpClient.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
