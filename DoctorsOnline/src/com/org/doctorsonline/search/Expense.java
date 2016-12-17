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
import com.org.doctorsonline.model.ExpenseModel;

public class Expense {
	
	static Connection conn = null;
	static ResultSet rs = null;
	static ConnectionsUtil connectionsUtil = null;
	
	public static void addExpense(ExpenseModel expenseModel) {

		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "insert into Expense "
					+ "(expense_desc,expense_bill_amount, user_id,expense_created_date,"
					+ "expense_created_by)"
					+ " VALUES  (?,?,?,?,?)";

			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1,
					Utils.getString(expenseModel.getExpense_desc()));
			preparedStatement.setDouble(2, expenseModel.getExpense_bill_amount());
			preparedStatement.setInt(3, expenseModel.getUser_id());
			preparedStatement.setTimestamp(4,
					expenseModel.getExpense_created_date());
			preparedStatement.setString(5,
					expenseModel.getExpense_created_by());
			

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
	
	public static ArrayList<LinkedHashMap<String, String>> getExpenseList(int Userid){
		ArrayList<LinkedHashMap<String, String>> expenseList = new ArrayList<LinkedHashMap<String, String>>();

		try {
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "SELECT * FROM citybazz_doctoronline.expense ex"					
					+ " where ex.user_Id=?";
					
					

			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, Userid);
			rs = preparedStatement.executeQuery();

			LinkedHashMap<String, String> expenseModel = null;
			while (rs.next()) {
				expenseModel = new LinkedHashMap<String, String>();
				expenseModel.put(Constants.EXPENSE_ID,rs.getString("expense_id"));
				expenseModel.put(Constants.EXPENSE_DESC,rs.getString("expense_desc"));
				expenseModel.put(Constants.EXPENSE_AMOUNT,rs.getString("expense_bill_amount"));
				expenseList.add(expenseModel);
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

		return expenseList;

	}

}
