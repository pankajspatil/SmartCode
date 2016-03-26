package com.org.doctorsonline.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.LinkedHashMap;

import com.org.doctorsonline.generic.ConnectionsUtil;
import com.org.doctorsonline.generic.Constants;

public class Visit {

public Integer createNewVisit(LinkedHashMap<String, String> paramMap){
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	
	try{
		
		Connection conn = connectionsUtil.getConnection();
		
		String query = "INSERT INTO `user_visit` (`user_id`,`weight`,`height`,"
				+ "`bp`,`bmi`,`gfr`,`hbv`,`hiv`,`g6pd`,`ahb`, "+
				"`allergy`,`summary`,`prescription_data`,`created_by`) " +
				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(query);
		
		psmt.setString(1, paramMap.get(Constants.PATIENT_ID));
		psmt.setString(2, paramMap.get(Constants.WEIGHT));
		psmt.setString(3, paramMap.get(Constants.HEIGHT));
		psmt.setString(4, paramMap.get(Constants.BP));
		psmt.setString(5, paramMap.get(Constants.BMI));
		psmt.setString(6, paramMap.get(Constants.GFR));
		psmt.setString(7, paramMap.get(Constants.HBV));
		psmt.setString(8, paramMap.get(Constants.HIV));
		psmt.setString(9, paramMap.get(Constants.G6PD));
		psmt.setString(10, paramMap.get(Constants.ABNORMAL_HB));
		psmt.setString(11, paramMap.get(Constants.ALLERGY));
		psmt.setString(12, paramMap.get(Constants.VISIT_SUMMARY));
		psmt.setString(13, paramMap.get(Constants.PRESCRIPTION_DATA));
		psmt.setString(14, paramMap.get(Constants.USER_ID));
		
		psmt.executeUpdate();
		
		ConnectionsUtil.closeConnection(psmt);
		
		return 0;
		
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
	return 1;
}
	
}