package com.hethi.adapters;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.zip.ZipFile;

import javax.mail.Address;
import javax.mail.Flags.Flag;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.messaging.Message;

import com.google.gson.Gson;
import com.hethi.rest.utility.Acknowledgement;
import com.hethi.rest.utility.Log;

public class EMAIL {
	static boolean isValid(String filePath) {
		System.out.println("start email 0");
		File file = new File(filePath);
		ZipFile zipfile = null;
		boolean validityType = false;
		try {
			zipfile = new ZipFile(file);
			validityType = true;
		} catch (IOException e) {
			validityType = false;
		} finally {
			try {
				if (zipfile != null) {
					zipfile.close();
					zipfile = null;
				}
			} catch (IOException e) {
			}
		}
		return validityType;
	}

	private String saveDirectory;

	public void setSaveDirectory(String dir) {
		this.saveDirectory = dir;
	}

	@SuppressWarnings({ "deprecation", "unused" })
	public MimeBodyPart downloadEmailAttachments(MimeMessage message) {
		String saveDirectory = "src\\web\\client\\images\\email\\";
		this.setSaveDirectory(saveDirectory);
		System.out.println("downloadEmailAttachments is start ====> downloadEmailAttachments email 1");
		Acknowledgement ack = new Acknowledgement();
		try {
			Calendar cal = null;
			cal = Calendar.getInstance();
			Date minDate = new Date(cal.getTimeInMillis());
			minDate.setHours(0);
			minDate.setMinutes(0);
			minDate.setSeconds(0);
			cal.add(Calendar.DAY_OF_MONTH, 1); // add 1 day
			Date maxDate = new Date(cal.getTimeInMillis()); // get tomorrow date
			if (message.getSentDate() != null && message.getSentDate().after(minDate)
					&& message.getSentDate().before(maxDate)) {
				Address[] fromAddress = message.getFrom();
				message.setFlag(Flag.SEEN, true);
				String from = fromAddress[0].toString();
				String subject = message.getSubject();
				String sentDate = message.getSentDate().toString();
				String contentType = message.getContentType();
				int size = message.getSize();
				String fileName = "";

				// store attachment file name, separated by comma
				System.out.println("From address =====> " + from);
				System.out.println("contentType display =====> " + size);
				String attachFiles = "";
				MimeBodyPart return_part = null;
				int attachCount = 0;
				if (contentType.contains("multipart")) {
					// content may contain attachments
					Multipart multiPart = (Multipart) message.getContent();
					int numberOfParts = multiPart.getCount();
					System.out.println("numberOfParts ==> sop for count ==> " + numberOfParts);
					for (int partCount = 0; partCount < numberOfParts; partCount++) {
						MimeBodyPart part = (MimeBodyPart) multiPart.getBodyPart(partCount);

						System.out.println("path for port====> " + part.getSize());
						// System.out.println("part.getDisposition() ===>
						// "+part.getDisposition());
						// System.out.println("attachFiles.length() ======>
						// "+attachFiles.length());
						if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition())) {
							String filetype = part.getFileName().substring(part.getFileName().lastIndexOf('.') + 1)
									.toLowerCase();
							System.out.println("filetype print =====> " + filetype);
							fileName = part.getFileName();
							if (filetype.equalsIgnoreCase("edi") || filetype.equalsIgnoreCase("zip")
									|| filetype.equalsIgnoreCase("rar") || filetype.equalsIgnoreCase("jpg")
									|| filetype.equalsIgnoreCase("png") || filetype.equalsIgnoreCase("gif")
									|| filetype.equalsIgnoreCase("jpeg") || filetype.equalsIgnoreCase("tiff")
									|| filetype.equalsIgnoreCase("pdf") || filetype.equalsIgnoreCase("docx")
									|| filetype.equalsIgnoreCase("xlsx") || filetype.equalsIgnoreCase("doc")
									|| filetype.equalsIgnoreCase("xls")) {

								// this part is attachment

								return_part = part;
								System.out.println("path for port in if condition====>File Name: " + part.getFileName()
										+ " Size: " + part.getSize() + "Attach size: " + part.ATTACHMENT.getBytes());
										// String
										// filename=part.getFileName().substring(0,
										// part.getFileName().lastIndexOf('.'));
										// String

								// part.getFileName().length());
								// return_part.setFileName(filename+new
								// Date().getTime()+filetype);
							} else {
								ack.invalidAttachment(from, fileName);
							}
							attachCount++;
						}
					}
					if (attachFiles.length() > 1) {
						attachFiles = attachFiles.substring(0, attachFiles.length() - 2);
					}
				}
				System.out.println("attachCount print ===> " + attachCount);
				if (attachCount == 0) {
					System.out.println("No attachment is receved");
					ack.noAttachment(from, fileName);
				}
				System.out.println("downloadEmailAttachments completed");
				return return_part;
			} else {
				System.out.println("Message have already seen");
			}
		} catch (MessagingException ex) {
			System.out.println("Could not connect to the message store");
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public Message<String> handleFile(MimeBodyPart part) throws MessagingException, IOException, InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		System.out.println("handle file in email 2");
		Log log = new Log();
		Long today = new Date().getTime();
		System.out.println("handleFile start");
		int lastIndex = part.getFileName().lastIndexOf('.');
		int file_length = part.getFileName().length();
		String file_type = part.getFileName().substring(lastIndex + 1, file_length);
		String file_name = part.getFileName().substring(0, part.getFileName().lastIndexOf(".")) + "_" + today + "."
				+ file_type;
		String filePath = saveDirectory + File.separator + file_name;
		System.out.println("filePath in handle file ==> " + filePath);
		part.saveFile(filePath);
		String process_id = "csfs100101";
		String sub_process_id = "5";
		String Cus_id = "1";
		String uid = "0";
		// String status_code="1";
		String user_code = "1";
		// log.log(Cus_id, uid, "0", process_id, sub_process_id, "1",
		// user_code);
		File file = new File(filePath);
		long fileSize = (file.length());
		System.out.println("path for port in after save====> " + fileSize);
		System.out.println("path for port in after save====> " + (double) fileSize / 1024);
		Message<String> msg = null;

		String file_path = "src/web/client/images/email/" + file_name;
		System.out.println("file_path in handle file ===> " + file_path);
		String file_size = String.valueOf(part.getSize());
		Map<String, String> mapObject = new HashMap<String, String>();
		mapObject.put("filePath", file_path);
		mapObject.put("fileName", file_name);
		mapObject.put("fileType", file_type);
		mapObject.put("fileSize", file_size);
		mapObject.put("formSource", "EMAIL");
		mapObject.put("customer_id", Cus_id);
		Gson gson = new Gson();
		String returnString = gson.toJson(mapObject);
		if ((!file_type.equals("zip"))) {
			if ((!file_type.equals("rar")))
				file_type = "single";
		} else
			System.out.println("File " + part.getFileName() + " is at receive channel.");

		msg = MessageBuilder.withPayload(returnString).setHeader("fileType", file_type).build();
		System.out.println("handleFile compleated");
		return msg;
	}

}
