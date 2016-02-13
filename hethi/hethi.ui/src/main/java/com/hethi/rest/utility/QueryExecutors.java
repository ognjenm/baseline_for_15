package com.hethi.rest.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class QueryExecutors {
	
	static final String url,user,password;
	
	static{
		Properties prop = new Properties();
		InputStream input = null;
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.lastIndexOf('.')).replace('\\', '/');
		try {
			input = new FileInputStream(currentDir + "src/main/resources/application.properties");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		try {
			prop.load(input);
		} catch (IOException e) {
			e.printStackTrace();
		}
		url = prop.getProperty("spring.datasource.url");
		user = prop.getProperty("spring.datasource.username");
		password = prop.getProperty("spring.datasource.password");
	}
	
	@SuppressWarnings({ "rawtypes" })
	
    public ArrayList<ArrayList> callProcedure(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
	
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			CallableStatement stm = conn.prepareCall(query);
			boolean results = stm.execute();
			int index = 0;
			while (results) {
				resultList = new ArrayList<Map>();
				ResultSet rs = stm.getResultSet();
				ResultSetMetaData rsmd = rs.getMetaData();
				int numberOfColumns = rsmd.getColumnCount();
				Map<String, String> singleRow = null;
				int i;
				if (rs.next()) {
					rs.beforeFirst();
					while (rs.next()) {
						index++;
						i = 1;
						singleRow = new HashMap<String, String>();
						while (i <= numberOfColumns) {
							singleRow.put(rsmd.getColumnLabel(i), rs.getString(i));
							i++;
						}
						if (index == 1)
							singleRow.put("result", "Success");
						System.out.println(singleRow+" map");
						resultList.add(singleRow);
					}
					System.out.println(resultList+" resultList");
					resultSet.add(resultList);
				} else {
					singleRow = new HashMap<String, String>();
					singleRow.put("result", "No Data");
					resultList.add(singleRow);
					resultSet.add(resultList);
				}
				results = stm.getMoreResults();
			}
			stm.close();
			conn.close();
			System.out.println(resultSet+" resultSet");
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}

	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> executeInsertOrUpdate(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			CallableStatement stm = conn.prepareCall(query);
			int record = stm.executeUpdate();
			resultList = new ArrayList<Map>();
			Map<String, String> singleRow = new HashMap<String, String>();
			if (record > 0) {
				singleRow.put("result", "Success");
			} else if (record == 0) {
				singleRow.put("result", "No Data");
			} else {
				singleRow.put("result", "Error");
			}
			resultList.add(singleRow);
			resultSet.add(resultList);
			stm.close();
			conn.close();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}

	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> getTableMetaData(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			resultList = new ArrayList<Map>();
			Map<String, String> singleRow = null;
			int index = 1;
			singleRow = new HashMap<String, String>();
			singleRow.put("result", "Success");
			resultList.add(singleRow);
			resultSet.add(resultList);
			resultList = new ArrayList<Map>();
			while (index <= numberOfColumns) {
				singleRow = new HashMap<String, String>();
				singleRow.put("column", rsmd.getColumnName(index));
				resultList.add(singleRow);
				index++;
			}
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}

	@SuppressWarnings("rawtypes")
	public ArrayList<ArrayList> getDynamicTableData(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			resultList = new ArrayList<Map>();
			Map<String, String> singleRow = null;
			int index = 1;
			if (rs.next()) {
				singleRow = new HashMap<String, String>();
				singleRow.put("result", "Success");
				resultList.add(singleRow);
				resultSet.add(resultList);
				resultList = new ArrayList<Map>();
				singleRow = new HashMap<String, String>();
				rs.first();
				while (index <= numberOfColumns) {
					singleRow.put("column", rs.getString(index));
					resultList.add(singleRow);
					singleRow = new HashMap<String, String>();
					index++;
				}

				resultSet.add(resultList);
			} else {
				Map<String, String> singleRow1 = new HashMap<String, String>();
				singleRow1.put("result", "No Data");
				resultList.add(singleRow1);
				resultSet.add(resultList);
			}

			conn.close();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}

	public ArrayList<String> checkRecord(String query) throws IOException, SQLException {
		String returnFlag = "No data";
		String[] abc = null;
		ArrayList<String> list = new ArrayList<String>();
		
		Map<String, String> returnMap = new HashMap<String, String>();
		// load a properties file
		
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				int index = 1;
				rs.beforeFirst();
				int i = 0;
				while (rs.next()) {
					list.add(rs.getString(index));
					index++;
					i++;

				}
			} else {

			}

		} catch (Exception e) {

		}
		conn.close();
		return list;
	}

	public Map<String, String> getData(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		Map<String, String> singleRow = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			resultList = new ArrayList<Map>();

			int index = 1;
			singleRow = new HashMap<String, String>();
			singleRow.put("result", "Success");
			resultList.add(singleRow);
			resultSet.add(resultList);
			resultList = new ArrayList<Map>();
			while (index <= numberOfColumns) {
				singleRow = new HashMap<String, String>();
				singleRow.put(rsmd.getColumnName(index), rs.getString(index));
				resultList.add(singleRow);
				index++;
			}
			resultSet.add(resultList);
			conn.close();
			return singleRow;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return singleRow1;
		}
	}

	public ArrayList<ArrayList> getIxsdMetaData(String query)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
		ArrayList<ArrayList> resultSet = new ArrayList<ArrayList>();
		ArrayList<Map> resultList = null;
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			resultList = new ArrayList<Map>();
			Map<String, String> singleRow = null;
			int index = 1;
			singleRow = new HashMap<String, String>();
			singleRow.put("result", "Success");
			resultList.add(singleRow);
			resultSet.add(resultList);
			resultList = new ArrayList<Map>();
			while (index <= numberOfColumns) {
				singleRow.put(rsmd.getColumnName(index), "");
				resultList.add(singleRow);
				index++;
			}
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> singleRow1 = new HashMap<String, String>();
			singleRow1.put("result", "Error");
			resultList.add(singleRow1);
			resultSet.add(resultList);
			conn.close();
			return resultSet;
		}
	}
}
