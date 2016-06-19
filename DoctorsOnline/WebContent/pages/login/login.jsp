<%@page import="com.org.doctorsonline.login.Login"%>
<%@page import="java.sql.Connection,java.util.List"%>
<%@page import="com.org.doctorsonline.generic.ConnectionsUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="stylesheet" href="/DoctorsOnline/resources/css/style.css">
</head>
<body>
<div id="wrap">
	<div id="main">
		<div id="header">
			<%@ include file="/pages/header/header.jsp"%>
</div>
<div id="content">
	<%
	String userName = request.getParameter("userName") == null ? ""
			: request.getParameter("userName");
	String password = request.getParameter("password") == null ? ""
			: request.getParameter("password");
	String page1 = request.getParameter("page1");
	Integer userId = null;

	if (page1 != null && page1.equals("submit")) {
		Login login = new Login();
		userId = login.verifyUser(userName, password);
		if (userId != 0) {
			session.setAttribute("userId", userId);
			List<String> list = login.getUserMenu(userName);
			session.setAttribute("menu", list);
			response.sendRedirect(request.getContextPath()
					+ "/pages/home/home.jsp");
		}
	}
%>

<section class="container">
<div class="login">
	<h1>Login</h1>
	<form method="post" action="">
		<p>
			<input type="text" name="userName" value="<%=userName%>"
				placeholder="Username">
		</p>
		<p>
			<input type="password" name="password" value="<%=password%>"
				placeholder="Password">
		</p>
		<%
			if (userId != null && userId == 0) {
		%><p>
			<label>Wrong username or password</label>
		</p>
		<%
			}
		%>

		<p class="remember_me">
			<label> <input type="checkbox" name="remember_me"
				id="remember_me"> Remember me on this computer
			</label>
		</p>
		<p class="submit">
			<input type="submit" name="commit" value="Login">&nbsp;&nbsp;
			<input style="float: right; text-align: right;" type="button"
				name="signUP" value="SignUp"
				onclick="location.href='/DoctorsOnline/pages/login/createUser.jsp'">
		</p>
		<input type="hidden" name="page1" value="submit" />
	</form>
</div>

<div class="login-help">
	<p>
		Forgot your password? <a href="index.html">Click here to reset
			it</a>.
	</p>
</div>
</section>
<%
	userId = null;
	finalize();
%>
		</div>
	</div>
</div>
<div id="footer"><%@ include file="/pages/header/footer.jsp"%></div>
</body>
</html>