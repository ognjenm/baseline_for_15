package com.hethi.rest.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.integration.endpoint.SourcePollingChannelAdapter;

public class MailAddressConfig {
	public String mailAddress[] = { "hethitest2%40gmail.com:hethitestmail" };
	List<String> tempArray = new ArrayList<String>();
	Random random = new Random();

	public void congigMailId() throws IOException {

		Properties prop = new Properties();
		OutputStream output = null;
		try {
			if (tempArray.size() == mailAddress.length) {
				tempArray.clear();
				System.out.println("Empty array..");
			}
			int index = random.nextInt(mailAddress.length);
			while (tempArray.contains(mailAddress[index])) {
				index = random.nextInt(mailAddress.length);
			}
			File file = new File("src\\main\\resources\\emailConfiguration.properties");
			FileOutputStream fOut1 = new FileOutputStream(file);
			tempArray.add(mailAddress[index]);
			prop.setProperty("email", mailAddress[index]);
			// save properties to project root folder
			prop.store(fOut1, null);
			fOut1.close();

		} catch (Exception io) {
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
		MailAddressConfig config = new MailAddressConfig();
		config.congigMailId();
		@SuppressWarnings({ "resource" })
		AbstractApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:spring/spring-integration-context.xml");
		SourcePollingChannelAdapter sourcePollingChannelAdapter = (SourcePollingChannelAdapter) context
				.getBean("inboundChannel"); // adapter id in the bean
											// configuration
		sourcePollingChannelAdapter.stop();
		sourcePollingChannelAdapter.start();
		// sourcePollingChannelAdapter.setAutoStartup(true);
	}
}
