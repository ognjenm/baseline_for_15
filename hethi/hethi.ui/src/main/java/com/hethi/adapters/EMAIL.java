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

public class EMAIL {
	static boolean isValid(String filePath) {
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
				// store attachment file name, separated by comma
				String attachFiles = "";
				MimeBodyPart return_part = null;
				if (contentType.contains("multipart")) {
					// content may contain attachments
					Multipart multiPart = (Multipart) message.getContent();
					int numberOfParts = multiPart.getCount();
					for (int partCount = 0; partCount < numberOfParts; partCount++) {
						MimeBodyPart part = (MimeBodyPart) multiPart.getBodyPart(partCount);
						if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition())) {
							// this part is attachment
							return_part = part;
							// String filename=part.getFileName().substring(0,
							// part.getFileName().lastIndexOf('.'));
							// String
							// filetype=part.getFileName().substring(part.getFileName().lastIndexOf('.'),
							// part.getFileName().length());
							// return_part.setFileName(filename+new
							// Date().getTime()+filetype);
						}
					}
					if (attachFiles.length() > 1) {
						attachFiles = attachFiles.substring(0, attachFiles.length() - 2);
					}
				}
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

	public Message<String> handleFile(MimeBodyPart part) throws MessagingException, IOException {

		String filePath = saveDirectory + File.separator + part.getFileName();
		part.saveFile(filePath);
		Message<String> msg = null;
		int lastIndex = part.getFileName().lastIndexOf('.');
		int file_length = part.getFileName().length();
		String file_type = part.getFileName().substring(lastIndex + 1, file_length);
		String file_path = "src/web/client/images/email/" + part.getFileName();
		String file_name = part.getFileName();
		String file_size = String.valueOf(part.getSize());
		Map<String, String> mapObject = new HashMap<String, String>();
		mapObject.put("filePath", file_path);
		mapObject.put("fileName", file_name);
		mapObject.put("fileType", file_type);
		mapObject.put("fileSize", file_size);
		mapObject.put("formSource", "EMAIL");
		Gson gson = new Gson();
		String returnString = gson.toJson(mapObject);
		if ((!file_type.equals("zip"))) {
			if ((!file_type.equals("rar")))
				file_type = "single";
		} else
			System.out.println("File " + part.getFileName() + " is at receive channel.");
		msg = MessageBuilder.withPayload(returnString).setHeader("fileType", file_type).build();
		return msg;
	}

}
