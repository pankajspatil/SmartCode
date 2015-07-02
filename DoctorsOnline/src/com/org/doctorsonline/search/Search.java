package com.org.doctorsonline.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.org.doctorsonline.generic.ConnectionsUtil;

public class Search {

	Connection conn = null;
	ResultSet rs = null;
	ConnectionsUtil connectionsUtil = null;

	public ResultSet searchPatient(Integer searchKey, String searchValue) {

		ResultSet dataRS = null;
		
		switch (searchKey) {
		case 1:
			dataRS = getPatientByName(searchValue);
			break;
		case 2:
			dataRS = getPatientByMobileNo(searchValue);
			break;
		case 4:
			dataRS = getPatientByDOB(searchValue);
			break;
		default:

		}

		return dataRS;
	}

	private ResultSet getPatientByDOB(String dob) {

		ResultSet dataRS = null;
		
		try{
			connectionsUtil = new ConnectionsUtil();		
			conn = connectionsUtil.getConnection();
			String query = "select * from userMaster where dob  = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			dataRS = pst.executeQuery();
			
			query = null;connectionsUtil = null;			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return dataRS;
	}

	public ResultSet getPatientByName(String searchValue) {
		
		ResultSet dataRS = null;
		
		try{
			connectionsUtil = new ConnectionsUtil();		
			conn = connectionsUtil.getConnection();
			String query = "select * from userMaster where firstName like '%"+searchValue+"%' or lastName like '%"+searchValue+"%'";
			dataRS = conn.createStatement().executeQuery(query);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return dataRS;
	}

	public ResultSet getPatientByMobileNo(String phone) {

		ResultSet dataRS = null;
		try{
			connectionsUtil = new ConnectionsUtil();		
			conn = connectionsUtil.getConnection();
			String query = "select * from userMaster where phone = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, phone);
			dataRS = pst.executeQuery();
			
			query = null;connectionsUtil = null;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return dataRS;
	}

	public ResultSet getPatientByAdharNo() {

		return null;
	}
	
	

}
