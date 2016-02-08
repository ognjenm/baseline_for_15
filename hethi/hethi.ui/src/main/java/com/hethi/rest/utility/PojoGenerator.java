package com.hethi.rest.utility;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Serializable;
import java.util.Map;
import java.util.regex.Matcher;

public class PojoGenerator {

	public static void createClass(String className, Map<Class<?>, String> fields) throws IOException {

		StringBuilder builder = new StringBuilder();
		String packageName;
		int idx = className.lastIndexOf('.');
		if (idx >= 0) {
			packageName = className.substring(0, idx);
			className = className.substring(idx + 1);
		} else
			packageName = null;
		if (packageName != null)
			builder.append("package ").append(packageName).append(";\n");
		builder.append("import java.io.Serializable; \n");
		builder.append("public class ").append(className).append(" implements Serializable \n");
		builder.append("{\n");
		boolean flag = false;
		for (Map.Entry<Class<?>, String> field : fields.entrySet()) {
			Class<?> type = field.getKey();
			String name = field.getValue();
			String nameCapitalized = Character.toUpperCase(name.charAt(0)) + name.substring(1);
			if (flag)
				builder.append("\n");
			flag = true;
			builder.append("    private ").append(type.getCanonicalName()).append(" ").append(name).append(";\n");
			builder.append("\n");
			builder.append("    public ").append(type.getCanonicalName()).append(" get").append(nameCapitalized)
					.append(" ()\n");
			builder.append("    {\n");
			builder.append("        return ").append(name).append(";\n");
			builder.append("    }\n");
			builder.append("\n");
			builder.append("    public void set").append(nameCapitalized).append(" (").append(type.getCanonicalName())
					.append(" ").append(name).append(")\n");
			builder.append("    {\n");
			builder.append("        this.").append(name).append(" = ").append(name).append(";\n");
			builder.append("    }\n");
		}

		builder.append("}\n");
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		File dir = new File(currentDir + "src/main/java/"
				+ packageName.replaceAll("\\.", Matcher.quoteReplacement(System.getProperty("file.separator"))));

		dir.mkdirs();
		BufferedWriter writer = new BufferedWriter(
				new OutputStreamWriter(new FileOutputStream(new File(dir, className + ".java"))));

		writer.write(builder.toString());
		writer.close();
	}
}
