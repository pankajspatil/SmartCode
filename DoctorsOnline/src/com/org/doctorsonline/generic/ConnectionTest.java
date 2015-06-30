package com.org.doctorsonline.generic;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;



public class ConnectionTest {

	public static void main(String[] args){
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection(); 
		
		try {
			
			if(conn != null){
				System.out.println("Got Connection");
			}
			
			ResultSet rs = conn.createStatement().executeQuery("select * from usermaster");
			while(rs.next()){
				System.out.println("User Name" + rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
