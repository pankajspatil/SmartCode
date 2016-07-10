package com.org.doctorsonline.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.org.doctorsonline.generic.ConnectionsUtil;
import com.org.doctorsonline.model.User;

public class Login {

	Connection conn = null;
	ResultSet rs = null;
	ConnectionsUtil connectionsUtil = null;

	public Integer verifyUser(String userName, String password) {

		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "select * from usermaster where username = ? and password = ?";

			PreparedStatement psm = conn.prepareStatement(query);
			psm.setString(1, userName);
			psm.setString(2, password);

			rs = psm.executeQuery();
			if (rs.next()) {
				return rs.getInt("userId");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		rs = null;
		conn = null;

		return 0;
	}

	public Boolean verifyUser(String userName) {

		PreparedStatement psm = null;
		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "select * from usermaster where username = ?";

			psm = conn.prepareStatement(query);
			psm.setString(1, userName);

			rs = psm.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			connectionsUtil.closeConnection(psm);
		}

		rs = null;
		conn = null;

		return false;
	}

	public Boolean createNewUser(User user) {

		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "insert into userMaster(userName, firstName, middleName, lastName,"
					+ " password,RoleId,locality,Phone,DOB,sex,createdBy,createdOn,isActive,pincode,street,city) "
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement psm = conn.prepareStatement(query);
			psm.setString(1, user.getUid());
			psm.setString(2, user.getFirstName());
			psm.setString(3, user.getMiddleName());
			psm.setString(4, user.getLastName());
			psm.setString(5, user.getUid());
			psm.setString(6, user.getRoleId());
			psm.setString(7, user.getLocality());
			psm.setString(8, user.getPhone());
			psm.setString(9, user.getDob());
			psm.setString(10, user.getGender());
			psm.setString(11, "admin");
			psm.setString(12, "2015-06-13 12:32:24");
			psm.setInt(13, 1);
			psm.setString(14, user.getPinCode());
			psm.setString(15, user.getStreet());
			psm.setString(16, user.getCity());
			
			psm.executeUpdate();
			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		rs = null;
		conn = null;

		return false;
	}

	public List<String> getUserMenu(String username) {

		PreparedStatement psm = null;
		List<String> menuList = new ArrayList<String>();
		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "select mm.menu_description from role_master rm,"
					+ "role_menu_map rmm,menu_master mm,usermaster um 	where 	 "
					+ "rm.role_id = rmm.role_id and 	 um.RoleId = rm.role_id and 	 "
					+ "mm.menu_id = rmm.menu_id and "
					+ " ucase(um.username)=ucase(?)";

			psm = conn.prepareStatement(query);
			psm.setString(1, username);

			rs = psm.executeQuery();
			while (rs.next()) {
				menuList.add(rs.getString(1));
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			connectionsUtil.closeConnection(psm);
		}

		return menuList;
	}

	public ResultSet getDoctorsUser(String doctorName){
		
		ResultSet dataRS = null;
		
		try{
			connectionsUtil = new ConnectionsUtil();		
			conn = connectionsUtil.getConnection();
			String query = "select * from userMaster where createdby  = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, doctorName);
			dataRS = pst.executeQuery();
			
			query = null;connectionsUtil = null;			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return dataRS;
	}
	
}
