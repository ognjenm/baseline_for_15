package com.hethi.rest.controllers;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ListenerControllers {
	public void startListener() {
		@SuppressWarnings({ "resource", "unused" })
		AbstractApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:spring/spring-integration-email-helper.xml");
		// @SuppressWarnings({ "resource", "unused" })
		// AbstractApplicationContext context1 =
		// new
		// ClassPathXmlApplicationContext("classpath:spring/spring-integration-ftp-helper.xml");
	}

}
