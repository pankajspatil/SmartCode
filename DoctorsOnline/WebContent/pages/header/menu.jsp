<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Doctor</title>
</head>
<body>
	<% String Contextpath = request.getContextPath();
    	ArrayList<String> menulist = session.getAttribute("menu") != null ? (ArrayList<String>) session.getAttribute("menu") : new ArrayList<String>();
    	
    	System.out.println("menulist===>" + menulist);
	%>
	<div id='cssmenu'>
		<ul>
			<%
				if (menulist.contains("Home")) {
			%>
			<li><a href='<%=Contextpath%>/pages/home/home.jsp'><span>Home</span></a></li>
			<%
				}
			%>
			<%
				if (menulist.contains("Patient")) {
			%>
			<li><a href='#'><span>Patient</span></a></li>
			<%
				}
			%>
			<%
				if (menulist.contains("Search")) {
			%>
			<li><a href='<%=Contextpath%>/pages/doctor/searchPatient.jsp'><span>Search</span></a></li>
			<%
				}
			%>
			<%
				if (menulist.contains("Registration")) {
			%>
			<li><a href='<%=Contextpath%>/pages/doctor/createUser.jsp'><span>Registration</span></a></li>
			<%
				}
			%>
			<%
				if (menulist.contains("Appointment")) {
			%>
			<li><a href='<%=Contextpath%>/pages/doctor/appointment.jsp'><span>Appointment</span></a></li>
			<%
				}
			%>
			<%
				if (menulist.contains("Logout")) {
			%>
			<li class='last'><a
				href='<%=Contextpath%>/pages/login/logout.jsp'><span>Logout</span></a></li>
			<%}
%>


		</ul>
	</div>
</body>
</html>
