<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Doctor</title>
</head>
<body>
<% String Contextpath = request.getContextPath(); %>
<div id='cssmenu'>
<ul>
   <li><a href='<%=Contextpath %>'><span>Home</span></a></li>
   <li><a href='#'><span>Patient</span></a>
       <ul>
         <li class='has-sub'><a href='#'><span>New</span></a>
            <ul>
               <li><a href='<%=Contextpath %>/pages/login/createUser.jsp'><span>Registration</span></a></li>
<!--                <li class='last'><a href='#'><span>Sub Product</span></a></li> -->
            </ul>
         </li>
         <li class='has-sub'><a href='<%=Contextpath %>/pages/doctor/searchPatient.jsp'><span>Search</span></a>
<!--             <ul> -->
<!--                <li><a href='#'><span>Sub Product</span></a></li> -->
<!--                <li class='last'><a href='#'><span>Sub Product</span></a></li> -->
<!--             </ul> -->
         </li>
      </ul>
   </li>   
   <li class='last'><a href='<%=Contextpath %>/pages/login/logout.jsp'><span>Logout</span></a></li>
</ul>
</div>
</body>
</html>