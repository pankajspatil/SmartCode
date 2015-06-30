package com.org.doctorsonline.generic;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//import com.mysql.jdbc.Driver;

public class ConnectionsUtil {
	
	Connection conn = null;

	public Connection getConnection() {
		try {
			/*Class.forName("com.mysql.jdbc.Driver").newInstance();
			// conn =
			// DriverManager.getConnection("jdbc:mysql://localhost:3306/testdatabase?user=testuser&password=testpassword");
			String connectionUrl = "jdbc:mysql://localhost:3306/doctorsonline";
			String connectionUser = "root";
			String connectionPassword = "admin";
			conn = DriverManager.getConnection(connectionUrl, connectionUser,
					connectionPassword);*/
			
			Context initCtx = new InitialContext();

			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			DataSource ds = (DataSource)

			envCtx.lookup("jdbc/doctorsonline");
			
			conn = ds.getConnection();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return conn;
	}
	
	
	public void closeConnection(Statement st){
		Connection con = null;
		if (st!=null){
			try {
				 con = st.getConnection();
				ResultSet rs = st.getResultSet();
				if(rs!=null){
					rs.close();
					st.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally{
				if (con != null){
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
						
		}
	}
	/*public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
//			new com.mysql.jdbc.Driver();
			Class.forName("com.mysql.jdbc.Driver").newInstance();
// conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdatabase?user=testuser&password=testpassword");
			String connectionUrl = "jdbc:mysql://localhost:3306/testdatabase";
			String connectionUser = "testuser";
			String connectionPassword = "testpassword";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM employees");
			while (rs.next()) {
				String id = rs.getString("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				System.out.println("ID: " + id + ", First Name: " + firstName
						+ ", Last Name: " + lastName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
	}*/
}
