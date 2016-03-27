<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.org.doctorsonline.search.Appointment"%>
<%@page import="com.org.doctorsonline.model.AppointmentModel"%>


<%@ include file="/pages/header/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Home page</title>
<script type="text/javascript"
	src="/DoctorsOnline/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="/DoctorsOnline/resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="/DoctorsOnline/resources/js/jquery-ui.js"></script>

<script type="text/javascript"
	src="/DoctorsOnline/resources/js/search.js"></script>

<link rel="stylesheet" type="text/css"
	href="/DoctorsOnline/resources/css/jquery-ui.css"></link>
<link rel="stylesheet" type="text/css"
	href="/DoctorsOnline/resources/css/jquery-ui.structure.css"></link>
<link rel="stylesheet" type="text/css"
	href="/DoctorsOnline/resources/css/jquery.dataTables.min.css"></link>


<script type="text/javascript">
	$(document).ready(function() {
		$('#appointmentData').DataTable({
			"aoColumnDefs" : [ {
				"bSortable" : false,
				"aTargets" : [ 0 ]
			} ],
			"order" : [ [ 1, "asc" ] ]
		});
	});
</script>

</head>
<%
	Appointment appointment = new Appointment();
	ArrayList<AppointmentModel> appointmentList = appointment
			.getAppointmentList();
%>
<body>
	<br />
	<br />
	<br />
	<h1 class="moduleHeader" style="text-align: center;">Appointment Home Page</h1>

	<table border="" align="center" id="patientData" class="display"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>First Name</th>
				<th>Second Name</th>
				<th>Appointment Date</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < appointmentList.size(); i++) {
					AppointmentModel appointmentModel = appointmentList.get(i);
			%>
			<tr>
				<td><%=appointmentModel.getmFirstname()%></td>
				<td><%=appointmentModel.getmLastname()%></td>
				<td><%=appointmentModel.getAppointmentDate()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>