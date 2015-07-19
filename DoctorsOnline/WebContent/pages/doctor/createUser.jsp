<%@page import="com.org.doctorsonline.login.Login"%>
<%@page import="com.org.doctorsonline.generic.Utils"%>
<%@page import="com.org.doctorsonline.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/header/header.jsp"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Registration</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
</head>
<body>
	<%
		User user = new User();
		user.setFirstName(Utils.getString(request.getParameter("firstName")));
		user.setMiddleName(Utils.getString(request
				.getParameter("middleName")));
		user.setLastName(Utils.getString(request.getParameter("lastName")));
		user.setDob(Utils.getString(request.getParameter("dob")));
		user.setUid(Utils.getString(request.getParameter("uid")));
		user.setPhone(Utils.getString(request.getParameter("phone")));
		user.setAddress(Utils.getString(request.getParameter("address")));
		user.setGender(Utils.getString(request.getParameter("gender")));
		user.setPinCode(Utils.getString(request.getParameter("pinCode")));

		String page1 = request.getParameter("page1");

		Boolean userCreated = false;

		Login login = new Login();
		Boolean userExist = login.verifyUser(user.getFirstName());
		if (page1 != null) {

			if (!userExist) {
				userCreated = login.createNewUser(user);
				if (userCreated) {
	%>
	<script type="text/javascript">
		alert('New User Created');
		location.href = <%= request.getContextPath() %>+"/pages/home/home.jsp";
	</script>
	<%
		}
			} else {
	%>
	<script type="text/javascript">
		alert('User Alreay exist');
	</script>
	<%
		}
		}

		if (!userCreated) {
	%>
	<form action="" method="post">
		<section class="container">

		<h5 class="moduleHeader" align="center">New Patient Creation</h5>
		<table class="mainTable">
			<tr class="mainTR">
				<td>First Name</td>
				<td><input class="fullText" type="text" id="firstName"
					name="firstName" value="<%=user.getFirstName()%>"></td>
			</tr>
			<tr class="mainTR">
				<td>Middle Name</td>
				<td><input class="fullText" type="text" id="middleName"
					name="middleName" value="<%=user.getMiddleName()%>"></td>
			</tr>
			<tr class="mainTR">
				<td>Last Name</td>
				<td><input class="fullText" type="text" id="lastName"
					name="lastName" value="<%=user.getLastName()%>"></td>
			</tr>
			<tr class="mainTR">
				<td>UID</td>
				<td><input class="fullText" type="text" id="uid" name="uid"
					value="<%=user.getUid()%>"></td>
			</tr>
			<!-- 	<tr class="mainTR"> -->
			<!-- 		<td>Password</td> -->
			<!-- 		<td><input class="fullText" type="password" id="password" name="password" ></td> -->
			<!-- 	</tr> -->
			<tr class="mainTR">
				<td>Phone</td>
				<td><input class="fullText" type="text" id="Phone"
					name="Phone" value="<%=user.getPhone()%>"></td>
			</tr>
			<tr class="mainTR">
				<td>Birth Date (MM/DD/YYYY)</td>
				<td><input class="fullText" type="text" id="dob" name="dob"
					value="<%=user.getDob()%>"></td>
			</tr>
			<tr class="mainTR">
				<td>UserName -UID</td>
				<td><input class="fullText" type="text" id="uid" name="uid"
					value="<%=user.getUid()%>"></td>
			</tr>
			<tr class="mainTR">
				<td>Address</td>
				<td><textarea class="fullText" id="address" name="address"
						size="40" rows="10" cols="50"></textarea></td>
			</tr>
			<tr class="mainTR">
				<td>Gender</td>
				<td><input class="fullText" type="text" id="gender"
					name="gender" value="<%=user.getGender()%>"></td>
			</tr>
			<tr class="mainTR">
				<td>Pin Code</td>
				<td><input class="fullText" type="text" id="pinCode"
					name="pinCode" value="<%=user.getPinCode()%>"></td>
			</tr>
			<tr class="mainTR">
				<td colspan="2" align="center"><input type="submit" value="Create"
					name="page1" id="createUser"></td>

			</tr>
		</table>
		</section>
	</form>
	<%

} %>
</body>
</html>