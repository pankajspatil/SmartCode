<%@page import="com.org.doctorsonline.login.Login"%>
<%@page import="com.org.doctorsonline.generic.Utils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/header/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String firstName = Utils.getString(request.getParameter("firstName"));
	String middleName = Utils.getString(request.getParameter("middleName"));
	String lastName = Utils.getString(request.getParameter("lastName"));
	String userName = Utils.getString(request.getParameter("userName"));
	String password = Utils.getString(request.getParameter("password"));
	String page1 = request.getParameter("page1");
	
	Boolean userCreated = false;
	
	Login login = new Login();
	Boolean userExist = login.verifyUser(userName);
	if(page1 != null){
	
		if(!userExist){
			userCreated = login.createNewUser(userName, firstName, middleName, lastName, password);
			if(userCreated){
				%>
				<script type="text/javascript">
					alert('New User Created');
					location.href = "/DoctorsOnline/index.jsp";
				</script>
			<%
			}
		}else{%>
				<script type="text/javascript">
					alert('User Alreay exist');
				</script><%
		}
	}

	if(!userCreated){
%>
<form action="" method="post">

<h1 class="moduleHeader">Create User</h1>
<table class="mainTable">
	<tr class="mainTR">
		<td>First Name</td>
		<td><input class="fullText" type="text" id="firstName" name="firstName" value="<%=firstName%>"></td>
	</tr>
	<tr class="mainTR">
		<td>Middle Name</td>
		<td><input class="fullText" type="text" id="middleName" name="middleName" value="<%=middleName%>"></td>
	</tr>
	<tr class="mainTR">
		<td>Last Name</td>
		<td><input class="fullText" type="text" id="lastName" name="lastName" value="<%=lastName%>"></td>
	</tr>
	<tr class="mainTR">
		<td>User Name</td>
		<td><input class="fullText" type="text" id="userName" name="userName" value="<%=userName%>"></td>
	</tr>
	<tr class="mainTR">
		<td>Password</td>
		<td><input class="fullText" type="password" id="password" name="password" value="<%=password%>"></td>
	</tr>
	<tr class="mainTR">
		<td colspan="2"><input type="submit" value="create" name="page1" id="createUser"></td>
		
	</tr>
</table>

</form>
<%

} %>
</body>
</html>