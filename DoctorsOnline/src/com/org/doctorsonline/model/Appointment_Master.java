package com.org.doctorsonline.model;

import java.sql.Timestamp;
import java.sql.Date;

public class Appointment_Master {

	private String appointment_desc;
	
	private int doctor_id; 
	private int patient_id; 
	private Date appointment_date; 
	private Timestamp appointment_StartTime; 
	private Timestamp appointment_EndTime; 
	private String appointment_Status;
	
	
	public String getAppointment_desc() {
		return appointment_desc;
	}
	public void setAppointment_desc(String appointment_desc) {
		this.appointment_desc = appointment_desc;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	public Date getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(Date appointment_date) {
		this.appointment_date = appointment_date;
	}
	public Timestamp getAppointment_StartTime() {
		return appointment_StartTime;
	}
	public void setAppointment_StartTime(Timestamp appointment_StartTime) {
		this.appointment_StartTime = appointment_StartTime;
	}
	public Timestamp getAppointment_EndTime() {
		return appointment_EndTime;
	}
	public void setAppointment_EndTime(Timestamp appointment_EndTime) {
		this.appointment_EndTime = appointment_EndTime;
	}
	public String getAppointment_Status() {
		return appointment_Status;
	}
	public void setAppointment_Status(String appointment_Status) {
		this.appointment_Status = appointment_Status;
	}
}
