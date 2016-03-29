/**
 * 
 */
package com.org.doctorsonline.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import com.org.doctorsonline.generic.ConnectionsUtil;
import com.org.doctorsonline.generic.Constants;
import com.org.doctorsonline.generic.Utils;
import com.org.doctorsonline.model.AppointmentModel;
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

		ArrayList<User> doctorList = new ArrayList<User>();

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

		return doctorList;
	}

	public void createAppointment(Appointment_Master appointment_Master) {
		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "insert into Appointment_Master "
					+ "(appointment_desc,doctor_id, patient_id,appointment_date,"
					+ "appointment_StartTime,appointment_EndTime,appointment_Status)"
					+ " VALUES  (?,?,?,?,?,?,?)";

			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1,
					Utils.getString(appointment_Master.getAppointment_desc()));
			preparedStatement.setInt(2, appointment_Master.getDoctor_id());
			preparedStatement.setInt(3, appointment_Master.getPatient_id());
			preparedStatement.setDate(4,
					appointment_Master.getAppointment_date());
			preparedStatement.setTimestamp(5,
					appointment_Master.getAppointment_StartTime());
			preparedStatement.setTimestamp(6,
					appointment_Master.getAppointment_EndTime());
			preparedStatement.setString(7, "Booked");

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

	public ArrayList<User> getAppointmentTimings(String doctorId) {

		ArrayList<User> doctorList = new ArrayList<User>();

		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "SELECT * FROM usermaster um,"
					+ "role_master rm where um.roleid = rm.role_id "
					+ "	and rm.role_description = ?";

			query += "select t.* from time_master t left join (select time_id from appointment_timings where doctor_id = 1) "
					+ "atm on t.time_id = atm.time_id where atm.doctor_id = 1;  ";

			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, doctorId);
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

		return doctorList;
	}

	public LinkedHashMap<String, String> getTimings(String selectedDate) {

		LinkedHashMap<String, String> timingsMap = new LinkedHashMap<String, String>();

		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "select * from time_master t "
					+ "left join (select * from appointment_master a "
					+ "where a.appointment_date = '" + selectedDate
					+ "') ap on t.time_id = ap.time_id "
					+ "where appointment_id is null and t.is_active = 1";
			rs = conn.createStatement().executeQuery(query);
			while (rs.next()) {
				timingsMap.put(
						rs.getString("hour") + ":" + rs.getString("minutes"),
						rs.getString("time_id"));
			}

		} catch (Exception ex) {
			ex.printStackTrace();

		}
		ConnectionsUtil.closeResultSet(rs);

		return timingsMap;
	}

	public Integer createAppointment(String doctorId, String patientId,
			String date, String timeId, String userId, String comments) {

		try {

			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "select * from appointment_master where doctor_id = ? and patient_id = ? and "
					+ "appointment_date = ? and time_id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);

			psmt.setInt(1, Integer.parseInt(doctorId));
			psmt.setString(2, patientId);
			psmt.setString(3, date);
			psmt.setString(4, timeId);

			ResultSet dataRS = psmt.executeQuery();
			if (dataRS.next()) {
				return 1;
			}

			query = "INSERT INTO `appointment_master` "
					+ "(`appointment_desc`,`doctor_id`,`patient_id`,`appointment_date`,"
					+ "`time_id`,`created_by`, appointment_status) "
					+ "VALUES(?,?,?,?,?,?,(select status_id from status_master where status_code = 'OPEN'));";
			psmt = conn.prepareStatement(query);

			psmt.setString(1, comments);
			psmt.setString(2, doctorId);
			psmt.setString(3, patientId);
			psmt.setString(4, date);
			psmt.setString(5, timeId);
			psmt.setString(6, userId);

			psmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("Error while creating appointment");
			ex.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return 0;
	}
	
	public ArrayList<LinkedHashMap<String, String>> getAppointmentList(){
		ArrayList<LinkedHashMap<String, String>> appointmentList = new ArrayList<LinkedHashMap<String, String>>();

		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "SELECT * FROM citybazz_doctoronline.appointment_master am,"
					+ " citybazz_doctoronline.time_master tm,citybazz_doctoronline.usermaster um"
					+ " where am.patient_id=um.userid"
					+ " and am.time_id=tm.time_id "
					+ " and am.appointment_date >= date(sysdate())";

			PreparedStatement preparedStatement = conn.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			LinkedHashMap<String, String> appointmentModel = null;
			while (rs.next()) {
				appointmentModel = new LinkedHashMap<String, String>();
				appointmentModel.put(Constants.PATIENT_FIRST_NAME,rs.getString("firstName"));
				appointmentModel.put(Constants.USER_ID,rs.getString("userId"));
				appointmentModel.put(Constants.PATIENT_LAST_NAME,rs.getString("lastName"));
				appointmentModel.put(Constants.PATIENT_APPOINTMENT_DATE,rs.getString("appointment_date"));
				appointmentList.add(appointmentModel);
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

		return appointmentList;

	}

}
