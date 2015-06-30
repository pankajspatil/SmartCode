<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/menu.css">
<script src="<%=request.getContextPath() %>/resources/js/jquery-latest.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/menu.js"></script>

<title>Doctor's Medicine</title>
</head>
<body>
<div>Logo</div>
<div id='cssmenu'>
<ul>
   <li><a href='#'><span>Home</span></a></li>
   <!-- <li class='active has-sub'><a href='#'><span>Login</span></a> -->
   <li><a href='#'><span>Patient</span></a>
       <ul>
         <li class='has-sub'><a href='#'><span>Registration</span></a>
            <ul>
               <li><a href='/DoctorsOnline/pages/login/PatientRegistration.jsp'><span>New</span></a></li>
               <li class='last'><a href='/DoctorsOnline/pages/doctor/searchPatient.jsp'><span>Search</span></a></li>
            </ul>
         </li>
<!--          <li class='has-sub'><a href='#'><span>Search</span></a> -->
<!--             <ul> -->
<%--                <li><a href='<%=request.getContextPath() %>/web/pages/doctor/searchPatient.jsp'><span>Patient</span></a></li> --%>
<!-- 			  <li class='last'><a href='#'><span>Sub Product</span></a></li> -->
<!--             </ul> -->
<!--          </li> -->
      </ul>
   </li>
   <li><a href='#'><span>About</span></a></li>
   <li class='last'><a href='#'><span>Contact</span></a></li>
</ul>
</div>
<div>
<% String msg = request.getParameter("msg");
if (!StringUtils.isEmpty(msg)){
	%>
	<div><%=msg %></div>
<% }else{
	
}
%>
</div>
</body>
</html>