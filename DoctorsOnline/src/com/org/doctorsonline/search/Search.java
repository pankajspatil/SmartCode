package com.org.doctorsonline.search;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		default:

		}

		return dataRS;
	}

	public ResultSet getPatientByName(String searchValue) {
		
		ResultSet dataRS = null;
		
		try{
			connectionsUtil = new ConnectionsUtil();		
			conn = connectionsUtil.getConnection();
			
			String query = "select * from userMaster where firstName like '%"+searchValue+"%' or lastName like '%"+searchValue+"%'";
			
			System.out.println("query===>" + query);
			
			dataRS = conn.createStatement().executeQuery(query);
					
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return dataRS;
	}

	public ResultSet getPatientByMobileNo() {

		return null;
	}

	public ResultSet getPatientByAdharNo() {

		return null;
	}
	
	public void closeResultSet(ResultSet rs){
		Statement st;
		try {
			if (rs!=null){
				st = rs.getStatement();
				connectionsUtil.closeConnection(st);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
