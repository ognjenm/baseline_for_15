package com.hethi.dass.util;

import java.io.File;

import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;

public class MimeType {

	public static String getMIMEType(String filePath)
			throws MagicParseException, MagicMatchNotFoundException, MagicException {
		String mime = Magic.getMagicMatch(new File(filePath), false).getMimeType();
		return mime;
	}

}
