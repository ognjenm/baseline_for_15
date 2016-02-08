
package com.hethi.rest.interfaces;

public interface NotificationInterface {
	boolean notify(String to, String subject, String body, String filename);
}