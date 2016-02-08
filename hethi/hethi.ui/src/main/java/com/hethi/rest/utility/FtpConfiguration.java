package com.hethi.rest.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.integration.endpoint.SourcePollingChannelAdapter;

public class FtpConfiguration {
	public ArrayList<Map<String, String>> ftpList = null;
	public Map<String, String> ftpMap = null;
	public ArrayList<Map<String, String>> tempArray = new ArrayList<Map<String, String>>();
	Random random = new Random();

	public void congigMailId() throws IOException {

		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		ftpList = new ArrayList<Map<String, String>>();
		// ftpMap=new HashMap<String, String>();
		// ftpMap.put("username", "Anonymous");
		// ftpMap.put("host", "ftp.swfwmd.state.fl.us");
		// ftpMap.put("password","hareesh.p.balakrishnan@gmail.com");
		// ftpMap.put("port", "21");
		// ftpMap.put("remote_dir", "/pub/usgs/");
		// ftpMap.put("local_dir", currentDir+"src/images/ftp");
		// ftpList.add(ftpMap);
		ftpMap = new HashMap<String, String>();
		ftpMap.put("username", "ryan@tatvi.com");
		ftpMap.put("host", "ftp.tatvi.com");
		ftpMap.put("password", "ryan@123");
		ftpMap.put("port", "21");
		ftpMap.put("remote_dir", "/Imagesamples/samples/");
		ftpMap.put("local_dir", currentDir + "src/web/client/images/ftp");
		ftpList.add(ftpMap);
		Properties p = new Properties();
		OutputStream output = null;
		try {
			if (tempArray.size() == ftpList.size()) {
				tempArray.clear();
				System.out.println("cleared..");
			}
			int index = random.nextInt(ftpList.size());
			while (tempArray.contains(ftpList.get(index))) {
				index = random.nextInt(ftpList.size());
			}
			tempArray.add(ftpList.get(index));
			File file = new File("src\\main\\resources\\ftpConfiguration.properties");
			FileOutputStream fOut = new FileOutputStream(file);
			p.setProperty("username", ftpList.get(index).get("username").toString());
			p.setProperty("host", ftpList.get(index).get("host").toString());
			p.setProperty("port", ftpList.get(index).get("port").toString());
			p.setProperty("password", ftpList.get(index).get("password").toString());
			p.setProperty("remote-directory", ftpList.get(index).get("remote_dir").toString());
			p.setProperty("local-directory", ftpList.get(index).get("local_dir").toString());
			p.store(fOut, null);
			fOut.close();
		} catch (IOException io) {
			io.printStackTrace();
		} finally {
			if (output != null) {
				try {
					output.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void startChannel() throws IOException {
		FtpConfiguration config = new FtpConfiguration();
		config.congigMailId();
		@SuppressWarnings({ "resource" })
		AbstractApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:spring/spring-integration-context-ftp.xml");
		SourcePollingChannelAdapter sourcePollingChannelAdapter = (SourcePollingChannelAdapter) context
				.getBean("channel1"); // adapter id in the bean configuration
		sourcePollingChannelAdapter.stop();
		sourcePollingChannelAdapter.start();
		// sourcePollingChannelAdapter.setAutoStartup(true);
	}
}