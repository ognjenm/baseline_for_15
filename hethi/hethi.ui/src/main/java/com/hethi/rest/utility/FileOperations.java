package com.hethi.rest.utility;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class FileOperations {
	
	public void renameFile(String oldPath,String newPath,String filename){
		System.out.println("create folder for ftp");
		File oldFile=new File(oldPath);
		File newFolder=new File(newPath);
		File newFile=new File(newPath+"/"+filename);
		if(!newFolder.exists())
			newFolder.mkdirs();
		if(oldFile.renameTo(newFile))
			System.out.println(filename+" moved to "+newPath);
	}
	public ArrayList<String> listFilesToInsert(String form){
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File folder=new File(currentDir+"src/main/java/com/hethi/rest/model");
		ArrayList<String> fileNames=new ArrayList<String>();
		for(final File fileEntry:folder.listFiles()){
			if(fileEntry.getName().endsWith(form+".java")){
				fileNames.add(fileEntry.getName().split(".java")[0]);
			}
		}
		System.out.println(fileNames);
		return fileNames;
	}
	public String selectFile(String table,String form){
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File folder=new File(currentDir+"src/main/java/com/hethi/rest/model");
		String fileName="";
		for(final File fileEntry:folder.listFiles()){
			
			if(fileEntry.getName().startsWith("ixsd"+"_"+form)){
				if(fileEntry.getName().contains(table))
				    fileName=(fileEntry.getName().split(".java")[0]);
			}
		}
		return fileName;
	}
	public ArrayList<String> listFilesToSelect(){
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File folder=new File(currentDir+"src/main/java/com/hethi/rest/model");
		ArrayList<String> fileNames=new ArrayList<String>();
		for(final File fileEntry:folder.listFiles()){
			if(fileEntry.getName().startsWith("ixsd_")){
				String fileName=fileEntry.getName().split(".java")[0];
				int tempNameSize=fileName.replace("_", " ").split(" ").length;
				if(tempNameSize==2)
				   fileNames.add(fileName);
			}
		}
		return fileNames;
	}
	
	public ArrayList<String> listFilesToSelectException(){
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File folder=new File(currentDir+"src/main/java/com/hethi/rest/model");
		ArrayList<String> fileNames=new ArrayList<String>();
		for(final File fileEntry:folder.listFiles()){
			if(fileEntry.getName().startsWith("ixsd_") || fileEntry.getName().endsWith("_exception")){
				String fileName=fileEntry.getName().split(".java")[0];
				int tempNameSize=fileName.replace("_", " ").split(" ").length;
				if(tempNameSize==2)
					System.out.println("exception ...."+fileName);
				   fileNames.add(fileName);
			}
		}
		return fileNames;
	}
	
	
	public Object invokeMethod(String propertName,Object classObj,Method method1,String input) throws NumberFormatException, IllegalAccessException,
	IllegalArgumentException, InvocationTargetException, ParseException{
		String variable=null;
		for(final Method method : classObj.getClass().getDeclaredMethods()){
			if(method.getName().endsWith(propertName) && method.getName().startsWith("get"))
				variable=method.getGenericReturnType().toString();
		}
//		System.out.println(variable);
		if(variable.equals("int")){
			if(input==null)
				input="0";
			int inputNumber=Integer.parseInt(input);
			method1.invoke(classObj, inputNumber);
		}
		else if(variable.equals("long")){
			if(input==null)
				input="0";
			long inputNumber=Long.parseLong(input);
			method1.invoke(classObj, inputNumber);
		}
		else if(variable.equals("float")){
			if(input==null)
				input="0.0";
			float inputNumber=Float.parseFloat(input);
			method1.invoke(classObj, inputNumber);
		}
		else if(variable.equals("double")){
			if(input==null)
				input="0.0";
			double inputNumber=Double.parseDouble(input);
			method1.invoke(classObj, inputNumber);
		}
		else if(variable.equals("class java.sql.Timestamp")){
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    Date date = new Date();
		    String timestamp=null;
//		    System.out.println(input);
		    if(input.equals(null) || input.equals(""))
		    	timestamp = dateFormat.format(date);
		    else
				timestamp = input;
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		Date parsedDate = df.parse(timestamp);
    		Timestamp times=new Timestamp(parsedDate.getTime());
    		method1.invoke(classObj, times);
		}
		else if(variable.equals("class java.util.Date")){
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    Date date = new Date();
		    String timestamp=null;
		    if(input.equals(null) || input.equals(""))
		    	timestamp = dateFormat.format(date);
		    else
				timestamp = input;
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    		Date parsedDate = df.parse(timestamp);
    		Timestamp times=new Timestamp(parsedDate.getTime());
    		method1.invoke(classObj, times);
		}
		return classObj;
	}
	public ArrayList<String[]> readTextDocument(String filePath) throws IOException{
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		filePath=currentDir+filePath;
		BufferedReader in = new BufferedReader(new FileReader(filePath));
		String line,newLine;
		ArrayList<String[]> array=new ArrayList<String[]>();
		int index=0;
		while((line = in.readLine()) != null){
			if(index==0){
				index++;
				continue;
			}
				
			newLine=line.replace("|", " ");
			String [] data=newLine.split(" ");
			array.add(data);
			index++;
		}
		in.close();
		return array;
	}
	public void writeToFile(java.io.InputStream inputStream,
            String uploadedFileLocation) {

        try {
            OutputStream out = new FileOutputStream(new File(
                    uploadedFileLocation));
            int read = 0;
            byte[] bytes = new byte[1024];

            out = new FileOutputStream(new File(uploadedFileLocation));
            while ((read = inputStream.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
	public  Map<String,String> readElements(Object classObj) throws InstantiationException {
	    Method[] methods =classObj.getClass().getDeclaredMethods();
	    Map<String,String> jsonMap=new HashMap<String,String>();
	    for (Method method : methods) {
	        String name = method.getName();
	        String propertyName=method.getName().substring(3, method.getName().length());
			String jsonKey=propertyName.toLowerCase();
	        if (name.startsWith("get") && !name.equalsIgnoreCase("getClass")) {
	            String value = "";
	            try {
	                value = String.valueOf(method.invoke(classObj));
	                jsonMap.put(jsonKey, value);
	            }
	            catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return jsonMap;
	}
}
