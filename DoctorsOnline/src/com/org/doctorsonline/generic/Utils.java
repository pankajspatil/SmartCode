package com.org.doctorsonline.generic;

import java.sql.Connection;
import java.sql.ResultSet;

import org.json.simple.JSONObject;

public class Utils {
	
	public static String getString(String param){
		return param == null ? "" : param;
		
	}
	
	public JSONObject getConfig(){
		
		JSONObject jsonObject = new JSONObject();
		try{
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		
		Connection conn =  connectionsUtil.getConnection();
		
		String query = "select * from config where is_active = 1";
		ResultSet dataRS = conn.createStatement().executeQuery(query);
		while(dataRS.next()){
			jsonObject.put(dataRS.getString("config_key"), dataRS.getString("config_value"));
		}
		System.out.println("jsonObject of config==>" + jsonObject);
		
		ConnectionsUtil.closeResultSet(dataRS);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		
		return jsonObject;
	}

}
