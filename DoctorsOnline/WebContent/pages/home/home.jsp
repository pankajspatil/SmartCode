<%@page import="com.org.doctorsonline.generic.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.org.doctorsonline.search.Appointment"%>
<%@page import="java.util.LinkedHashMap" %>

<%@ include file="/pages/generic/validateSession.jsp"%>

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

<link rel="stylesheet" type="text/css"
	href="/DoctorsOnline/resources/css/visit.css"></link>

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
ArrayList<LinkedHashMap<String, String>> appointmentList = appointment
			.getAppointmentList();
%>
<body>
	<br />
	<br />
	<br />
	<h1 class="moduleHeader" style="text-align: center;">Appointment Home Page</h1>

	<table border="" align="center" id="appointmentData" class="display"
		cellspacing="0" width="100%">
		<thead>
			<tr class="mainTR">
				<th>First Name</th>
				<th>Second Name</th>
				<th>Appointment Date</th>
				<th>Operation</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < appointmentList.size(); i++) {
					LinkedHashMap<String, String> appointmentModel = appointmentList.get(i);
			%>
			<tr class="mainTR">
				<td>
					<div class="clickableLink" onclick="openPage('vNew','<%=appointmentModel.get(Constants.USER_ID) %>',
							'<%=appointmentModel.get(Constants.APPOINTMENT_ID) %>')">
						<%=appointmentModel.get(Constants.PATIENT_FIRST_NAME)%>
					</div>
				</td>
				<td><%=appointmentModel.get(Constants.PATIENT_LAST_NAME)%></td>
				<td><%=appointmentModel.get(Constants.PATIENT_APPOINTMENT_DATE)%></td>
				<td><input type="button" name="NewVisit" value="NV" onclick="openPage('vNew','<%=appointmentModel.get(Constants.USER_ID) %>')" />
				<input type="button" name="Visit History" value="VH" onclick="openPage('vHistory','<%=appointmentModel.get(Constants.USER_ID) %>')" />
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>