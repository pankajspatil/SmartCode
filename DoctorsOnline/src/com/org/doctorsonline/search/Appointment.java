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
import com.org.doctorsonline.generic.Utils;
import com.org.doctorsonline.model.Appointment_Master;
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
				user.setUserId(rs.getString("userId"));
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

public void createAppointment(Appointment_Master appointment_Master){
		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "insert into Appointment_Master "
					+ "(appointment_desc,doctor_id, patient_id,appointment_date,"
					+ "appointment_StartTime,appointment_EndTime,appointment_Status)"
					+ " VALUES  (?,?,?,?,?,?,?)" ;
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1,Utils.getString(appointment_Master.getAppointment_desc()) );
			preparedStatement.setInt(2,appointment_Master.getDoctor_id() );
			preparedStatement.setInt(3,appointment_Master.getPatient_id() );
			preparedStatement.setDate(4,appointment_Master.getAppointment_date());
			preparedStatement.setTimestamp(5, appointment_Master.getAppointment_StartTime());
			preparedStatement.setTimestamp(6, appointment_Master.getAppointment_EndTime());
			preparedStatement.setString(7,"Booked");
			
			preparedStatement.executeUpdate();
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

	}

}
