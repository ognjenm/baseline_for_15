package com.hethi.domain;



import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class HethiApplication {
	private final static String USER_AGENT = "Mozilla/5.0";
	
	public static void main(String[] args)  {	

//
		 String SEPARATOR = "-----------------------------";
		 System.out.println(" \n ");
		 System.out.println(""+SEPARATOR);
		 System.out.println("Hethi Application Started ");
		 System.out.println(""+SEPARATOR);
		 System.out.println("listening on Input Gateway ..");
		 System.out.println(""+SEPARATOR);
		 

//		String str="hethi";
//		 byte[]   bytesEncoded = Base64.encode(str .getBytes());
//		 System.out.println("ecncoded value is " + new String(bytesEncoded ));
//
//		 // Decode data on other side, by processing encoded data
//		 byte[] valueDecoded= Base64.decode(bytesEncoded );
//		 System.out.println("Decoded value is " + new String(valueDecoded));
		 
//		 String imageUrl = "https://tpc.googlesyndication.com/simgad/4955448736283271520";
//		 String destinationFile = "src/main/resources/files/4955448736283271520.jpg";
//		 
//
//			try {
//				sendPost();
//			} catch (Exception e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//
//
//		 try {
//			saveImage(imageUrl, destinationFile);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		 ApplicationContext context = new ClassPathXmlApplicationContext("/sp/core/RestInterface.xml");
		    
//		 iPost ipost=new iPost();
		 
    }
	public static void saveImage(String imageUrl, String destinationFile) throws IOException {
		URL url = new URL(imageUrl);
		InputStream is = url.openStream();
		OutputStream os = new FileOutputStream(destinationFile);

		byte[] b = new byte[2048];
		int length;

		while ((length = is.read(b)) != -1) {
			os.write(b, 0, length);
		}

		is.close();
		os.close();
	}
	// HTTP POST request
		public static void sendPost() throws Exception {

//			HttpClient httpclient = new DefaultHttpClient();
//			HttpPost httppost = new HttpPost("http://localhost:999/sample");
//
//		
//			MultipartEntityBuilder builder = MultipartEntityBuilder.create();
//            builder.addPart("a_field_name", new File("src/main/resources/files/4955448736283271520.jpg"));
//
//HttpEntity entity = builder.build();
//
//httppost.setEntity(entity);
//
//HttpResponse response = httpclient.execute(httppost);
			
		}

}
