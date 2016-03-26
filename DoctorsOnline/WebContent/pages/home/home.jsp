<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.org.doctorsonline.search.Appointment"%>
<%@page import="com.org.doctorsonline.model.AppointmentModel"%>


<%@ include file="/pages/header/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
Appointment appointment = new Appointment();
ArrayList<AppointmentModel> appointmentList = appointment.getAppointmentList();

%>
<body>
<table>
	<tr>
	<th>First Name</th>
	<th>Second Name</th>
	<th>Appointment Date</th>
	</tr>
		<%
			for (int i = 0; i < appointmentList.size(); i++) {
				AppointmentModel appointmentModel = appointmentList.get(i);
		%>
		<tr>
			<td><%=appointmentModel.getmFirstname() %></td>
			<td><%=appointmentModel.getmLastname() %></td>
			<td><%=appointmentModel.getAppointmentDate() %></td>
		</tr>
		<%
			}
		%>
		<tr>
	
	</tr>
</table>
</body>
</html>