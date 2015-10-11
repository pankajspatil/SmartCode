<%@page import="com.org.doctorsonline.search.Appointment"%>
<%@page import="com.org.doctorsonline.model.Appointment_Master"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

Appointment_Master appointMaster = new Appointment_Master();

appointMaster.setDoctor_id(Integer.parseInt(request.getParameter("appointDoctorName")+""));
appointMaster.setPatient_id(Integer.parseInt(request.getParameter("appointPatientName")+""));
appointMaster.setAppointment_desc(request.getParameter("patientQuery"));

Appointment appointment =new Appointment();
appointment.createAppointment(appointMaster);

out.println("Appointment created");
%>