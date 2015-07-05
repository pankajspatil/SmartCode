package com.org.doctorsonline.services;

import java.sql.Connection;
import java.sql.Statement;

import com.org.doctorsonline.generic.ConnectionsUtil;
import com.org.doctorsonline.model.User;

public class OnlineServices {
	
	ConnectionsUtil connectionsUtil = null;
	
	public boolean saveUser(User user) {
		connectionsUtil=  new ConnectionsUtil();
		Connection conn = (Connection) connectionsUtil.getConnection();

		StringBuffer queryBuff = new StringBuffer();
		queryBuff.append("INSERT INTO citybazz_doctoronline.usermaster");
		queryBuff.append("(userName,");
		queryBuff.append("firstName,");
		queryBuff.append("middleName,");
		queryBuff.append("lastName,");
		queryBuff.append("PASSWORD,");		
		queryBuff.append("RoleId,");
		queryBuff.append("userAddress,");
		queryBuff.append("Phone,");
		queryBuff.append("DOB,");
		queryBuff.append("createdBy,");
		queryBuff.append("createdOn,");
		queryBuff.append("isActive)");
		queryBuff.append(" VALUES( ");
		queryBuff.append(user.getUid() + ",");
		queryBuff.append("'"+user.getFirstName() + "',");
		queryBuff.append("'"+user.getMiddleName() + "',");
		queryBuff.append("'"+user.getLastName() + "',");
		queryBuff.append("'"+user.getUid() + "',");
		queryBuff.append("'2',");
		queryBuff.append("'"+user.getAddress() + "',");
		queryBuff.append("'"+user.getPhone() + "',");
		queryBuff.append("'"+user.getDob() + "',");
		queryBuff.append("'admin',");
		queryBuff.append("'2015-06-13 12:32:24',");
		queryBuff.append("'1')");

		// PreparedStatement psm = conn.prepareStatement(query);
		// psm.setString(1, userName);
		// psm.setString(2, password);
		Statement st = null;
		System.out.println(queryBuff.toString());
		try {
			 st = conn.createStatement();
			st.executeUpdate(queryBuff.toString());
			st.close();

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}finally{
			connectionsUtil.closeConnection(st);
		}
		
		return true;

	}

}
