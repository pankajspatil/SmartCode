<%@page import="java.sql.ResultSet"%>
<%@page import="com.org.doctorsonline.search.Search"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/header/doctorHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="#" name="f1" id="f1" method="post">
<h1 class="moduleHeader"> Search Patient</h1>
<table class="mainTable">
	<tr class="mainTR">
		<td>Search By</td>
		<td>Value</td>
	</tr>
	<tr class="mainTR">
		<td>
			<select name="searchKey" id="searchKey">
				<option value="-1">Please Select</option>
				<option value="1">Name</option>
				<option value="2">Mobile No</option>
				<option value="3">Adhar No</option>
				<option value="4">Adhar No</option>
			</select>
		</td>
		<td><input type="text" name="searchValue" name="searchKey" value=""> </td>
	</tr>
	<tr>
		<td colspan="2" class="searchBtn"><input type="submit" name="searchBtn" id="searchBtn" value="search" /></td>
	</tr>
</table>
<%
	if(request.getParameter("searchBtn") != null){
	Search searchPatient = new Search();
	Integer searchKey = Integer.parseInt(request.getParameter("searchKey"));
	String searchValue = request.getParameter("searchValue");
	ResultSet dataRS = null;
	try{
		dataRS = searchPatient.searchPatient(searchKey, searchValue);
	if(dataRS != null){
		%>
			<table align="center">
				<tr>
					<td>First Name</td>
					<td>Middle Name</td>
					<td>Last Name</td>
				</tr>
				<%while(dataRS.next()){
					%><tr>
					<td><%=dataRS.getString("firstName") %></td>
					<td><%=dataRS.getString("middleName") %></td>
					<td><%=dataRS.getString("lastName") %></td>
				</tr><%}%>
				
				
			</table>
		<%
	}	
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		searchPatient.closeResultSet(dataRS);
		dataRS= null;
	}
	}// end of request
%>

</form>
</body>
</html>