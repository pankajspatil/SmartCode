<%@page import="com.org.doctorsonline.generic.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.org.doctorsonline.search.Expense"%>
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
Integer userId = Integer.parseInt(session.getAttribute("userId")
		+ "");
ArrayList<LinkedHashMap<String, String>> expenseList = Expense.getExpenseList(userId);
%>
	<br />
	<h1 class="moduleHeader" style="text-align: center;">Appointment Home Page</h1>

	<table border="" align="center" id="appointmentData" class="display"
		cellspacing="0" width="100%">
		<thead>
			<tr class="mainTR">
				<th>Expense Id</th>
				<th>Expense Description</th>
				<th>Expense Amount</th>				
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < expenseList.size(); i++) {
					LinkedHashMap<String, String> appointmentModel = expenseList.get(i);
			%>
			<tr class="mainTR">
				<td><%=appointmentModel.get(Constants.EXPENSE_ID)%></td>
				<td><%=appointmentModel.get(Constants.EXPENSE_DESC)%></td>
				<td><%=appointmentModel.get(Constants.EXPENSE_AMOUNT)%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>