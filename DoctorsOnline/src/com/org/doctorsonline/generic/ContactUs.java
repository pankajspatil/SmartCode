package com.org.doctorsonline.generic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;


public class ContactUs {

	public boolean isFeedbackAdded(HttpServletRequest request){
		Connection con = null;
		
		try{
			String name = request.getParameter("name");
	  	 	String email = request.getParameter("email");
	  	 	String mobileNo = request.getParameter("mobileNo");
	  	 	String subject = request.getParameter("subject");
	  	 	
	  	 	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	  	 	con = connectionsUtil.getConnection();
	  	 	
	  	 	String query = "INSERT INTO contactus(name,email,mobileno,subject, createdby) " + 
	  	 					"VALUES(?,?,?,?,?);";
	  	 	PreparedStatement pst = con.prepareStatement(query);
	  	 	pst.setString(1, name);
	  	 	pst.setString(2, email);
	  	 	pst.setString(3, mobileNo);
	  	 	pst.setString(4, subject);
	  	 	//pst.setInt(4, request.getSession().getAttribute("userId"));
	  	 	pst.setInt(5, 1);	  	 	
	  	 	
	  	 	int rows = pst.executeUpdate();
	  	 	if(rows > 0){
	  	 		return true;
	  	 	}
	  	 	
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				con = null;
			}
		}
		
		return false;
	}
}
