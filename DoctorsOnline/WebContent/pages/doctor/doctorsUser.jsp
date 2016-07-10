<%@page import="com.org.doctorsonline.generic.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.org.doctorsonline.login.Login"%>
<%@page import="java.util.LinkedHashMap" %>

<%@ include file="/pages/generic/validateSession.jsp"%>
<%@page import="com.org.doctorsonline.generic.ConnectionsUtil"%>
<%@page import="java.sql.ResultSet"%>
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
<body>
<BR><BR>
	<table border="" align="center" id="patientData" class="display"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>First Name</th>
				<th>Middle Name</th>
				<th>Last Name</th>
				<th>User Name</th>
				<th>Password</th>
			</tr>
		</thead>
		<tbody>
			<%
				ResultSet dataRS = null;
				try {
					Login login = new Login();
					String doctorName = (String)session.getAttribute("userName");
					dataRS = login.getDoctorsUser(doctorName);
					if (dataRS != null) {
						while (dataRS.next()) {
			%><tr>
				<th><%=dataRS.getString("firstName")%></th>
				<th><%=dataRS.getString("middleName")%></th>
				<th><%=dataRS.getString("lastName")%></th>
				<th><%=dataRS.getString("Username")%></th>
				<th><%=dataRS.getString("Password")%></th>
			</tr>
			<%
				}
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ConnectionsUtil.closeResultSet(dataRS);
					dataRS = null;
				}
			%>
		</tbody>

	</table>
</body>
</html>