package com.org.doctorsonline.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.org.doctorsonline.generic.ConnectionsUtil;

public class Login {
	
	Connection conn = null;
	ResultSet rs = null;
	ConnectionsUtil connectionsUtil = null;
	
	public Boolean verifyUser(String userName, String password){		
		
		try{		
		connectionsUtil= new ConnectionsUtil();
		conn = connectionsUtil.getConnection();
		
		String query = "select * from usermaster where username = ? and password = ?";
		
		PreparedStatement psm = conn.prepareStatement(query);
		psm.setString(1, userName);
		psm.setString(2, password);
		
		rs = psm.executeQuery();
		if(rs.next()){
			return true;
		}
		
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		rs = null; conn = null;
		
		return false;
	}
	
public Boolean verifyUser(String userName){		
		
		try{		
		connectionsUtil= new ConnectionsUtil();
		conn = connectionsUtil.getConnection();
		
		String query = "select * from usermaster where username = ?";
		
		PreparedStatement psm = conn.prepareStatement(query);
		psm.setString(1, userName);
		
		rs = psm.executeQuery();
		if(rs.next()){
			return true;
		}
		
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		rs = null; conn = null;
		
		return false;
	}

public Boolean createNewUser(String userName, String firstName, String middleName, String lastName, String password){		
	
	try{		
	connectionsUtil= new ConnectionsUtil();
	conn = connectionsUtil.getConnection();
	
	String query = "insert into userMaster(userName, firstName, middleName, lastName, password, isActive,createdBy,phone) values(?,?,?,?,?,?,?,?)";
	
	PreparedStatement psm = conn.prepareStatement(query);
	psm.setString(1, userName);
	psm.setString(2, firstName);
	psm.setString(3, middleName);
	psm.setString(4, lastName);
	psm.setString(5, password);
	psm.setString(6, "Y");
	psm.setInt(7, 1);
	psm.setInt(8, 1);
	
	psm.executeUpdate();
		return true;
	
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
	rs = null; conn = null;
	
	return false;
}

}
