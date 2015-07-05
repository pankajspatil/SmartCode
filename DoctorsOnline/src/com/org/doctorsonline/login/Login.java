package com.org.doctorsonline.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.org.doctorsonline.generic.ConnectionsUtil;
import com.org.doctorsonline.model.User;

public class Login {
	
	Connection conn = null;
	ResultSet rs = null;
	ConnectionsUtil connectionsUtil = null;
	
	public Integer verifyUser(String userName, String password){		
		
		try{		
		connectionsUtil= new ConnectionsUtil();
		conn = connectionsUtil.getConnection();
		
		String query = "select * from usermaster where username = ? and password = ?";
		
		PreparedStatement psm = conn.prepareStatement(query);
		psm.setString(1, userName);
		psm.setString(2, password);
		
		rs = psm.executeQuery();
		if(rs.next()){
			return rs.getInt("userId");
		}
		
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		rs = null; conn = null;
		
		return 0;
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

public Boolean createNewUser(User user){		
	
	try{		
	connectionsUtil= new ConnectionsUtil();
	conn = connectionsUtil.getConnection();
	
	String query = "insert into userMaster(userName, firstName, middleName, lastName, password,RoleId,userAddress,Phone,DOB,sex,createdBy,createdOn,isActive) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	
	PreparedStatement psm = conn.prepareStatement(query);
	psm.setString(1, user.getUid());
	psm.setString(2, user.getFirstName());
	psm.setString(3, user.getMiddleName());
	psm.setString(4, user.getLastName());
	psm.setString(5, user.getUid());
	psm.setString(6, user.getRoleId());
	psm.setString(7, user.getAddress());
	psm.setString(8, user.getPhone());
	psm.setString(9, user.getDob());
	psm.setString(10, user.getGender());
	psm.setString(11,"admin");
	psm.setString(12,"2015-06-13 12:32:24");
	psm.setInt(13, 1);
	
	psm.executeUpdate();
		return true;
	
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
	rs = null; conn = null;
	
	return false;
}

}
