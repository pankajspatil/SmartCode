/**
 * 
 */
package com.org.doctorsonline.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.org.doctorsonline.generic.ConnectionsUtil;
import com.org.doctorsonline.model.User;

/**
 * @author Patil
 *
 */
public class Appointment {
	
	
	Connection conn = null;
	ResultSet rs = null;
	ConnectionsUtil connectionsUtil = null;

	public ArrayList<User> getUserList(String roleDesc) {
		
		ArrayList<User> doctorList= new ArrayList<User>();

		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "SELECT * FROM usermaster um,"
					+ "role_master rm where um.roleid = rm.role_id "
					+ "	and rm.role_description = ?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, roleDesc);
			rs = preparedStatement.executeQuery();	
			
			
			User user = null;
			while (rs.next()) {
				user = new User();
				user.setUserName(rs.getString("userName"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setLocality(rs.getString("locality"));
				user.setPhone(rs.getString("phone"));
				doctorList.add(user);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(conn !=null){
					conn.close();
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		rs = null;
		conn = null;

		return doctorList;
	}

	
	

}
