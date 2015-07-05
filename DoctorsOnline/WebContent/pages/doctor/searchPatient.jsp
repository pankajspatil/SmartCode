<%@page import="com.org.doctorsonline.generic.ConnectionsUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.doctorsonline.search.Search"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/generic/validateSession.jsp"%>
<%@ include file="/pages/header/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="/DoctorsOnline/resources/js/jquery.js"></script>
<script type="text/javascript" src="/DoctorsOnline/resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/DoctorsOnline/resources/js/jquery-ui.js"></script>

<script type="text/javascript" src="/DoctorsOnline/resources/js/search.js"></script>

<link rel="stylesheet" type="text/css" href="/DoctorsOnline/resources/css/jquery-ui.css"></link>
<link rel="stylesheet" type="text/css" href="/DoctorsOnline/resources/css/jquery-ui.structure.css"></link>
<link rel="stylesheet" type="text/css" href="/DoctorsOnline/resources/css/jquery.dataTables.min.css"></link>


<script type="text/javascript">
$(document).ready(function() {
    $('#patientData').DataTable({    
    	"aoColumnDefs": [{ "bSortable": false, "aTargets": [ 0 ] }],
    	"order": [[ 1, "asc" ]]
    });
} );

</script>
</head>
<body>
<form action="searchPatient.jsp" name="f1" id="f1" method="post">
<h1 class="moduleHeader" style="text-align: center;"> Search Patient</h1>
<table class="mainTable" align="center">
	<tr class="mainTR">
		<th>Search By</th>
		<th>Value</th>
	</tr>
	<tr class="mainTR">
		<td>
			<select name="searchKey" id="searchKey" onchange="searchKeySelect(this)">
				<option value="-1">Please Select</option>
				<option value="1">Name</option>
				<option value="2">Mobile No</option>
				<option value="3">DOB</option>
				<option value="4">Adhar No</option>
			</select>
		</td>
		<td><input type="text" name="searchValue" id="searchValue" value="" autocomplete="off"> </td>
	</tr>
	<tr>
		<td colspan="2" class="searchBtn" align="center"><input type="submit" name="searchBtn" id="searchBtn" value="search" /></td>
	</tr>
</table>
<%
	if(request.getParameter("searchBtn") != null){
		%>
			<br/><br/><br/>
			<table border="" align="center" id="patientData" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>First Name</th>
						<th>Middle Name</th>
						<th>Last Name</th>
						<th>Phone</th>
						<th>Operations</th>
					</tr>
				</thead>
				<tbody>
		<%
	Search searchPatient = new Search();
	Integer searchKey = Integer.parseInt(request.getParameter("searchKey"));
	String searchValue = request.getParameter("searchValue");
	ResultSet dataRS = null;
	try{
		dataRS = searchPatient.searchPatient(searchKey, searchValue);
	if(dataRS != null){
		while(dataRS.next()){
			%><tr>
			<th><%=dataRS.getString("firstName") %></th>
			<th><%=dataRS.getString("middleName") %></th>
			<th><%=dataRS.getString("lastName") %></th>
			<th><%=dataRS.getString("phone") %></th>
			<th>
				<input type="button" name="Edit" value="E" onclick="openPage('edit','<%=dataRS.getString("userId") %>')" />
				<input type="button" name="Delete" value="D" onclick="openPage('delete','<%=dataRS.getString("userId") %>')" />
				<input type="button" name="NewVisit" value="NV" onclick="openPage('vNew','<%=dataRS.getString("userId") %>')" />
				<input type="button" name="Visit History" value="VH" onclick="openPage('vHistory','<%=dataRS.getString("userId") %>')" />
			</th>
		</tr><%}
	}	
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		ConnectionsUtil.closeResultSet(dataRS);
		dataRS= null;
	}
	%></tbody>
				
			</table><%
	}// end of request
%>

</form>
</body>
</html>