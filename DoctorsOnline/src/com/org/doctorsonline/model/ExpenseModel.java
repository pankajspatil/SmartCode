package com.org.doctorsonline.model;

import java.sql.Timestamp;

public class ExpenseModel {

	private String expense_desc;
	private double expense_bill_amount;
	private int user_id;
	private Timestamp expense_created_date;
	private String expense_created_by;

	public String getExpense_desc() {
		return expense_desc;
	}

	public void setExpense_desc(String expense_desc) {
		this.expense_desc = expense_desc;
	}

	public double getExpense_bill_amount() {
		return expense_bill_amount;
	}

	public void setExpense_bill_amount(double expense_bill_amount) {
		this.expense_bill_amount = expense_bill_amount;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Timestamp getExpense_created_date() {
		return expense_created_date;
	}

	public void setExpense_created_date(Timestamp expense_created_date) {
		this.expense_created_date = expense_created_date;
	}

	public String getExpense_created_by() {
		return expense_created_by;
	}

	public void setExpense_created_by(String expense_created_by) {
		this.expense_created_by = expense_created_by;
	}
}
