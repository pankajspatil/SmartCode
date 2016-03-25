<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/DoctorsOnline/resources/css/menu.css">
<script src="/DoctorsOnline/resources/js/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="/DoctorsOnline/resources/js/menu.js"></script>
<script src="/DoctorsOnline/resources/js/Map.js"></script>
<script src="/DoctorsOnline/resources/js/constants.js"></script>

<title>Doctor's Online</title>
<link rel="stylesheet" href="/DoctorsOnline/resources/css/generic.css">
<link rel="stylesheet" href="/DoctorsOnline/resources/css/search.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/menu.css">
</head>
<body>
	<div style="border: solid; border-width: 1px; background-color: #3391E7;">
		<img src="/DoctorsOnline/resources/images/header/mainLogo.png" style="height: 140px; width: 181px; float: left;">
		<h1 style="font-size:57px; text-align: center; color: white; font: sans-serif;">Doctor's Online</h1>
		
	</div>
	<%@ include file="/pages/header/menu.jsp"%>
<script type="text/javascript">
	var configObj = <%=getServletContext().getAttribute("config")%>;
</script>
</body>
</html>

<!-- Menu Color : #2d97af -->