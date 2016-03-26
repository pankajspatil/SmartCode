package com.org.doctorsonline.model;

public class AppointmentModel {

	private String mFirstname;
	private String mLastname;
	private String appointmentDate;
	
	
	
	public AppointmentModel(String mFirstname, String mLastname,
			String appointmentDate) {
		super();
		this.mFirstname = mFirstname;
		this.mLastname = mLastname;
		this.appointmentDate = appointmentDate;
	}
	public String getmFirstname() {
		return mFirstname;
	}
	public void setmFirstname(String mFirstname) {
		this.mFirstname = mFirstname;
	}
	public String getmLastname() {
		return mLastname;
	}
	public void setmLastname(String mLastname) {
		this.mLastname = mLastname;
	}
	public String getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	
}
